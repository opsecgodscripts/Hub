--[[
	RuneSlayer animations

	Each group is a class (shown in Auto Parry > Config). The group's facing / range / angle / type are
	the defaults for every move inside it; a move can set its own to override them.

	  facing  "FRWD" = they have to be facing you
	          "BACK" = the hitbox is behind them, you have to be behind them
	          "AOE"  = hits all around, no facing check
	  angle   how far off (degrees) they can be looking and still count (FRWD / BACK)
	  range   studs; used while "Use General Range" is off
	  type    "parry" presses F, "dodge" presses Q
	  t       seconds after the animation starts to press the key: t = 0.4, or several: t = { 0.3, 0.6 }
	  id      the animation id: id = "123" (or several: id = { "123", "456" })

	id = "1" is a placeholder and is skipped: replace it with the real id.
]]

return {
    Fist = {
        facing = "FRWD", -- default facing for everything in Fist
        range = 15,      -- default range for everything in Fist
        angle = 70,      -- default angle for everything in Fist
        type = "parry",  -- default key for everything in Fist

        M1 = { id = "1", t = 0.3 },
        M2 = { id = "1", t = 0.3 },
        Heavy = { id = "1", t = 0.5 },
        Special = { id = "1", t = 0.5, type = "dodge" },
    },
}
