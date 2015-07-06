
> Tempests can also affect end-game Maps. Because there's no world map for maps, the community will need to collaborate to share information about which valuable tempests affect which areas at the moment.
>
> \- Chris Wilson

# Tempest Watch

Tempest watch is a web app that allows players to report what tempest is active in each end game map for Path of Exile.
When players enter a map and discover which tempest is active, they can report that tempest so that other players know which tempests are active in each map.
This will help you know which end game maps are currently rewarding, and which are dangerous.
You can also use this tool to help complete the challenges involving tempests!

## Features
- Lists each map with it's currently active tempest
- Lets you report tempests you encounter so other players can know

### Features required by Awakening
- Clear the tempest data hourly since the tempests move

### Potential Features
- Require more than 1 vote for a tempest before it is listed. This would make tempest locations take a while longer to display, but when they do display, we would have higher confidence in them.
- Limit the number of times a single IP address can vote. This would prevent a single player from purposely misreporting tempests to tamper with the data
- Logging of most common/least common tempests so we can determine how likely each tempest is
- AutoHotkey macro that fetches the tempest for the map under your cursor and displays it in a tooltip

## Installation
### Pre-requisites
1. redis
2. ruby 2.2.2
3. bundler

### Installation
1. `git clone git@github.com:jayvan/tempest-watch.git`
2. `cd tempest-watch`
2. `bundle install`
3. `unicorn`

## Contribution
Contributions to this project are always welcome. If you have a great idea that will improve Tempest Tracker please submit a pull request.
Collaborations are great too, if you are thinking of making a tool that interacts with Tempest Tracker (e.g. an AutoHotkey macro), and need a new API or feature open an issue and I'll get it added.

## API
Until we know exactly how tempests work, expect there to be some changes to the API including the routes and the return formats. If you are working on tools that integrate with tempest-watch just be aware these are subject to change until a few days after the awakening has released!

#### Vote
__POST: http://poetempest.com/api/vote__

Params:
```json
{
  "map": "dried_lake",
  "tempest": "bounty"
}
```

#### All Maps
__GET: http://poetempest.com/api/tempests__
```json
{
  "crypt":{
    "name":"Tempest of Bounty",
    "monster_bonus":"50% increased number of items dropped",
    "player_bonus":"50% increased rarity of items obtained"
  },
  "dungeon":{
    "name":"None",
    "message":"No tempest is active in this area"
  },
  "grotto":{
    "name":"Unknown",
    "message":"If you enter this map please report which tempest is active"
  }
}
```
#### Single Map
__GET: http://poetempest.com/api/tempests/:map__

Map is the downcased name of the map, with spaces converted to underscores, .e.g 'Tropical Island' becomes `tropical_island`
```json
{
  "name":"Tempest of Bounty",
  "monster_bonus":"50% increased number of items dropped",
  "player_bonus":"50% increased rarity of items obtained"
}
```
