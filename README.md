# *Lightning API Documentation*

Product Owners are eligible to purchase our extended API for £10 or $13 (one time payment, forever) and be able to use our Booster, Ranking and Roblox to Discord API.  

In line with our Terms of Service and Privacy Policy.

## API Keys

API Keys must be kept private and stored carefully.  We automatically generate your secure key upon payment.  You are entitled to have this changed by our Support Team in the event of leakage or if you think you need it changed.

## Ratelimits

This is a paid product therefore we want to give users the most maximum and efficient number of requests possible.  Ratelimits are measured through Internet Protocols.  You can send 65 requests within a 1 minute window (this is measured per route).

## Support

You can contact our 24/7 support team via discord.gg/lightning should you have any problems or concerns.


## Features

- Use our database with over tens of thousands of verification records to reversefind Roblox > Discord
- Update your group members roblox ranks
- Retrieve an array of discord server boosters


## Use Cases

- Create a rank GUI in your Roblox game
- Create a filter that blocks unverified users from accessing your game
- Use the reversefind API to give users booster perks in your game


## Roblox Integration

For those looking to integrate this feature within your Roblox games, we have created a special module to load into your places.
All you need is to insert this line into a Script and the module will automatically load.
Ensure that HTTP Service is enabled!

```lua
local Lightning = require(8947048183)("ApiKeyHere")
```

Refer to the endpoints in the next section for use methods


# *Endpoints*

## Get Discord Boosts

> Endpoint: /v1/boosters/:guildId?key=apiKeyHere

> Method: GET

> Headers: Content-Type application/json

#### Javascript
```javascript
fetch(`https://api.lightningbot.net/v1/boosters/guildIdHere?key=apiKeyHere`, {
  method: 'GET',
  headers: { 'Content-Type':'application/json' }
}).then(response => response.json()).then(json => {
// json.boosters
})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("apiKeyHere")
local BoosterArray = Lightning:fetchBoostersFromGuild("guildIdHere")
```

#### Example Success Response
```javascript
{
  success: true,
  reason: "",
  boosters: [
    {
      id: "520700661902475264",
      tag: "Ben#9651",
      username: "Ben"
    }
  ]
}
```

#### Example Error Response
```javascript
{
  success: false,
  reason: "No data",
  boosters: []
}
```










## Roblox To Discord Search

> Endpoint: /v1/verifications/:robloxId?key=apiKeyHere

> Method: GET

> Headers: Content-Type application/json

#### Javascript
```javascript
fetch(`https://api.lightningbot.net/v1/verifications/robloxUserIdHere?key=apiKeyHere`, {
  method: 'GET',
  headers: { 'Content-Type':'application/json' }
}).then(response => response.json()).then(json => {
  // json.user
})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("apiKeyHere")
local DiscordUser = Lightning:fetchDiscordFromRoblox("robloxUserIdHere")
```

#### Example Success Response
```javascript
{
  success: true,
  user: {
    username: "btxmn",
    robloxId: "82088531",
    discordId: "533615187530612751",
    discordTag: "tom,#0546"
  } 
}
```

#### Example Error Response
```javascript
{
  success: false,
  reason: "There is no account linked with this Roblox user",
}
```











## Set Roblox Rank

> Endpoint: /v1/roblox/rank?key=apiKeyHere

> Method: PATCH

> Body: robloxId rankId guildId

> Headers: Content-Type application/json

#### Javascript
```javascript
fetch(`https://api.lightningbot.net/v1/roblox/rank?key=apiKeyHere`, {
  method: 'GET',
  headers: { 'Content-Type':'application/json' },
  body: JSON.stringify({
    robloxId: "robloxUserIdHere",
    rankId: "rankIdHere",
    guildId: "guildIdHere"
  })
}).then(response => response.json()).then(json => {

})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("apiKeyHere")
Lightning:setGroupRank("robloxUserIdHere", "guildIdHere", "rankIdHere")
```

#### Example Success Response
```javascript
{
  success: true,
  reason: "The user was ranked",
  roblox: "The user was ranked"
}
```

#### Example Error Response
```javascript
{
  success: false,
  reason: "Bad Request",
  roblox: "You do not have access to manage this user."
}
```
