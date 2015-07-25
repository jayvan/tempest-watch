
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

### Potential Features
- Logging of most common/least common tempests so we can determine how likely each tempest is
- AutoHotkey macro that fetches the tempest for the map under your cursor and displays it in a tooltip
- In game bot that you can report tempests to

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
Version 0 of the API is final. It will not be changed. Version 1 of the API may change until it is marked final.

### V1
V1 is identical to V0 except for the `current_tempest` routes.

#### Current Tempests
Type is one of 'great', 'dangerous', or ''

__GET: http://poetempest.com/api/v1/current_tempests__
```json
{
  "crypt": {
    "name": "Abyssal Tempest of Animation",
    "base": "100% of damage is converted to chaos damage",
    "suffix": "Nearby weapons are animated",
    "votes": 18,
    "type": "dangerous"
  },
  "desert": {
    "name": "unknown",
    "base": "If you enter this map please report which tempest is active",
    "suffix": "",
    "votes": 0,
    "type": ""
  }
}
```

#### Current Tempest for Single Map
__GET: http://poetempest.com/api/v0/current_tempests/:map__
```json
{
  "name": "Abyssal Tempest of Animation",
  "base": "100% of damage is converted to chaos damage",
  "suffix": "Nearby weapons are animated",
  "votes": 12,
  "type": "dangerous"
}
```

### V0
V0 is final, it will not be changed.

#### Vote
__POST: http://poetempest.com/api/v0/vote__

Params:
```json
{
  "map": "dried_lake",
  "base": "static",
  "suffix": "intensity"
  "[api_key]": "Not required. Used to bypass API limits. Contact me if you need one."
}
```

#### Retrieve all tempest bases and suffixes
__GET: http://poetempest.com/api/v0/tempests__
```json
{
  "bases": {
    "abyssal": "100% of damage is converted to chaos damage",
    "arctic": "Casts vaal ice nova, vaal cold snap, frost wall, ice storm, frost bite, lacial cascade and summons an ice golem",
    "blasphemous": "Casts curses"
  },
  "suffixes": {
    "aberrance": "Rare monsters each have a nemesis mod, magic monster packs each have a bloodline mod",
    "angling": "50% increased fish school size",
    "animation": "Nearby weapons are animated"
  }
}
```

#### Retrieve all maps
__GET: http://poetempest.com/api/v0/maps__
```json
{
  "crypt": 68,
  "desert": 68,
  "dunes": 68,
  "dungeon": 68
}
```

#### Current Tempests
__GET: http://poetempest.com/api/v0/current_tempests__
```json
{
  "crypt": {
    "name": "Abyssal Tempest of Animation",
    "base": "100% of damage is converted to chaos damage",
    "suffix": "Nearby weapons are animated"
  },
  "desert": {
    "name": "unknown",
    "base": "If you enter this map please report which tempest is active",
    "suffix": ""
  }
}
```

#### Current Tempest for Single Map
__GET: http://poetempest.com/api/v0/current_tempests/:map__
```json
{
  "name": "Abyssal Tempest of Animation",
  "base": "100% of damage is converted to chaos damage",
  "suffix": "Nearby weapons are animated"
}
```
