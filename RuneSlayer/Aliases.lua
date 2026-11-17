--[[
	RuneSlayer aliases: the names the ESP (and the logs) show for things in workspace.Alive.

	The number the game adds to the end of a name is always dropped first:
	  "Lesser Skeleton.2", "Lesser Skeleton.17" ... all show as "Lesser Skeleton"
	so you don't need an entry just for that.

	To show something under a different name, add a line:
	  ["name in workspace, without the .number"] = "name to show",
]]

return {
    ["Lesser Skeleton"] = "Lesser Skeleton",
}
