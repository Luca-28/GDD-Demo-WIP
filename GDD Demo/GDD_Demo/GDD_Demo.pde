PImage Background;      //Sprites
PImage PC_Base_Sprite;
PImage PC_Base_Sprite_Reversed;
PImage PC_Walk_1_Sprite;
PImage PC_Walk_1_Sprite_Reversed;
PImage PC_Walk_2_Sprite;
PImage PC_Walk_2_Sprite_Reversed;
PImage PC_Squat_Sprite;
PImage PC_Squat_Sprite_Reversed;
PImage PC_Jump_1_Sprite;
PImage PC_Jump_1_Sprite_Reversed;

PImage Monster;
PImage Monster_Reversed;

int Points = 0;        //Values
int PlayTime = 0;


float PlayerX = 100;    //Player Variables
float PlayerY = 428;
float PlayerSpeedX = 0;
float PlayerSpeedY = 0;
float PlayerWalkCycle = 0;
float PlayerJump = 0;
float PlayerOrientation = 1;


float MonsterX = 800;   // Monster Variables
float MonsterY = 449;
float MonsterSpeedX = 0;
float MonsterSpeedY = 0;

void setup(){
 size(1025,530);        //Establish framework and Images
 frameRate(20);
 Background = loadImage("Background.png");
 
 PC_Base_Sprite = loadImage("PC_Base_Sprite.png");
 PC_Base_Sprite_Reversed = loadImage("PC_Base_Sprite_Reversed.png");
 PC_Walk_1_Sprite = loadImage("PC_Walk_1_Sprite.png");
 PC_Walk_1_Sprite_Reversed = loadImage("PC_Walk_1_Sprite_Reversed.png");
 PC_Walk_2_Sprite = loadImage("PC_Walk_2_Sprite.png");
 PC_Walk_2_Sprite_Reversed = loadImage("PC_Walk_2_Sprite_Reversed.png");
 PC_Squat_Sprite = loadImage("PC_Squat_Sprite.png");
 PC_Squat_Sprite_Reversed = loadImage("PC_Squat_Sprite_Reversed.png");
 PC_Jump_1_Sprite = loadImage("PC_Jump_1_Sprite.png");
 PC_Jump_1_Sprite_Reversed = loadImage("PC_Jump_1_Sprite_Reversed.png");


 Monster = loadImage("Monster.png");
 Monster_Reversed = loadImage("Monster_Reversed.png");
 
 
}

void keyPressed(){    //Controls
if(key =='a'){
  PlayerSpeedX = -10;
}
if(key =='d'){
  PlayerSpeedX = 10;
}
if(key =='w' && PlayerY == 428 && PlayerJump == 0){
  PlayerJump = 1;
}
}

void keyReleased(){
 if(key =='a' || key =='d'){
   PlayerSpeedX = 0;
 }
}

void draw(){
  
  if(PlayerJump > 0){    //Player Jumping
PlayerJump = PlayerJump + 1;
}
if(PlayerJump >= 5 && PlayerY == 428){
  PlayerSpeedY = -20;
  PlayerJump = 0;
}

if(PlayerSpeedX != 0){      //Walk Cycle
 PlayerWalkCycle = PlayerWalkCycle + 1; 
}
if(PlayerWalkCycle > 20){    //Player Walk Cycle Resets
  PlayerWalkCycle = 0;
}

if(PlayerSpeedX > 0){
 PlayerOrientation = 1; 
}
if(PlayerSpeedX < 0){
 PlayerOrientation = -1; 
}
  
  clear();
 image(Background,0,0);    //Draw Background & Player Sprites
 
 if(PlayerJump == 0){
   
 if(PlayerSpeedX == 0 && PlayerY == 428){          //Player faces monster when standing still
   if(MonsterX > PlayerX ||MonsterX == PlayerX){
 image(PC_Base_Sprite,PlayerX,PlayerY);
 }
 if(PlayerSpeedX == 0 && MonsterX < PlayerX){
 image(PC_Base_Sprite_Reversed,PlayerX,PlayerY-20);
 }
 }
 
 if(PlayerSpeedX != 0){ //Grounded Player Sprites    
 if(PlayerY == 428){
 if(0 <= PlayerWalkCycle && PlayerWalkCycle <= 5 || 11 <= PlayerWalkCycle && PlayerWalkCycle <= 15){
 if(PlayerSpeedX > 0){
 image(PC_Base_Sprite,PlayerX,PlayerY);
 }
 if(PlayerSpeedX < 0){
 image(PC_Base_Sprite_Reversed,PlayerX,PlayerY-20);
 }
 }
 
 if(6 <= PlayerWalkCycle && PlayerWalkCycle <= 10){
  if(PlayerSpeedX > 0){
   image(PC_Walk_1_Sprite, PlayerX, PlayerY - 20); 
  }
  if(PlayerSpeedX < 0){
    image(PC_Walk_1_Sprite_Reversed, PlayerX, PlayerY - 20);
  }
 }
 if(16 <= PlayerWalkCycle && PlayerWalkCycle <= 20){
   if(PlayerSpeedX > 0){
   image(PC_Walk_2_Sprite, PlayerX, PlayerY - 20); 
  }
  if(PlayerSpeedX < 0){
    image(PC_Walk_2_Sprite_Reversed, PlayerX, PlayerY - 20);
 
 }
 }
 }
 
 
 }
 }
 if(PlayerJump > 0){
  if(PlayerSpeedX >= 0){
  image(PC_Squat_Sprite,PlayerX,PlayerY-20);
  }
  if(PlayerSpeedX < 0){
  image(PC_Squat_Sprite_Reversed,PlayerX,PlayerY-20);
  }
 }
 if(PlayerY < 428){
 if(PlayerSpeedX > 0){
  image(PC_Jump_1_Sprite,PlayerX,PlayerY);
 }
 if(PlayerSpeedX < 0){
  image(PC_Jump_1_Sprite_Reversed,PlayerX,PlayerY);
 }
   
 }
 


 image(Monster,MonsterX,MonsterY);    //Draw Monster Sprites
 
 
 PlayTime = PlayTime + 1;        //Time Played
 fill(255);
 textSize(20);
 text("Time Elapsed:",25,25);
 text(PlayTime/20,175,25);
 
 text("Points:",875,25);        //Points
 text(Points,950,25);
 
 

PlayerX = PlayerX + PlayerSpeedX;  //Player Movement
PlayerY = PlayerY + PlayerSpeedY;
if(PlayerX > 1025){
  PlayerX = 1025;
}
if(PlayerY < 428){
PlayerSpeedY = PlayerSpeedY + 1;
}
if(PlayerY > 428){
  PlayerY = 428;
  PlayerSpeedY = 0;
}
if(PlayerX < 0){
  PlayerX = 0;
}
if(PlayerX > 960){
  PlayerX = 960;
}

MonsterX = MonsterX + MonsterSpeedX;  //Monster AI
MonsterY = MonsterY + MonsterSpeedY;
if(PlayerX < MonsterX-75){
  MonsterSpeedX = -5;
}
if(PlayerX > MonsterX+75){
  MonsterSpeedX = 5;
}
if(MonsterX-75 < PlayerX && PlayerX < MonsterX+75){
  MonsterSpeedX = 0;
}
}
