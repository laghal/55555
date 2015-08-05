import ddf.minim.*;
PImage dedi;
PImage thesquare;
PImage squares;
PImage five;

void setup()
{    
  size(displayWidth,1+displayHeight, OPENGL);  
  noCursor();
  frameRate(55);
  dedi = loadImage("dedi.jpg");
  thesquare = loadImage("TheSquare.jpg");
  squares = loadImage("Squares.jpg");
  five = loadImage("55555.jpg");
  frame.setTitle("55555"); 
}

boolean sketchFullScreen()
{
  return true;
}

Minim minim;
Title titleScreen;
Background mainBG;
Room currentRoom;
Square laghal;
Keys keyboard;
Glitchs gl;
Music ost;
Menu menu;
boolean firstRun = true;
boolean pause = false;


void draw()
{
  
  if(firstRun){ 
    imageMode(CENTER);
    background(0,0,0);
    fill(255);
    minim = new Minim(this);    
    hint(DISABLE_OPTIMIZED_STROKE);    
    titleScreen = new Title();
    mainBG = new Background();
    currentRoom = new Room();
    laghal = new Square();
    keyboard = new Keys();
    gl = new Glitchs();
    ost = new Music();
    menu = new Menu();
    firstRun = false;
  }
  else if(!titleScreen.gameStarted)
  {
    textAlign(CENTER, CENTER);
    mainBG.draw();
    titleScreen.draw();    
    ost.setTitleMusic();
    laghal.draw();
    titleScreen.keyPressed();
  }
  else if(!pause)
  {
    textAlign(CENTER, CENTER);
    
    if(currentRoom.glitch)
    {
      translate(random(-height/55,height/55), random(-height/55,height/55));
    }
    mainBG.draw();
    currentRoom.draw();
    laghal.draw();
    
    fill(0);
    text(gl.NGRoom, -width/2.5, -height/2.5);
    if(gl.unglitch>0&&currentRoom.glitch)
    {
      laghal.x-=laghal.x/25;
      laghal.y-=laghal.y/25;
      gl.unglitch++;
      if(gl.unglitch>255)
      {
        currentRoom.glitch=false;
        gl.update();
      }
    }
    else if(gl.unglitch>0)
    {
       gl.unglitch--;
    }
    else
    {
      laghal.move();
    }
  }
  else
  {
    textAlign(CENTER, TOP);
    menu.draw();
  }

  if(keyPressed&&key=='r')
    saveFrame("trailer/######.tif");
}
