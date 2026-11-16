--[[
	Hub - loads the right script for the game you're in.

	Run this one file in any game:

	  loadstring(game:HttpGet("https://raw.githubusercontent.com/opsecgodscripts/Hub/refs/heads/main/Hub.lua"))()

	It looks up the game in GAMES below and runs <folder>/Main from this repo.
	To add a game: use the folder name (exactly as on GitHub) and list every id it should load for.
	Either id works: place ids (the number in the game's URL, one per place / server type) or the
	game / universe id.
]]

local GAMES = {
	Plenilune = {
		18563654875,
	},
	-- Deepwoken = { -- add Deepwoken's ids here once Deepwoken/Main has a script
	-- 	1234567890,
	-- 	1234567891,
	-- },
}

-- id -> folder
local byId = {}
for folder, ids in pairs(GAMES) do
	for _, id in ipairs(ids) do
		local n = tonumber(id)
		if n then
			if byId[n] and byId[n] ~= folder then
				print(string.format("[Hub] id %d is listed under both %s and %s; using %s", n, byId[n], folder, byId[n]))
			else
				byId[n] = folder
			end
		end
	end
end

local REPO = "https://raw.githubusercontent.com/opsecgodscripts/Hub/refs/heads/main/"
local TAG = "[Hub]"
local warn = warn or print

-- Matcha keeps showing errors but does not stop the script after error(), so each failure
-- below prints a message and returns.
local function readId(name)
	local ok, id = pcall(function()
		return game[name]
	end)
	return ok and tonumber(id) or nil
end

local placeId, gameId = readId("PlaceId"), readId("GameId")
local folder = (placeId and byId[placeId]) or (gameId and byId[gameId])
if not folder then
	warn(string.format("%s this game isn't supported (place id %s, game id %s)", TAG, tostring(placeId), tostring(gameId)))
	return
end

-- "?t=..." skips GitHub's cache, which can hand out an old copy for a few minutes after a push
local url = REPO .. folder .. "/Main?t=" .. tostring(os.time())
local ok, source = pcall(function()
	return game:HttpGet(url)
end)
if not ok or type(source) ~= "string" or not source:find("%S") or source:match("^%s*404:") then
	warn(TAG .. " couldn't download " .. folder .. "/Main: " .. tostring(ok and "file is empty or missing" or source))
	return
end

local chunk, compileError = loadstring(source)
if type(chunk) ~= "function" then
	warn(TAG .. " " .. folder .. "/Main has a syntax error: " .. tostring(compileError))
	return
end

print(TAG .. " loading " .. folder)
local ran, result = pcall(chunk)
if not ran then
	warn(TAG .. " " .. folder .. "/Main errored: " .. tostring(result))
	return
end
return result
