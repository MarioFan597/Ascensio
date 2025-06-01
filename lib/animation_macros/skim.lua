local error_messages = {}
function error_messages.skim_invalid_str(key, type, found_string, is_sub) return (
    "Animation macro \"SKIM\": Card "
    .. key
    .. " specifies an incorrect "
    .. type
    .. " \""
    .. found_string
    .. "\""
) end

-- Returns all coordinates within a rectangle
local function coord_rect(coords)
    local x1 = coords.x1
    local x2 = coords.x2
    local y1 = coords.y1
    local y2 = coords.y2

    local coord_list = {}
    local x_inc = x2 >= x1 and 1 or -1
    local y_inc = y2 >= y1 and 1 or -1
    for x = x1,x2,x_inc do for y = y1,y2,y_inc do
        table.insert(coord_list,{["x"]=x,["y"]=y})
    end end
    return coord_list
end

-- Determines if main is equivalent to any of the items in the options sequence
local function string_any(main, options)
    for _,v in ipairs(options) do if main == v then return true end end
    return false
end

-----------------------------------

-- The macro itself
function G.cardanim.animation_macros.skim(macro_obj)
    local seq = {}
    for kw,__ in pairs(G.cardanim.card_layers) do
        -- the "next" function is an emptiness check
        if (not macro_obj[kw]) or next(macro_obj[kw]) == nil then goto skimmacrocontinue end
        seq[kw] = {}

        local err_msg    = error_messages
        local part_table = macro_obj[kw]
        local card_key   = macro_obj.card_key

        local include      = part_table.include     or {}
        local exclude      = part_table.exclude     or {}
        local timing       = part_table.timing      or {1}
        local is_periodic  = part_table.is_periodic or false
        local direction    = part_table.direction   or {"row", "forward", "forward"}


        --[[ DIRECTION DECOMPOSITION:
            default is {"row", "down", "col", "right"}
            row/r -> y, col/c -> x

            (i.e. when "going through each row" you are following the y-axis)
            | row 1
            | row 2    (and "going through each column" you are following the x-axis)
            | row 3    ---------------------------->
            V row 4    col 1   col 2   col 3   col 4
        ]]
        -- ERROR - Do not accept anything other than col, c, row, or r
        if not string_any(direction[1], {"col","c","row","r"}) then
            error(err_msg.skim_invalid_str(card_key, "group type", direction[1], false))
        end
        -- now determine axis
        local iter_axis = string_any(direction[1],{"col","c"}) and "x" or "y"

        -- ERROR - Do not accept anything other than forward, f, backward, or b
        if not string_any(direction[2], {"forward","f","backward","b"}) then
            error(err_msg.skim_invalid_str(card_key, "group direction", direction[2], false))
        end
        if not string_any(direction[3], {"forward","f","backward","b"}) then
            error(err_msg.skim_invalid_str(card_key, "lane direction", direction[3], false))
        end
        -- then determine direction
        local iter_direction    = string_any(direction[2], {"backward","b"}) and -1 or 1
        local subiter_direction = string_any(direction[3], {"backward","b"}) and -1 or 1


        --[[ ACTIVE AREA FORMATION]]
        local active_area = {}

        local function add_to_aa(coords)
            local x = coords.x
            local y = coords.y
            if iter_axis == "x" then
                if not active_area[x] then active_area[x] = {} end
                active_area[x][y] = 1
            elseif iter_axis == "y" then
                if not active_area[y] then active_area[y] = {} end
                active_area[y][x] = 1
            end
        end

        local function remove_from_aa(coords)
            local x = coords.x
            local y = coords.y
            if iter_axis == "x" and active_area[x] then
                active_area[x][y] = nil
            elseif iter_axis == "y" and active_area[y] then
                active_area[y][x] = nil
            end
        end

        -- Add entries
        for _,inc in pairs(include) do
            if inc.x and inc.y then add_to_aa(inc)
            elseif inc.x1 and inc.x2 and inc.y1 and inc.y2 then
                local coord_list = coord_rect(inc)
                for _,v in ipairs(coord_list) do add_to_aa(v) end
            end
        end

        -- Remove entries
        for _,exc in pairs(exclude) do
            if exc.x and exc.y then remove_from_aa(exc)
            elseif exc.x1 and exc.x2 and exc.y1 and exc.y2 then
                local coord_list = coord_rect(exc)
                for _,v in ipairs(coord_list) do remove_from_aa(v) end
            end
        end

        --[[ ADD FRAMES
            This system allows for timer= to be an integer sequence or integer non-sequence
            nils are defaulted to t=1

            For example, timing = {1,2,3,4,5} will show each frame for an increasing amount of time
            while timing = {[5]=5,[7]=2} will keep the 5th frame for 0.5s (or "5 frames"), and the 7th frame for 0.2s

            If is_periodic, non-sequences will still work - nils from 1 before the highest timed frame will be defaulted to t=1
            For example, {4,2,[8]=5} -> {4,2,1,1,1,1,1,5}
            while {[8]=5} -> {1,1,1,1,1,1,1,8} (make every 8th frame last longer)

            That being said, for sake of space, timings shoud NOT be strictly periodic
            (i.e. lcd(highest_timing, #frames) could be a bloody massive number)
            
            For example, given {1,1,1,1,5} over 12 frames, the timing per frame could look like
            {1,1,1,1,5,1,1,1,1,5,1,1} which is not strictly periodic
            (that is, there exists a sequence of six 1-long frames, even though we specified a sequence of four 1-long frames)

            With the above example, a strictly periodic timing sequence would have a length of 60 frames before looping,
            which is overly unnecessary and often not what most artists intend to occur with their designs
        ]]
        -- Rely on this variable instead of #timing
        local highest_timing = 1
        for k,_ in pairs(timing) do if type(k) == "number" and k > highest_timing then highest_timing = k end end

        -- needed for conditional sorting
        local function  normal_sort_dir(a,b) return a < b end
        local function reverse_sort_dir(a,b) return a > b end

        local time_id = 1

        -- Sort the iteration axis keys
        local iter_keys = {}
        for k,_ in pairs(active_area) do table.insert(iter_keys, k) end
        table.sort(iter_keys, iter_direction == -1 and reverse_sort_dir or normal_sort_dir)

        -- then go through iteration axis in order
        for _,i in ipairs(iter_keys) do
            -- Sort the sub-iteration axis keys
            local subiter_keys = {}
            for k,_ in pairs(active_area[i]) do table.insert(subiter_keys, k) end
            table.sort(subiter_keys, subiter_direction == -1 and reverse_sort_dir or normal_sort_dir)

            -- then go through sub-iteration axis in order
            for _,j in ipairs(subiter_keys) do
                local frame_t = timing[time_id] or 1
                if     iter_axis == "x" then table.insert(seq[kw], {x=i, y=j, t=frame_t})
                elseif iter_axis == "y" then table.insert(seq[kw], {x=j, y=i, t=frame_t}) end

                -- if is_periodic then loop back to the start
                if time_id == highest_timing and is_periodic then time_id = 0 end
                -- time_id = 0 will change to 1 with this addition
                time_id = time_id + 1
            end
        end

        ::skimmacrocontinue::
    end
-- The final returned table should be {pos={}, soul_pos={}, soul_pos_extra={}}
return seq end