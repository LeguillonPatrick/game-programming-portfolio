/*
Dungeon Generator
 * -----------------
 * Procedural dungeon generator based on random expansion.
 *
 * Features:
 * - Generates a main path ending with a boss room.
 * - Creates additional combat and bonus rooms.
 * - Automatically links doors together.
 * - Fully configurable through createDungeonConfig().
 */
 
 
 
 /* @function createDungeonConfig
 @description Creates a configuration structure for the function generateDungeon
 
 @param {Real} maxRooms : max number of roomObject the functions can create
 @param {Real} bonusRooms : max number of bonusRoomObject the functions can create
 @param {Real} roomDistance : distance between two rooms
 @param {Object} doorObject : door object used to connect  two rooms
 @param {Object} roomObject : object of a room
 @param {Object} bossRoomObject : object of a boss room and the end of the level
 @param {Object} bonusRoomObject : object of a bonus room
 @param {Object} parentRoomObject : Parent object shared by every room type, used to detect existing rooms during generation
 
 @returns {Struct} Dungeon generation configuration
 */
function createDungeonConfig(maxRooms,
    bonusRooms,
	roomDistance,
	doorObject,
	roomObject,
	bossRoomObject,
	bonusRoomObject,
	parentRoomObject){
    return {
        maxRooms,
        bonusRooms,
        roomDistance,

        bossRoomIndex : 5,//Room index at which the boss room is generated

        doorOffset1 : 6.5,//Offset divisor used to place the first door
        doorOffset2 : 1.20,//Offset divisor used to place the second door

        doorObject,
        roomObject,
        bossRoomObject,
        bonusRoomObject,
        parentRoomObject
    }
}
/* @function randomDirection()
 @description Returns a random cardinal direction.
 @returns {Struct} A struct containing dx and dy.
 */
function randomDirection(){
	switch(irandom(3)){
			case(0):
				return {
					dx : 0,
					dy : -1
				}
			case(1):
				return {
					dx : 0,
					dy : 1
				}
			case(2):
				return {
					dx : -1,
					dy : 0
				}
			case(3):
				return {
					dx : 1,
					dy : 0
				}
		}	
}

/*@function tryCreateRoom(px, py, dx, dy, doorCount, door, roomsCount, roomList, currentRoomType, config)
@description Attempts to create a room in the specified direction.

@param {Real} px : Current room X position
@param {Real} py : Current room Y position
@param {Real} dx : Direction on the X axis (-1, 0 or 1)
@param {Real} dy : Direction on the Y axis (-1, 0 or 1)
@param {Real} doorCount : Number of doors already created
@param {Array} door : Array containing created door instances
@param {Real} roomsCount : Number of generated rooms
@param {Array} roomList  : Array containing generated room instances
@param {Object} currentRoomType : Room object to create
@param {Struct} config : Dungeon generation configuration

@returns {Real}
0 : Room creation failed
1 : A normal room was created
2 : A boss room was created
*/
function tryCreateRoom(px,py,dx,dy,doorCount,door,roomsCount,roomList,currentRoomType,config){
	dx *= config.roomDistance
	dy *= config.roomDistance
	var doorOffset1X = 0
	var doorOffset2X = 0
	var doorOffset1Y = 0
	var doorOffset2Y = 0
	if(dx!=0){
		doorOffset1X = dx /config.doorOffset1 
		doorOffset2X = dx /config.doorOffset2  
	}
	if(dy!=0){
		doorOffset1Y = dy /config.doorOffset1 
		doorOffset2Y = dy /config.doorOffset2
	}
	if not (place_meeting(px-dx,py-dy,config.parentRoomObject)){
		py = py - dy
		px = px - dx
		if(currentRoomType!=config.bossRoomObject){
			roomList[roomsCount] = instance_create_layer(px,py,"Sol",currentRoomType)
		}
		else{
			instance_create_layer(px,py,"Sol",currentRoomType)
		}
		door[doorCount] = instance_create_layer(px+doorOffset1X,py+doorOffset1Y ,"Instances",config.doorObject)
		door[doorCount].dx = px+doorOffset2X//nb = doorCount 
		door[doorCount].dy = py+doorOffset2Y 
		doorCount++
		door[doorCount] = instance_create_layer(px+doorOffset2X,py+doorOffset2Y ,"Instances",config.doorObject)
		door[doorCount].dx = door[doorCount-1].x//nb = doorCount 
		door[doorCount].dy = door[doorCount-1].y//nb = doorCount 
		if(currentRoomType!=config.bossRoomObject){
			return 1
		}
		else{
			return 2	
		}
	}
	else if(place_meeting(px-dx,py-dy,config.roomObject))&&(not place_meeting(px-doorOffset1X,py-doorOffset1Y,config.doorObject)){
		py = py - dy
		px = px - dx
		door[doorCount] = instance_create_layer(px+doorOffset1X,py+doorOffset1Y ,"Instances",config.doorObject)
		door[doorCount].dx = px+doorOffset2X//nb = doorCount 
		door[doorCount].dy = py+doorOffset2Y 
		doorCount++
		door[doorCount] = instance_create_layer(px+doorOffset2X,py+doorOffset2Y ,"Instances",config.doorObject)
		door[doorCount].dx = door[doorCount-1].x//nb = doorCount 
		door[doorCount].dy = door[doorCount-1].y//nb = doorCount 
		return 2
	}
	return 0
}

/* @function generateDungeon
@description  Generates a procedural dungeon using the supplied configuration
@param {Struct} config : Dungeon generation configuration
*/
function generateDungeon(config){
	var doorCount = 0
	var door = []
	var roomsCount = 1
	var roomList = []
	roomList[0] = instance_place(x,y,config.parentRoomObject)
	var currentRoomType = config.roomObject
	var px = x
	var py = y
	while(not instance_exists(config.bossRoomObject)){//roomsCount<config.mainPath){
		px = roomList[roomsCount-1].x
		py = roomList[roomsCount-1].y
		var Direction = randomDirection()
		var result = tryCreateRoom(px,py,Direction.dx,Direction.dy,doorCount,door,roomsCount,roomList,currentRoomType,config)
		if(result){
			doorCount += 2
			if(result==1){
				roomsCount ++
			}
		}
		if(roomsCount==config.bossRoomIndex){
			currentRoomType = config.bossRoomObject
		}
	}
	currentRoomType = config.roomObject
	while(roomsCount<=config.maxRooms+config.bonusRooms){
		if(roomsCount>config.maxRooms){
			currentRoomType = config.bonusRoomObject
		}
		var numSalle = floor(random_range(0,roomsCount-1))
		if(currentRoomType==config.bonusRoomObject){
			numSalle = floor(random_range(1,roomsCount-1))	
		}
		px= roomList[numSalle].x
		py= roomList[numSalle].y
		if(not place_meeting(px,py,config.bonusRoomObject)){
			var Direction = randomDirection()
			if(tryCreateRoom(px,py,Direction.dx,Direction.dy,doorCount,door,roomsCount,roomList,currentRoomType,config)){
				doorCount += 2
				roomsCount ++
			}
		}	
	}
}