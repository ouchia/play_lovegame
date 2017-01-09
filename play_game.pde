int gameState, SState;
int value = 0;
boolean unlockk=false, unlocks=false, unlockr=false, unlocksexy=false, unlockdress=false, unlocknooil=false, unlockyesoil=false;

final int GAME_START = 0, GAME_RUN = 1, CHOOSE_CHAR01 = 2;

PImage title1,title2,startword, choosechar, selectk, selects, selectr;
//sboy
PImage s_001,
  s_001clothe,
  s_clothe_dress,
  s_clothe_dress01,
  s_clothe_sexy,
  s_clothe_sexy01,
  s_clothe_sexy02,
  s_clothe_sexy03,
  s_startword,
  s_002oil,
  s_oil_refuse,
  s_oil_refuse01,
  s_oil_refuse02,
  s_oil_refuse03,
  s_oil_refuse04,
  s_oil_refuse05,
  s_oil_agree,
  s_oil_agree01,
  s_oil_agree02,
  s_003cook,
  s_cook_taifood,
  s_cook_tai01,
  s_cook_tai02,
  s_cook_thaifood,
  s_cook_thai01,
  s_cook_thai02,
  s_cook_game,
  marry,
  makelove,
  breakup;
  
  final int S000=100,
  S001=1010,
  S002=1020,
  S003_SEXY01=1030,
  S004_SEXY02=1040,
  S0041_SEXY03=10401,
  S005_DRESS01=1050,
  S006=1060,
  S007=1070,
  S008=1080,
  S009=1090,
  S010=1100,
  S011=1110,
  S012=1120,
  S013=1130,
  S0131=11301,
  S014=1140,
  S015=1150,
  S016=1160,
  S017=1170,
  S018=1180,
  S019=1190,
  S020=1200,
  S021=1210,
  S022=1220,
  S023=1230;
      
 //kboy
 
 PImage k001;
PImage k002;
PImage k003;
PImage k0031;
PImage k0032;
PImage k004;
PImage k0041;
PImage k0042;
PImage k005;
PImage k0051;
PImage k0052;
PImage k006;
PImage k007;
PImage k008;
PImage k009;
PImage k010;
PImage k011;
PImage k012;
PImage k013;
PImage k014;
PImage k015;
PImage k016;
PImage k017;
PImage k018;
PImage k019;
PImage k020;
PImage k021;
PImage kBreakup;
PImage kMarry;

int kState;
final int K001 = 1;
final int K002 = 2;
final int K003 = 3;
final int K0031 = 31;
final int K0032 = 32;
final int K004 = 4;
final int K0041 = 41;
final int K0042 = 42;
final int K005 = 5;
final int K0051 = 51;
final int K0052 = 52;
final int K006 = 6;
final int K007 = 7;
final int K008 = 8;
final int K009 = 9;
final int K010 = 10;
final int K011 =11;
final int K012 =12;
final int K013 =13;
final int K014 =14;
final int K015 =15;
final int K016 =16;
final int K017 =17;
final int K018 =18;
final int K019 =19;
final int K020 =20;
final int K021 =21;
final int Kbreakup = 888;
final int Kmarry = 999;
   
Sboy sb;
Sgame sg;
import ddf.minim.*;
Minim minim;
AudioPlayer hiphop;
AudioPlayer ballet;
Kboy kb;

void setup(){
  
  size(1024,768);
  gameState = GAME_START;
  title1 = loadImage("img/title1.jpg");
  title2 = loadImage("img/title2.jpg");
  startword = loadImage("img/startword.jpg");
  choosechar = loadImage("img/choosechar.jpg");
  selectk = loadImage("img/selectk.jpg");
  selects = loadImage("img/selects.jpg");
  selectr = loadImage("img/selectr.jpg");
  
  //sb
  s_001=loadImage("img/s_001.jpg");
  s_001clothe=loadImage("img/s_001clothe.jpg");
  s_clothe_dress=loadImage("img/s_clothe_dress.jpg");
  s_clothe_dress01=loadImage("img/s_clothe_dress01.jpg");
  s_clothe_sexy=loadImage("img/s_clothe_sexy.jpg");
  s_clothe_sexy01=loadImage("img/s_clothe_sexy01.jpg");
  s_clothe_sexy02=loadImage("img/s_clothe_sexy02.jpg");
  s_clothe_sexy03=loadImage("img/s_clothe_sexy03.jpg");
  s_startword=loadImage("img/s_startword.jpg");
  s_002oil=loadImage("img/s_002oil.jpg");
  s_oil_refuse=loadImage("img/s_oil_refuse.jpg");
  s_oil_refuse01=loadImage("img/s_oil_refuse01.jpg");
  s_oil_refuse02=loadImage("img/s_oil_refuse02.jpg");
  s_oil_refuse03=loadImage("img/s_oil_refuse03.jpg");
  s_oil_refuse04=loadImage("img/s_oil_refuse04.jpg");
  s_oil_refuse05=loadImage("img/s_oil_refuse05.jpg");
  s_oil_agree=loadImage("img/s_oil_agree.jpg");
  s_oil_agree01=loadImage("img/s_oil_agree01.jpg");
  s_oil_agree02=loadImage("img/s_oil_agree02.jpg");
  s_003cook=loadImage("img/s_003cook.jpg");
  s_cook_game=loadImage("img/s_cook_game.jpg");
  s_cook_tai01=loadImage("img/s_cook_tai01.jpg");
  s_cook_tai02=loadImage("img/s_cook_tai02.jpg");
  s_cook_taifood=loadImage("img/s_cook_taifood.jpg");
  s_cook_thai01=loadImage("img/s_cook_thai01.jpg");
  s_cook_thai02=loadImage("img/s_cook_thai02.jpg");
  s_cook_thaifood=loadImage("img/s_cook_thaifood.jpg");
  marry=loadImage("img/marry.png");
  makelove=loadImage("img/makelove.png");
  breakup=loadImage("img/breakup.png");

  
  //sb = new Sboy();
  sg = new Sgame();
  
}

void draw(){
  
  if(unlockk){
    image(selectk,0,0,width,height);
  }
  
  if(unlocks){
    image(selects,0,0,width,height);
  }
  
  if(unlockr){
    image(selectr,0,0,width,height);
  }
    
  
  switch(gameState){
    
   case GAME_START:
   image(title1,0,0,width,height);
   if(mouseX>380 && mouseX<665 && mouseY>495 && mouseY<570){
    image(title2,0,0,width,height);
    if(mousePressed){
     gameState = GAME_RUN;
    }
   }
   break;
   
   case GAME_RUN:
   image(startword,0,0,width,height);
   if(mousePressed){
     image(choosechar,0,0,width,height);
     gameState = CHOOSE_CHAR01;
     }
     break;
     
    case CHOOSE_CHAR01:
    
      if(mouseX>40 && mouseX<345 && mouseY>110 && mouseY<720){
        unlockk = true;
        unlocks = false;
        unlockr = false;
      }
      if(mouseX>360 && mouseX<660 && mouseY>110 && mouseY<720){
        unlockk = false;
        unlocks = true;
        unlockr = false;
        if(mousePressed){
          image(s_startword,0,0,width,height);
          gameState = S000;
        }
      }
      if(mouseX>675 && mouseX<980 && mouseY>110 && mouseY<720){
        unlockk = false;
        unlocks = false;
        unlockr = true;
      }
      break;
      
      case S000:
        image(s_startword,0,0,width,height);
        if(mousePressed){
          gameState = S001;
        }
        break;
        
        case S001:
        image(s_001,0,0,width,height);
        if(mousePressed){
         gameState = S002;
        }
        break;
        
        case S002:
        image(s_001clothe,0,0,width,height);
        if(mouseX>20 && mouseX<505 && mouseY>220 && mouseY<745){
         image(s_clothe_sexy,0,0,width,height);
         if(mousePressed){
         gameState = S003_SEXY01;
        }
      }
        if(mouseX>515 && mouseX<1000 && mouseY>220 && mouseY<745){
         image(s_clothe_dress,0,0,width,height);
         if(mousePressed){
         gameState = S005_DRESS01;
        }
      }
        break;
        
        case S003_SEXY01:
        image(s_clothe_sexy01,0,0,width,height);
        if(mousePressed){
         gameState = S004_SEXY02;
        }
        break;
        
        case S004_SEXY02:
        image(s_clothe_sexy02,0,0,width,height);
        if(mousePressed){
         gameState = S0041_SEXY03;
        }
        break;
        
        case S0041_SEXY03:
        image(s_clothe_sexy03,0,0,width,height);
        if(mousePressed){
         gameState = S023;
        }
        break;
        
        case S023:
        image(makelove,0,0,width,height);
        break;
        
        case S005_DRESS01:
        image(s_clothe_dress01,0,0,width,height);
        if(mousePressed){
         gameState = S006;
        }
        break;
        
        case S006:
        image(s_002oil,0,0,width,height);        
        if(mouseX>20 && mouseX<505 && mouseY>220 && mouseY<745){
         image(s_oil_refuse,0,0,width,height);
         if(mousePressed){
         gameState = S007;
        }
      }
        if(mouseX>515 && mouseX<1000 && mouseY>220 && mouseY<745){
         image(s_oil_agree,0,0,width,height);
         if(mousePressed){
         gameState = S012;
        }
      }
      
      break;
        
        case S007:
        image(s_oil_refuse01,0,0,width,height);
        if(mousePressed){
         gameState = S008;
        }
        break;
        
        case S008:
        image(s_oil_refuse02,0,0,width,height);
        if(mousePressed){
         gameState = S009;
        }
        break;
        
        case S009:
        image(s_oil_refuse03,0,0,width,height);
        if(mousePressed){
         gameState = S010;
        }
        break;
        
        case S010:
        image(s_oil_refuse04,0,0,width,height);
        if(mousePressed){
         gameState = S011;
        }
        break;
        
        case S011:
        image(s_oil_refuse05,0,0,width,height);
        if(mousePressed){
         gameState = S015;
        }
        break;
        
        case S015:
        image(s_003cook,0,0,width,height);
        
        if(mouseX>20 && mouseX<505 && mouseY>220 && mouseY<745){
         image(s_cook_taifood,0,0,width,height);
         if(mousePressed){
         gameState = S016;
        }
      }
        if(mouseX>515 && mouseX<1000 && mouseY>220 && mouseY<745){
         image(s_cook_thaifood,0,0,width,height);
         if(mousePressed){
         gameState = S018;
        }
      }
      
      break;
        
        case S012:
        image(s_oil_agree01,0,0,width,height);
        if(mousePressed){
         gameState = S013;
        }
        break;
        
        case S013:
        image(s_oil_agree02,0,0,width,height);
        if(mousePressed){
         gameState = S0131;
        }
        break;
        
        case S0131:
        image(makelove,0,0,width,height);
        break;
                    
      case S016:
      image(s_cook_tai01,0,0,width,height);
      if(mousePressed){
         gameState = S017;
        }
        break;
        
        case S017:
      image(s_cook_tai02,0,0,width,height);
      if(mousePressed){
         gameState = S020;
        }
        break;
        
        case S018:
      image(s_cook_thai01,0,0,width,height);
      if(mousePressed){
         gameState = S019;
        }
        break;
        
        case S019:
      image(s_cook_thai02,0,0,width,height);
      if(mousePressed){
         gameState = S020;
        }
        break;
        
        case S020:
      image(s_cook_game,0,0,width,height);
      if(mousePressed){
          gameState = S021;
      }
        break;
        
        case S021:
      sg.Display();
      sg.keyPressed();
      sg.keyReleased();

        break;
          
      }
}
      
    