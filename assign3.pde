//You should implement your assign3 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LOSE = 2;
final int FIRST_ENEMY = 3;
final int SECOND_ENEMY = 4;
final int THIRD_ENEMY = 5;
final float TOTAL_HP = 193;

float fighterX,fighterY,treasureX,treasureY;
float HPWidth,bgSpeed,fighterSpeed;
float enemyX,enemyY,enemyY1,n1,n2,n3,e;

int gameState,enemyState;

PImage bg1,bg2,enemy,fighter,treasure,hp,start1,start2,end1,end2;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


void setup(){
  size(640,480);
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  treasure=loadImage("img/treasure.png");
  hp=loadImage("img/hp.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  fighterSpeed=6;
  HPWidth=TOTAL_HP/5;
  fighterX=570;
  fighterY=240;
  treasureX=floor(random(10,550));
  treasureY=floor(random(50,410));
  gameState = GAME_START;
  enemyState = FIRST_ENEMY;
  e=random(0,430);
  n1=1980;
  n2=990;
  n3=0;
}

void draw(){
  if (upPressed) {
    fighterY -= fighterSpeed;
    
  }
  if (downPressed) {
    fighterY += fighterSpeed;
  }
  if (leftPressed) {
    fighterX -= fighterSpeed;
  }
  if (rightPressed) {
    fighterX += fighterSpeed;
  }
  
  if(fighterX<0){
    fighterX=0;
  }
  
  if(fighterX>585){
    fighterX=585;
  }
  
  if(fighterY<0){
    fighterY=0;
  }
  
  if(fighterY>430){
    fighterY=430;
  }
  
  switch (gameState){
    case GAME_START:
      image(start2,0,0);
      if(mouseX>207 && mouseX<452 && mouseY>378 && mouseY<421){
          if(mousePressed){
          gameState=GAME_RUN;
        }else{
          image(start1,0,0);
        }
      }
      break;
      
    case GAME_RUN:
      image(bg2,bgSpeed,0);
      image(bg1,bgSpeed-640,0);
      image(bg2,bgSpeed-1280,0);
      image(treasure,treasureX,treasureY);
      image(fighter,fighterX,fighterY);  
      fill(#FF0000);
      stroke(#FF0000);
      rect(22,14,HPWidth,15,3);
      image(hp,10,10);
      bgSpeed++;
      bgSpeed%=1280;
      
      /*enemyState*/
       for(int i=0; i<5;i++){  
    enemyX=n1-2330+i*70;
    enemyY=e;
    image(enemy,enemyX,enemyY);
  }
  n1+=4;
  n1%=2970;
  if(n1==0||n1==2){
  e=random(240,425);
  } 
  
  for(int i=0;i<5;i++){
    enemyX=n2-2330+i*70;
    enemyY=e-i*60;
    image(enemy,enemyX,enemyY);
  }
  n2+=4;
  n2%=2970;
  if(n2==0||n2==2){
  e=random(120,310);
  } 
  
  for(int i=0;i<5;i++){
    enemyX=n3-2330+i*70;
      if(i<=2){
        enemyY=e-i*60;
      }else{
        enemyY=e-2*60+(i-2)*60;
      }
    image(enemy,enemyX,enemyY);
  }
 
  for(int i=0;i<5;i++){
    enemyX=n3-2330+i*70;
      if(i<=2){
        enemyY1=e+i*60;   
      }else{
        enemyY1=e+2*60-(i-2)*60;
      }
    image(enemy,enemyX,enemyY1);
  }  
  n3+=4;
  n3%=2970;
  if(n3==0||n3==2){
  e=random(0,425);
  }
      
      if(treasureX+40>fighterX && treasureX<fighterX+50){
        if(treasureY+40>fighterY && treasureY<fighterY+50){
            HPWidth+=TOTAL_HP/10;
            treasureX=floor(random(10,550));
            treasureY=floor(random(50,410));
        }
      }
      
      if(HPWidth<=0){
        gameState = GAME_LOSE;
      }
      
      if(HPWidth>=TOTAL_HP){
        HPWidth=TOTAL_HP;
      }
      break;
      
    case GAME_LOSE:
      image(end2,0,0);
      if(mouseX>207 && mouseX<452 && mouseY>308 && mouseY<351){
          if(mousePressed){
          gameState=GAME_RUN;
          HPWidth=TOTAL_HP/5;
          fighterX=570;
          fighterY=240;
        }else{
          image(end1,0,0);
        }
      }
      break;
  }
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break; 
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
