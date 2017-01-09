class Sgame{

final int GAME_START1=0, GAME_START2=1, GAME_RUN=2,GAME_LOSE=3,GAME_LOSE1=300,GAME_WIN=4,GAME_WIN1=400,MARRY=5, ENEMY_W=100, ENEMY_H=100, FIGHTER_W=102, FIGHTER_H=102, TREASURE_W=40, TREASURE_H=40, SHOOT_W = 60, SHOOT_H = 50;
final int ENEMY_LINE=0, ENEMY_DIAG=1, ENEMY_DIAM=2;

PImage bg1, bg2, enemy, fighter, start1, shoot, sgame_start, hit_lose, hit_win, marry, breakup;
float bgSpeed, hpXPlace, hpYPlace, treasureX, treasureY, fighterX, fighterY, fighterSpeed, enemySpeed, enemyOneX, enemyOneY, shootX, shootY, shootNum;

float [] enemiesX, enemiesY;
PImage [] flames;

float [][] explosionX, explosionY, explosionSpeed;

int [][] explosionFlame;

int explosionI = 0;

//enemy
int nbrEnemy = 5;
int nbrDiamEnemy = 12;
int nbrFlame = 5;
int explodeTime = 10;
float spacing = 80;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean spacePressed = false;

int hitState, enemyState;

float [] bulletX = new float [5];
float [] bulletY = new float [5];
int bulletSpeed=10;
int n = 0;
boolean [] bulletNum = new boolean[5];
boolean[] enemyDisappear = new boolean[8];
boolean[] fighterShoot = new boolean[5];

PFont score;
int scoreX=50;
void scoreChange(int value){
  scoreX+=value;
}

Sgame() {
  
  
  size(1024,768) ;
  score = createFont("Arial",24);

  //array
  enemiesX = new float [nbrDiamEnemy];
  enemiesY = new float [nbrDiamEnemy];
  explosionX = new float [3][nbrDiamEnemy];
  explosionY = new float [3][nbrDiamEnemy];
  explosionSpeed = new float [3][nbrDiamEnemy];
  explosionFlame = new int [3][nbrDiamEnemy];
  flames = new PImage [nbrFlame];
  
  //pictures
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  start1=loadImage("img/start1.jpg");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  shoot=loadImage("img/shoot.png");
  sgame_start=loadImage("img/sgame_start.jpg");
  hit_lose=loadImage("img/hit_lose.jpg");
  hit_win=loadImage("img/hit_win.jpg");
  marry=loadImage("img/marry.png");
  breakup=loadImage("img/breakup.png");

  
  for(int i=0; i<nbrFlame; i++){
    flames[i] = loadImage("img/flame"+(i+1)+".png");
  }
 
  //position
  fighterX=550;
  fighterY=240;
  enemyOneX=-350;
  enemyOneY=random(50,430);
  for(int i=0; i<nbrEnemy; i++){
    enemiesX[i]=enemyOneX+spacing*i;
    enemiesY[i]=enemyOneY;
  }
  for(int i=0; i<3; i++){
    for(int j=0; j<nbrDiamEnemy; j++){
      explosionX[i][j]=0;
      explosionY[i][j]=0;
      explosionSpeed[i][j]=0;
      explosionFlame[i][j]=0;
    }
  }
  //shoot
  for(int i = 0; i < 8; i++){
    enemyDisappear[i] = false;
  }
  
shootNum = 3;
  for(int i = 0; i < shootNum; i++){
    fighterShoot[i] = false;
    bulletX[i] = 0;
    bulletY[i] = 0;
  }
  
  //hitState 
  hitState = GAME_START1;
  
  //enemyState
  enemyState = ENEMY_LINE;
  
  //speed
  bgSpeed=0;
  fighterSpeed=20;
  enemySpeed= 30;
  
  
  //let treasure random
  treasureX=random(80,590);
  treasureY=random(80,430);
  
}

void Display() {
 
  
   switch(hitState){
    
    //game start
    case GAME_START1: 
    
   
    if(mouseX>0 && mouseX<1024 && mouseY<768 && mouseY>0){
       image(start1,0,0,1024,768);
       if(mousePressed){
         hitState=GAME_RUN;
       }
    }
  
    
    break;
    
   
    
  //game run  
    case GAME_RUN:

  //background unlimit scroll
  image(bg2,bgSpeed-1280,0,1024,768);
  image(bg1,bgSpeed-1024,0,1024,768);
  image(bg2,bgSpeed,0,1024,768);
  bgSpeed %= 1280; 
  bgSpeed += 2;  
   
  //explode
  for(int i=0; i<3; i++){
    for(int j=0; j<nbrDiamEnemy; j++){
      if (--explosionSpeed[i][j]>1) {
        image(flames[explosionFlame[i][j]], explosionX[i][j], explosionY[i][j]);
      }
    }
  }
  
  //fighter

  image(fighter,fighterX,fighterY);
  
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
  
  
  //fighter area
 if(fighterX>width-50){
   fighterX=width-50;
 }
 
 if(fighterX<0){
   fighterX=0;
 }
 
 if(fighterY>height-50){
   fighterY=height-50;
 }
 
 if(fighterY<0){
   fighterY=0;
 }
    
  

 //bullet
      for (int i = 0; i < 5; i ++){
        if (bulletNum[i] == true){
          image (shoot, bulletX[i], bulletY[i]);
          bulletX[i] -= bulletSpeed;
        }
        if (bulletX[i] < - shoot.width){
          bulletNum[i] = false;
        }
      }
      
      
        /*   
      //Bullet Detect
        if(bulletX[j] >= enemyA1 [i][0] - shoot.width 
           && bulletX[j] <= enemyA1 [i][0] + enemyS 
           && bulletY[j] >= enemyA1 [i][1] - shoot.height 
           && bulletY[j] <= enemyA1 [i][1] + enemyS
           && bulletNum[j] == true){
      //Boom
        for (int k = 0;  k < 5; k++ ){
          expl [k][0] = enemyA1 [i][0];
          boomP [k][1] = enemyA1 [i][1];
          }    
          enemyA1 [i][1] = -1000;
          enemyY1 = floor( random(0, height-enemyS*5) );
          shootLimit[j] = false;
          time = 0;  
          fill(255);
     //scoreX+=20;
          scoreChange(20);
          textFont(score,35);
          textAlign(CORNER);
          fill(255);
          text("score:"+scoreX,50,height-50);
*/
    fill(255);
    text("score:"+scoreX,50,height-50);
    textFont(score,20);
    textAlign(CORNER);
    
  switch(enemyState){
    
  //a line  
  case ENEMY_LINE:
  
  for(int i=0; i<nbrEnemy; i++){
    
    enemiesX[i] += enemySpeed;
    enemyOneX += enemySpeed/nbrEnemy;
    
    image(enemy,enemiesX[i], enemiesY[i]);
    
      //boundary detection enemy
    if(enemiesX[i]+ENEMY_W>=fighterX && enemiesX[i]<=fighterX+FIGHTER_W){
      if(enemiesY[i]+ENEMY_H>=fighterY && enemiesY[i]<=fighterY+FIGHTER_H){
        //explode
        explosionX[ENEMY_LINE][i] = enemiesX[i];
        explosionY[ENEMY_LINE][i] = enemiesY[i];
        explosionSpeed[ENEMY_LINE][i] = explodeTime;
        explosionFlame[ENEMY_LINE][i] = explosionI;
        if(++explosionI>=5){
          explosionI = 0;
        }
        enemiesX[i]=1000;
        scoreChange(-20);
        if(scoreX<=0){
          hitState = GAME_LOSE;
        }
        if(scoreX>=100){
          hitState = GAME_WIN;
        }
      }
    }
  
    //shoot enemy
    for (int j = 0; j < 5; j ++){
      if (bulletNum[j] == true){
        if(enemiesX[i]+ENEMY_W>=bulletX[j] && enemiesX[i]<=bulletX[j]){
          if(enemiesY[i]+ENEMY_H>=bulletY[j] && enemiesY[i]<=bulletY[j]){
            //explode
            explosionX[ENEMY_LINE][i] = enemiesX[i];
            explosionY[ENEMY_LINE][i] = enemiesY[i];
            explosionSpeed[ENEMY_LINE][i] = explodeTime;
            explosionFlame[ENEMY_LINE][i] = explosionI;
            if(++explosionI>=5){
              explosionI = 0;
            }
            enemiesX[i]=1000;
            bulletNum[j] = false;
            scoreChange(20);
            if(scoreX>=100){
          hitState = GAME_WIN;
        }
          }
        }
      }
    }
    
      //bullet shoot enemy
    if(enemiesX[i]+ENEMY_W>=shootX && enemiesX[i]<=shootX+SHOOT_W){
      if(enemiesY[i]+ENEMY_H>=shootY && enemiesY[i]<=shootY+SHOOT_H){
        //explode
        explosionX[ENEMY_LINE][i] = enemiesX[i];
        explosionY[ENEMY_LINE][i] = enemiesY[i];
        explosionSpeed[ENEMY_LINE][i] = explodeTime;
        explosionFlame[ENEMY_LINE][i] = explosionI;
        if(++explosionI>=5){
          explosionI = 0;
        }
        enemiesX[i]=1000;
        scoreChange(-20);
        if(scoreX<=0){
          hitState = GAME_LOSE;
        }
        if(scoreX>=100){
          hitState = GAME_WIN;
        }
      }
    }
    
    //jump to diagonal
    if(enemyOneX>=width){
      enemyState = ENEMY_DIAG;
      enemyOneX=-350;
      enemyOneY=random(230,350);
      for(int j=0; j<nbrEnemy; j++){
        enemiesX[j]=enemyOneX+(spacing-20)*j;
        enemiesY[j]=enemyOneY-(spacing-20)*j;
      }
    }
  }
  
  break;
  
  //a diagonal
  case ENEMY_DIAG:

  for(int i=0; i<nbrEnemy; i++){
    
    enemiesX[i] += enemySpeed;
    enemyOneX += enemySpeed/nbrEnemy;
    
    image(enemy,enemiesX[i], enemiesY[i]);
    
      //boundary detection enemy
    if(enemiesX[i]+ENEMY_W>=fighterX && enemiesX[i]<=fighterX+FIGHTER_W){
      if(enemiesY[i]+ENEMY_H>=fighterY && enemiesY[i]<=fighterY+FIGHTER_H){
        //explode
        explosionX[ENEMY_LINE][i] = enemiesX[i];
        explosionY[ENEMY_LINE][i] = enemiesY[i];
        explosionSpeed[ENEMY_LINE][i] = explodeTime;
        explosionFlame[ENEMY_LINE][i] = explosionI;
        if(++explosionI>=5){
          explosionI = 0;
        }
        enemiesX[i]=1000;
        scoreChange(-20);
        if(scoreX<=0){
          hitState = GAME_LOSE;
        }
        if(scoreX>=100){
          hitState = GAME_WIN;
        }
      }
    }
    
    //shoot enemy
    for (int j = 0; j < 5; j ++){
      if (bulletNum[j] == true){
        if(enemiesX[i]+ENEMY_W>=bulletX[j] && enemiesX[i]<=bulletX[j]){
          if(enemiesY[i]+ENEMY_H>=bulletY[j] && enemiesY[i]<=bulletY[j]){
            //explode
            explosionX[ENEMY_LINE][i] = enemiesX[i];
            explosionY[ENEMY_LINE][i] = enemiesY[i];
            explosionSpeed[ENEMY_LINE][i] = explodeTime;
            explosionFlame[ENEMY_LINE][i] = explosionI;
            if(++explosionI>=5){
              explosionI = 0;
            }
            enemiesX[i]=1000;
            bulletNum[j] = false;
            scoreChange(20);
            if(scoreX>=100){
              hitState = GAME_WIN;
            }
          }
        }
      }
    }
         
    //jump to diamond
    if(enemyOneX>=width){  
      enemyState = ENEMY_DIAM;
      enemyOneX=-350;
      enemyOneY=random(90,290);
      for(int j=0; j<nbrEnemy-2; j++){
        enemiesX[(nbrEnemy-1)*j]=enemyOneX+(spacing-20)*j;
        enemiesY[(nbrEnemy-1)*j]=enemyOneY-(spacing-20)*j;
        
        enemiesX[(nbrEnemy-1)*j+1]=enemyOneX+(spacing-20)*j;
        enemiesY[(nbrEnemy-1)*j+1]=enemyOneY+(spacing-20)*j;
        
        enemiesX[(nbrEnemy-1)*j+2]=enemyOneX-(spacing-20)*(j-4);
        enemiesY[(nbrEnemy-1)*j+2]=enemyOneY-(spacing-20)*j;
        
        enemiesX[(nbrEnemy-1)*j+3]=enemyOneX-(spacing-20)*(j-4);
        enemiesY[(nbrEnemy-1)*j+3]=enemyOneY+(spacing-20)*j;
      }

    }
  }
    break;
    
    //a diamond
    case ENEMY_DIAM:
    
    for(int i=0; i<nbrDiamEnemy; i++){
      
    enemiesX[i] += enemySpeed;
    enemyOneX += enemySpeed/nbrDiamEnemy;
    image(enemy,enemiesX[i], enemiesY[i]);
    
    //boundary detection enemy
    if(enemiesX[i]+ENEMY_W>=fighterX && enemiesX[i]<=fighterX+FIGHTER_W){
      if(enemiesY[i]+ENEMY_H>=fighterY && enemiesY[i]<=fighterY+FIGHTER_H){
        //explode
        explosionX[ENEMY_LINE][i] = enemiesX[i];
        explosionY[ENEMY_LINE][i] = enemiesY[i];
        explosionSpeed[ENEMY_LINE][i] = explodeTime;
        explosionFlame[ENEMY_LINE][i] = explosionI;
        if(++explosionI>=5){
          explosionI = 0;
        }
        enemiesX[i]=1000;
        scoreChange(-20);
        if(scoreX<=0){
          hitState = GAME_LOSE;
        }
        if(scoreX>=100){
          hitState = GAME_WIN;
        }
      }
    }
    
    //shoot enemy
    for (int j = 0; j < 5; j ++){
      if (bulletNum[j] == true){
        if(enemiesX[i]+ENEMY_W>=bulletX[j] && enemiesX[i]<=bulletX[j]){
          if(enemiesY[i]+ENEMY_H>=bulletY[j] && enemiesY[i]<=bulletY[j]){
            //explode
            explosionX[ENEMY_LINE][i] = enemiesX[i];
            explosionY[ENEMY_LINE][i] = enemiesY[i];
            explosionSpeed[ENEMY_LINE][i] = explodeTime;
            explosionFlame[ENEMY_LINE][i] = explosionI;
            if(++explosionI>=5){
              explosionI = 0;
            }
            enemiesX[i]=1000;
            bulletNum[j] = false;
            scoreChange(20);
            if(scoreX>=100){
              hitState = GAME_WIN;
            }
          }
        }
      }
    }
    
    //jump to line
    if(enemyOneX>=width){   
      enemyState = ENEMY_LINE;
      enemyOneX=-350;
      enemyOneY=random(150,400);
      for(int j=0; j<nbrEnemy; j++){
        enemiesX[j]=enemyOneX+spacing*j;
        enemiesY[j]=enemyOneY;
      }  
    }
    
  }
}
 

  
   break;

 //game over
 case GAME_LOSE:
 
 image(hit_lose,0,0,1024,768);
 if(mousePressed){
    hitState = GAME_LOSE1; 
 }
 break;
 
 case GAME_LOSE1:
     image(breakup,0,0,1024,768);
     break;
 
 case GAME_WIN:
 
 image(hit_win,0,0,1024,768);
 if(mousePressed){
      hitState = GAME_WIN1;
 }
  break;
  
  case GAME_WIN1:
  image(marry,0,0,1024,768); 
  break;
   }

}


//controller
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
      case ' ':
        spacePressed = true;
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
  if ( keyCode == ' '){
          if (hitState == GAME_RUN){
            if (bulletNum[n] == false){
              bulletNum[n] = true;
              bulletX[n] = fighterX-30;
              bulletY[n] = fighterY+15;
              n ++;
            }   
            if (n> 4) {
              n=0;
            }
          }
        }
}

}