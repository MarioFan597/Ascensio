--- Event
---@class AscEventBase
--- The body of the event. This is where you will perform any actions or custom delays.
--- Once the event starts, this will be run once per frame until it returns true.
--- This can be omitted without consequence.
---@field func?        fun(...: any): boolean?
--- Whether or not this event may block other events. Default is `true`.
---@field blocking?    boolean
--- Whether or not this event may be blocked by other events. Default is `true`.
---@field blockable?   boolean
--- The time to take, in seconds. Used for `"after"`, `"ease"` and `"before"`. This value is typically affected by the game speed option. Default is `0`.
---@field delay?       number
--- Set this to a key in `G.TIMERS` to use a different timer than the standard one. If `pause_force` was set, this defaults to `'REAL'`, otherwise it defaults to `'TOTAL'`.
---@field timer?       "REAL" | "TOTAL" | string
--- Set to `true` to start the time component of a `"before"` or `"after"` event immediately, instead of when the event starts.
---@field start_timer? boolean
--- Set to `true` to prevent the event from being deleted by `clear_queue`.
---@field no_delete?   boolean
--- Set to `true` to force this event to act as though it were created while the game was paused. Events without this will pause when the game is paused.
---@field pause_force? boolean

---@class AscEventStd: AscEventBase
--- How the event is triggered:
--- - `"immediate"` - Runs as soon as possible.
--- - `"after"` - Runs after a set amount of time specified in `delay`
--- - `"before"` - Runs as soon as possible. Events after this one wait for both `func` and `delay`, whichever takes longer to finish.
---@field trigger? "immediate" | "after" | "before"

---@class AscEventCond: AscEventBase
---@field trigger   "condition"
---@field ref_table table<string, any>
---@field ref_value string
---@field stop_val  any

---@class AscEventEase: AscEventBase
---@field trigger   "ease"
---@field ref_table table<string, any>
---@field ref_value string
---@field ease_to   number
---@field ease?     "lerp" | "elastic" | "quad"

---@alias AscEvent AscEventStd | AscEventCond | AscEventEase

---@param event AscEvent | balatro.Event.Config
function Ascensio.addEvent(event)
    G.E_MANAGER:add_event(Event(event))
end
