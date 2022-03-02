--[[

		⚡🔋 Lightning Systems 🌟✨
	
	Do not resell or steal the containing code
	Lightning Systems Ltd is not responsible for any damage that may occur if you modify the components
	
	Our Website				🔗  https://lightningbot.net/
	Our Privacy Policy		🔗	https://lightningbot.net/privacy/en/privacy-policy/
	Our Terms of Service	🔗	https://lightningbot.net/terms/
	Our Discord				🔗	https://discord.gg/lightning
	
	Documentation           🔗  https://github.com/Lightning-UK/API-Docs
	
	Lightning Systems Ltd, Company Number 08436270
	
	Made with ♥ in the United Kingdom

--]]

local HTTP_SERVICE = game:GetService("HttpService");
local PLAYER_SERVICE = game:GetService("Players");
local REPLICATED_STORAGE = game:GetService("ReplicatedStorage");

local BASE_URL = "https://api.lightningbot.net";
local ENCODE = function(json)
	return HTTP_SERVICE:JSONEncode(json)
end
local DECODE = function(json)
	return HTTP_SERVICE:JSONDecode(json)
end
local HTTP_ENABLED = function()
	local value = false;
	pcall(function()
		if HTTP_SERVICE:GetAsync("https://www.google.com/") then
			value = true;
		end
	end)
	return value
end
local GET = function(path)
	local err, response = pcall(function()
		return HTTP_SERVICE:RequestAsync({
			Method = "GET",
			Url = BASE_URL .. path,
			Headers = {["Content-Type"]="application/json"},
		})
	end)
	if err then
		warn("[Lightning API Services]: Some requests failed, the API might be down")
	end
	return DECODE(response.Body)
end
local PATCH = function(path, body)
	local err, response = pcall(function()
		return HTTP_SERVICE:RequestAsync({
			Method = "PATCH",
			Url = BASE_URL .. path,
			Headers = {["Content-Type"]="application/json"},
			Body = ENCODE(body)
		})
	end)
	if err then
		warn("[Lightning API Services]: Some requests failed, the API might be down")
	end
	return DECODE(response.Body)
end
local DELETE = function(path, body)
	local err, response = pcall(function()
		return HTTP_SERVICE:RequestAsync({
			Method = "DELETE",
			Url = BASE_URL .. path,
			Headers = {["Content-Type"]="application/json"},
			Body = ENCODE(body)
		})
	end)
	if err then
		warn("[Lightning API Services]: Some requests failed, the API might be down")
	end
	return DECODE(response.Body)
end

return function(apiKey)
	if not HTTP_ENABLED() then 
		return warn("[Lightning API Services]: API services cannot function if HttpService is disabled")
	end
	
	local myApi = GET("/v1/api?key=" .. apiKey)
	if myApi.success == false then
		return warn("[Lightning API Services]: You are not authorised to use this product")
	end
	
	warn("[Lightning API Services]: Ready")
	
	local functions = {}
	function functions:setGroupRank(robloxId, guildId, rankId)
		local response = PATCH("/v1/roblox/rank?key=" .. apiKey, {
			robloxId = robloxId,
			rankId = rankId,
			guildId = guildId
		})
		if response.success then
			return response
		else
			warn("[Lightning API Services]: Failed to set rank " .. response.reason)
			return response
		end
	end
	function functions:robloxToDiscord(robloxId)
		local response = GET("/v1/verifications/" .. robloxId .. "?key=" .. apiKey, {

		})
		return response
	end
	function functions:retrieveBoosters(guildId)
		local response = GET("/v1/boosters/" .. guildId .. "?key=" .. apiKey, {

		})
		return response
	end

	return functions
end
