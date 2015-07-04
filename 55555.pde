import ddf.minim.*;
Minim minim;

void setup()
{  
  size(displayWidth,displayHeight+1, OPENGL);
  noCursor();
  textAlign(CENTER, CENTER);
  frameRate(55);  
  hint(DISABLE_OPTIMIZED_STROKE);
  minim = new Minim(this);
}

boolean sketchFullScreen()
{
  return true;
}

Title titleScreen = new Title();
Background mainBG = new Background();
Room currentRoom = new Room();
Square laghal = new Square();
Keys keyboard = new Keys();
Glitchs gl = new Glitchs();
Music ost = new Music();

void draw()
{
  if(!titleScreen.gameStarted)
  {    
    titleScreen.draw();
    ost.load();
    ost.setTitleMusic();
    gl.init();
    keyboard.init();
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
}
