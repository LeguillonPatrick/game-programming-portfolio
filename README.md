Modular Dungeon Generator
Reusable procedural dungeon generator written in GameMaker Language (GML).

create to show my ability in programmation and share my modular dungeon generator 

this fonction create a dungeon with room connected by door objet, the exit is a boss room and you can add bonus room also

algo :
->create config
->create main path
->create boss room
->create the other room upon the max room is reached also create extra connections

config : 
you can modifiy all parameters for the function createConfig essentially parameters {
  maxRooms : max number of roomObject the functions can create
  bonusRooms : max number of bonusRoomObject the functions can create
  roomDistance : distance between two rooms
  doorObject : door object used to connect  two rooms
  roomObject : object of a room
  bossRoomObject : object of a boss room and the end of the level
  bonusRoomObject : object of a bonus room
  parentRoomObject : Parent object shared by every room type, used to detect existing rooms during generation
}

Two exemple with 10 max rooms et 2 bonus rooms
<img width="443" height="381" alt="16791710531110043648_17" src="https://github.com/user-attachments/assets/49004fcd-7b84-4a9d-b78c-a6e2a05af7f3" />
<img width="382" height="353" alt="16791710531110043648_18" src="https://github.com/user-attachments/assets/6cc4d897-7d54-4507-8b33-e50ff18ee3e2" />
Two exemple with 6 max rooms et 2 bonus rooms
<img width="345" height="323" alt="16791710531110043648_19" src="https://github.com/user-attachments/assets/51543b9f-ca45-419d-94bb-5ddb17dbc874" />
<img width="219" height="340" alt="16791710531110043648_20" src="https://github.com/user-attachments/assets/6b8bebcc-232b-4856-a145-9781fe1c80ae" />

There are four fonctions : 
generateconfig(...) create a struct config
randomDirection(...) return a struct witch indicate one direction 
tryCreateRoom(...) try to create a room
generateDungeon(...) create a level depend on the config it have received 

for use you need the four fonctions
we need to create a struct config with generateconfig(...) 
and after use generateDungeon(...) with the struct config we have create 
