# *Lightning API Documentation*

Product Owners are eligible to purchase our extended API for £10 or $13 (one time payment, forever) and be able to use our Booster, Ranking and Roblox to Discord API.  

## API Keys

API Keys must be kept private and stored carefully.  We automatically generate your key upon payment.  You are entitled to have this changed by our Support Team in the event of leakage.

## Ratelimits

Requests are rate limited by 250 requests in a 10 second window.  This could be changed at any time.

## Features

- Retrieve a Discord account by providing a Roblox user ID
- Update a group member's rank
- Retrieve an array of discord server boosters



# *Endpoints*

## Get Discord Boosts

> Endpoint: /v1/boosters/:guildId?key=apiKeyHere

> Method: GET

> Headers: Content-Type application/json

#### Javascript
```javascript
fetch(`https://api.lightningbot.net/v1/boosters/743236357274468483?key=X2y3t5O2l4owEIhahXvx`, {
method: 'GET',
headers: { 'Content-Type':'application/json' }
}).then(response => response.json()).then(json => {
// json.boosters
})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("X2y3t5O2l4owEIhahXvx")
local BoosterArray = Lightning:retrieveBoosters("743236357274468483")
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
fetch(`https://api.lightningbot.net/v1/verifications/82088531?key=X2y3t5O2l4owEIhahXvx`, {
method: 'GET',
headers: { 'Content-Type':'application/json' }
}).then(response => response.json()).then(json => {
// json.user
})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("X2y3t5O2l4owEIhahXvx")
local DiscordUser = Lightning:robloxToDiscord("82088531")
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
  boosters: []
}
```











## Set Roblox Rank

> Endpoint: /v1/roblox/rank?key=apiKeyHere

> Method: PATCH

> Body: robloxId rankId guildId

> Headers: Content-Type application/json

#### Javascript
```javascript
fetch(`https://api.lightningbot.net/v1/roblox/rank?key=X2y3t5O2l4owEIhahXvx`, {
method: 'GET',
body: JSON.stringify({
  robloxId: "82088531",
  rankId: "254",
  guildId: "743236357274468483"
})
headers: { 'Content-Type':'application/json' }
}).then(response => response.json()).then(json => {

})
```
#### Roblox Module
```lua
local Lightning = require(8947048183)("X2y3t5O2l4owEIhahXvx")
Lightning:setGroupRank("82088531", "743236357274468483", "254")
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
