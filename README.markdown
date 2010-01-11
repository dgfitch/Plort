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

Room A, containing a locked door and a gun.
Room B, containing a potential encounter of medium difficulty, connecting rooms A and C.
Room C, containing a giant spider that drops a key when killed.
Room D, on the other side of the locked door.


#### Hardship, current

The likelihood of a player, in their current state, of satisfying or completing a given PPoint.

#### Accessibility

The likelihood [0-1] that a player can successfully reach an LPoint, given the current Plot state. Not calculated continuously, only when plot changes are triggered or required.

At the beginning of the example, this would be 0 for Room D and 0.2 for Room C. When the player picks up the gun, it would go up for room C.

#### Plot

The directed graph of PPoints and the directed graph of LPoints, connected by the various types of arcs. Encompasses all currently-possible "stories" that can be told, and the state of the physical and potential worlds. 

I'm not sure if the two graphs of PPoints and LPoints are going to be interconnected; do PPoints need to 

#### PPoint

A past or future plot point. Contains:
    - a success-checking condition
    - a success closure [When successful, becomes a "past" point.]
    - incoming PArcs (dependencies) 
    - outgoing PArcs (continuations)
    - outgoing LArcs (the places in game space where a plot point is active)

#### PArc

A dependency between two PPoints. Can be loose or strict. For example, the door opening is strictly dependent on the player having the key. Something that relies on player skill or random chance is a loose dependency. (I'm not sure this distinction is necessary, but at one point it seemed like it...)

#### LPoint

A location in game space, on the order of a room or "area".

#### LArc

A connection between locations in game space. 


## Libraries

  - telescope: http://telescope.luaforge.net/
  - love: http://love2d.org/


## Misc

License is Creative Commons Attribution-Noncommercial-Sharealike 3.0 US

http://creativecommons.org/licenses/by-nc-sa/3.0/us/

