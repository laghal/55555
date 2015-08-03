import ddf.minim.*;

void setup()
{    
  size(displayWidth,1+displayHeight, OPENGL);
  noCursor();
  frameRate(55);
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
    textAlign(CENTER, CENTER);
    background(0,0,0);
    textSize(height/4);
    fill(255);
    text("LOADING", width/2, height/2);
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
    mainBG.draw(!currentRoom.glitch);
    titleScreen.draw();    
    ost.setTitleMusic();
    laghal.draw();
    titleScreen.keyPressed();
  }
  else if(!pause)
  {
    if(currentRoom.glitch)
    {
      translate(random(-height/55,height/55), random(-height/55,height/55));
    }
    mainBG.draw(!currentRoom.glitch);
    currentRoom.draw();
    laghal.draw();
    laghal.move();
  }
  else
  {
    menu.draw();
  }

  if(keyPressed&&key=='r')
    saveFrame("trailer/######.tif");
}
