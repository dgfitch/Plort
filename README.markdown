# PLORT

Another primitive testbed for a game concept, this time with intent to make three interfaces to the "gameplay":

  1. Text adventure
  2. Roguelike
  3. Realtime physics sim

## Dev

To run the specs, you may need to install telescope via luarocks to get the dependencies, even though a copy is included here.

Then, `make test` should do it -- using different launchers for different platforms


## Glossary

Given the following setting:

> - Room A, containing a locked door and a gun.
> - Room B, containing a potential encounter of medium difficulty, connecting rooms A and C.
> - Room C, containing a giant spider that drops a key when killed.
> - Room D, on the other side of the locked door.


#### Plot

The game state: a directed graph of PPoints and an undirected graph of LPoints, connected by the various types of arcs. Encompasses all currently-possible "stories" that can be told, and the state of the physical and potential worlds. 

I'm not sure if the two graphs of PPoints and LPoints are going to be interconnected; _do LPoints need to know about their PPoints?_

#### Condition

An object that returns true or false given a game state.

> Is the spider dead?

#### Consequence

An object that modifies game state in a certain way.

> Generate a key in the world where the spider died.

#### Trigger

A pair of a condition and a consequence.

> Given the above condition and consequence examples, the trigger is the sort of thing that generates a key on the ground when the spider dies.

#### Preparation

An object which prepares the game state in a certain way.

> See below for examples...

#### Prerequisite

A pair of a preparation and a condition.

> ... 

#### PrerequisiteList

One or more prerequisites.

> There may be a number of prerequisites for a particular plot to complete. Uhh, example pending.

#### PPoint

A past or future plot point. Contains:

  - a table of PrerequisiteLists (incoming things that could cause this plot point to occur)
  - a list of Triggers (outgoing thing[s] that this plot point could cause)
  - a list of LPoints (the place[s] in game space where a plot point is active)

> In the example, there might be the following PPoints:
> - Spider: 
>   - Trigger: When spider is dead, drop key
>   - Trigger: When spider captures player, start "webbed" subplot
>   - Trigger: When player is behind spider, steal key into player's inventory
> - Random Encounter in Room B:
>   - Prerequisites: When spider is alive, player has key, and player is in good health, create a random enemy in Room B
>   - Trigger: When player is close, enemy calls spider in as backup
>   - Trigger: When enemy dies, spider rushes in to eat corpse

#### LPoint

A location in game space, on the order of a room or "area".

#### LArc

A connection between locations in game space. 

#### Hardship, current

The likelihood of a player, in their current state, satisfying or completing a given PPoint.

#### Accessibility

The likelihood [0-1] that a player can successfully reach an LPoint, given the current Plot state. Not calculated continuously, only when plot changes are triggered or required.

> At the beginning of the example, this would be 0 for Room D and 0.2 for Room C. When the player picks up the gun, it would go up for room C.


#### Pending ideas

  - Conversations?
  - Actors? Motivations of actors?


## Libraries

  - telescope: http://telescope.luaforge.net/
  - love: http://love2d.org/


## Misc

License is Creative Commons Attribution-Noncommercial-Sharealike 3.0 US

http://creativecommons.org/licenses/by-nc-sa/3.0/us/

