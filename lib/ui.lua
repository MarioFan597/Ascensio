-- Third Layer for cards
-- Taken straight from cryptid
SMODS.DrawStep({
    key = "floating_sprite2",
    order = 59,
    func = function(self)
        if self.ability.name == "cry-Gateway" and (self.config.center.discovered or self.bypass_discovery_center) then
            local scale_mod2 = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod2 = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
            self.children.floating_sprite2:draw_shader(
                "dissolve",
                0,
                nil,
                nil,
                self.children.center,
                scale_mod2,
                rotate_mod2,
                nil,
                0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
                nil,
                0.6
            )
            self.children.floating_sprite2:draw_shader(
                "dissolve",
                nil,
                nil,
                nil,
                self.children.center,
                scale_mod2,
                rotate_mod2
            )

            local scale_mod = 0.05
                + 0.05 * math.sin(1.8 * G.TIMERS.REAL)
                + 0.07
                    * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) * math.pi * 14)
                    * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            local rotate_mod = 0.1 * math.sin(1.219 * G.TIMERS.REAL)
                + 0.07
                    * math.sin(G.TIMERS.REAL * math.pi * 5)
                    * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            self.children.floating_sprite.role.draw_major = self
            self.children.floating_sprite:draw_shader(
                "dissolve",
                0,
                nil,
                nil,
                self.children.center,
                scale_mod,
                rotate_mod,
                nil,
                0.1 + 0.03 * math.sin(1.8 * G.TIMERS.REAL),
                nil,
                0.6
            )
            self.children.floating_sprite:draw_shader(
                "dissolve",
                nil,
                nil,
                nil,
                self.children.center,
                scale_mod,
                rotate_mod
            )
        end
        if
            self.config.center.soul_pos
            and self.config.center.soul_pos.extra
            and (self.config.center.discovered or self.bypass_discovery_center)
        then
            local scale_mod = 0.07 -- + 0.02*math.cos(1.8*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*14)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
            local rotate_mod = 0 --0.05*math.cos(1.219*G.TIMERS.REAL) + 0.00*math.cos((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2
            if self.children.floating_sprite2 then
                self.children.floating_sprite2:draw_shader(
                    "dissolve",
                    0,
                    nil,
                    nil,
                    self.children.center,
                    scale_mod,
                    rotate_mod,
                    nil,
                    0.1 --[[ + 0.03*math.cos(1.8*G.TIMERS.REAL)--]],
                    nil,
                    0.6
                )
                self.children.floating_sprite2:draw_shader(
                    "dissolve",
                    nil,
                    nil,
                    nil,
                    self.children.center,
                    scale_mod,
                    rotate_mod
                )
            else
                local center = self.config.center
                if _center and _center.soul_pos and _center.soul_pos.extra then
                    self.children.floating_sprite2 = Sprite(
                        self.T.x,
                        self.T.y,
                        self.T.w,
                        self.T.h,
                        G.ASSET_ATLAS[_center.atlas or _center.set],
                        _center.soul_pos.extra
                    )
                    self.children.floating_sprite2.role.draw_major = self
                    self.children.floating_sprite2.states.hover.can = false
                    self.children.floating_sprite2.states.click.can = false
                end
            end
        end
    end,
    conditions = { vortex = false, facing = "front" },
})
SMODS.draw_ignore_keys.floating_sprite2 = true