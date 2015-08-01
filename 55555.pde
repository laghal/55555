import ddf.minim.*;

void setup()
{    
  size(displayWidth,displayHeight+1, OPENGL);
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
boolean firstRun = true;

void draw()
{
  if(firstRun){
    textAlign(CENTER, CENTER);
    background(0,0,0);
    textSize(height/4);
    fill(255,255,255,255);
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
    ost.load();
    gl.init();
    keyboard.init();
    laghal.init();
    firstRun = false;
  }
  else if(!titleScreen.gameStarted)
  {    
    titleScreen.draw();    
    ost.setTitleMusic();    
    titleScreen.keyPressed();
  }
  else
  {
    if(currentRoom.glitch)
    {
      translate(random(-height/25,height/25), random(-height/25,height/25));
    }
    mainBG.draw(!currentRoom.glitch);
    currentRoom.draw();
    laghal.draw();
    laghal.move();
  }
  if(keyPressed&&key=='r')
    saveFrame("trailer/###############.tif");
}
