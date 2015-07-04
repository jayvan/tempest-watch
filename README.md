
> Tempests can also affect end-game Maps. Because there's no world map for maps, the community will need to collaborate to share information about which valuable tempests affect which areas at the moment.
> 
> \- Chris Wilson

# Tempest Watch

Tempest watch is a web app that allows players to report what tempest is active in each end game map for Path of Exile.
When players enter a map and discover which tempest is active, they can report that tempest so that other players know which tempests are active in each map.
This will help you know which end game maps are currently rewarding, and which are dangerous.
You can also use this tool to help complete the challenges involving tempests!

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

## API
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
