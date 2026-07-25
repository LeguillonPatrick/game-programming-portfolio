# Modular Dungeon Generator<br>
Reusable procedural dungeon generator written in GameMaker Language (GML).

Created to demonstrate my programming skills and share my modular dungeon generator 

This system creates a dungeon with rooms connected by door objects, the exit is a boss room and it can also generate bonus rooms

## Algorithm :
1. Create the configuration
2. Generate the main path
3. Generate the main path
4. Generate the main path

## Configuration : 
you can modifiy all parameters for the function createDungeonConfig essentially parameters 
- maxRooms : max number of roomObject the functions can create<br>
- bonusRooms : max number of bonusRoomObject the functions can create<br>
- roomDistance : distance between two rooms<br>
- doorObject : door object used to connect  two rooms<br>
- roomObject : object of a room<br>
- bossRoomObject : object of a boss room and the end of the level<br>
- bonusRoomObject : object of a bonus room<br>
- parentRoomObject : Parent object shared by every room type, used to detect existing rooms during generation<br>

## Exemples :

Two examples with 10 maximum rooms and 2 bonus rooms<br>
<img width="443" height="381" alt="16791710531110043648_17" src="https://github.com/user-attachments/assets/49004fcd-7b84-4a9d-b78c-a6e2a05af7f3" />
<img width="382" height="353" alt="16791710531110043648_18" src="https://github.com/user-attachments/assets/6cc4d897-7d54-4507-8b33-e50ff18ee3e2" /><br>
Two examples with 6 maximum rooms and 2 bonus rooms<br>
<img width="345" height="323" alt="16791710531110043648_19" src="https://github.com/user-attachments/assets/51543b9f-ca45-419d-94bb-5ddb17dbc874" />
<img width="219" height="340" alt="16791710531110043648_20" src="https://github.com/user-attachments/assets/6b8bebcc-232b-4856-a145-9781fe1c80ae" />

## Project Structure : 
`createDungeonConfig()` creates a configuration struct<br>
`randomDirection()` returns a struct indicating a random direction<br>
`tryCreateRoom()` attempts to create a room<br>
`generateDungeon()` generates a level based on the provided configuration <br>

## Usage :
To use the system, you need the following functions:
1. create a struct config with `createDungeonConfig(...)` 
2. use `generateDungeon(...)` with the struct config we have create

## Purpose :

This repository contains a reusable dungeon generation system extracted and refactored from one of my personal game projects.<br>
Its goal is to demonstrate procedural generation and clean GameMaker architecture.

## Skills demonstrated :

- Procedural generation
- Software architecture
- Modular programming
- Configuration-driven design
- GameMaker Language (GML)
- Code documentation
