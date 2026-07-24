Modular Dungeon Generator<br>
Reusable procedural dungeon generator written in GameMaker Language (GML).

created to show my ability in programming and share my modular dungeon generator 

this function create a dungeon with room connected by door objects, the exit is a boss room and you can add bonus room also

algo :<br>
1.create config<br>
2.create main path<br>
3.create boss room<br>
4.create the other room upon the max room is reached also create extra connections<br>

config : 
you can modifiy all parameters for the function createConfig essentially parameters {<br>
  maxRooms : max number of roomObject the functions can create<br>
  bonusRooms : max number of bonusRoomObject the functions can create<br>
  roomDistance : distance between two rooms<br>
  doorObject : door object used to connect  two rooms<br>
  roomObject : object of a room<br>
  bossRoomObject : object of a boss room and the end of the level<br>
  bonusRoomObject : object of a bonus room<br>
  parentRoomObject : Parent object shared by every room type, used to detect existing rooms during generation<br>
}

Two exemple with 10 max rooms et 2 bonus rooms<br>
<img width="443" height="381" alt="16791710531110043648_17" src="https://github.com/user-attachments/assets/49004fcd-7b84-4a9d-b78c-a6e2a05af7f3" />
<img width="382" height="353" alt="16791710531110043648_18" src="https://github.com/user-attachments/assets/6cc4d897-7d54-4507-8b33-e50ff18ee3e2" /><br>
Two exemple with 6 max rooms et 2 bonus rooms<br>
<img width="345" height="323" alt="16791710531110043648_19" src="https://github.com/user-attachments/assets/51543b9f-ca45-419d-94bb-5ddb17dbc874" />
<img width="219" height="340" alt="16791710531110043648_20" src="https://github.com/user-attachments/assets/6b8bebcc-232b-4856-a145-9781fe1c80ae" />

Project Structure :<br> 
generateconfig(...) create a struct config<br>
randomDirection(...) return a struct witch indicate one direction <br>
tryCreateRoom(...) try to create a room<br>
generateDungeon(...) create a level depend on the config it have received <br>

for use you need the four fonctions<br>
1.create a struct config with generateconfig(...) <br>
2.use generateDungeon(...) with the struct config we have create <br>

Purpose

This repository contains a reusable dungeon generation system extracted and refactored from one of my personal game projects.<br>
Its goal is to demonstrate procedural generation and clean GameMaker architecture.

Skills demonstrated

Procedural generation<br>
Software architecture<br>
Modular programming<br>
Configuration-driven design<br>
GameMaker Language (GML)<br>
Code documentation<br>
