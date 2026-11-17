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

	Moves with several hits that reach differently (a short stomp, then a long swing) can give each hit
	its own range / facing / angle / type. Each hit is checked on its own, and a hit's own range is
	used even while "Use General Range" is on:
	  Homerun = { id = "123", hits = {
	      { t = 0.6, range = 10 },                  -- stomp
	      { t = 1.2, range = 25, facing = "AOE" },  -- swing
	  } },
	  or shorter, one range per timing in the same order:
	  Homerun = { id = "123", t = { 0.6, 1.2 }, range = { 10, 25 } },
]]

return {
    LesserSkeleton = {
        facing = "FRWD", -- default facing for everything in Fist
        range = 15,      -- default range for everything in Fist
        angle = 70,      -- default angle for everything in Fist
        type = "parry",  -- default key for everything in Fist
		
        RightPunch = { id = "135903732688268", t = 0.275 },
        LeftPunch = { id = "107381959802983", t = 0.3 },
        Kick = { id = "135803859558995", t = 0.35 },
		Slam = { id = "89849770926059", t = 0.625 },
	},
    GoblinChampion = {
        facing = "FRWD", -- default facing for everything in Fist
        range = 15,      -- default range for everything in Fist
        angle = 70,      -- default angle for everything in Fist
        type = "parry",  -- default key for everything in Fist

        LeftSwing = { id = "14887593177", t = 0.5, range = 38 },
		Stomp = { id = "14889087499", t = 0.6 },
		Homerun = { id = "14887780810", hits = {
			{ t = 0.6, range = 30 },
			 { t = 1.2, range = 35 }, 
		} },
		LeapingSlash = { id = "14886897726", t = 1 },
		KneelingSlash = { id = "14886832498", t = 1.1, range = 40 },
		BackSlash = { id = "14890884041", t = 0.275, facing = "BACK" },
		RagingDemon = { id = "14888911999", hits = {
			{ t = 1, range = 35 },
			{ t = 2, range = 35 },
			{ t = 2.5, range = 34 },
		} },
	},
    MandrakeKing = {
        facing = "FRWD", -- default facing for everything in Fist
        range = 15,      -- default range for everything in Fist
        angle = 70,      -- default angle for everything in Fist
        type = "parry",  -- default key for everything in Fist

        BellyFlop = { id = "13984806725", t = 1 },
        Punches = { id = "13984923525", hits = {
			{ t = 0.4, range = 15 },
			{ t = 0.6, range = 15 },
		} },
		Screetch = { id = "13984524915", t = { 0.5, 0.6, 0.7, 0.8 }, facing = "AOE" },
	},



	
}
