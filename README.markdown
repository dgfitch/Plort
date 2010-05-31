# PLORT

Another primitive testbed for generative plot.

## Dev

You will need Ant, Scala, and a recent Pulpcore nightly.

You may also need sbt: http://code.google.com/p/simple-build-tool/


## Glossary

Given the following setting:

> - Room A, containing a locked door and a gun.
> - Room B, containing a potential encounter of medium difficulty, connecting rooms A and C.
> - Room C, containing a giant spider that drops a key when killed.
> - Room D, on the other side of the locked door in room A.


### Plot

The game state: a set of StatePoints, their interconnections, and their PlotPoints for determining state changes.

### StatePoint

A node of the gamestate. This can be a room, a door, an open door, a key, etc. An obstacle or an opportunity. Anything the player can see and optionally interact with.

Contains:

  - A list of PlotPoints
  - A list of connections to other StatePoints
  - Whether the player has "seen" this node yet

Might need to contain:

  - Hardship: how difficult it is for a given player/gamestate to activate this node


### PlotPoint

Composed of a Condition, a Consequence, and an optional Preparation

> Given the above condition and consequence examples, the PlotPoint is the sort of thing that generates a key on the ground when the spider dies.

### Condition

An object that returns true or false given a game state.

> Is the spider dead?

### Consequence

An object that modifies game state in a certain way.

> Generate a key in the node where the spider died.

### Preparation

An object which prepares the game state in a certain way. Some preparations only happen once. Some are reusable.

> PENDING

## Old ideas:

#### Hardship

The likelihood of a player, in their current state, satisfying or completing a given PlotPoint.

#### Accessibility

The likelihood [0-1] that a player can successfully reach a StatePoint, given the current Plot state. Not calculated continuously, only when plot changes are triggered or required.

> At the beginning of the example, this would be 0 for Room D and 0.2 for Room C. When the player picks up the gun, it would go up for room C.


## Pending ideas

  - Conversations?
  - Actors? Motivations of actors?


## Misc

License is Creative Commons Attribution-Noncommercial-Sharealike 3.0 US

http://creativecommons.org/licenses/by-nc-sa/3.0/us/

