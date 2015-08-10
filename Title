class Title
{
  boolean press;
  boolean gameStarted;
  Room titleRoom;
  float background;
  float av;
  
  Title()
  {
    press = false;
    gameStarted = false;
    titleRoom = new Room();
    background = 155;
    av=0;
  }
  
  void draw()
  {  
    titleRoom.draw();
    textSize(height/5);
    fill(5,5,5,255-av);
    text("55555", width/2, (height/2)-(height/20));
    textSize(height/25);
    fill(55,55,55,255-av);
    text("Press any key to begin", width/2, (height/2)+(height/10));
    if(press && background<255)
    {
      background+=0.5;
      if(av<255)
        av+=2;
    }
    else if(background>=255)
    {      
      getlost(1);
      gameStarted = true;
      ost.setMazeMusic();
    }
  }
  
  void keyPressed()
  {
    if(keyPressed)
    {
      press = true;
      ost.startSound();
    }
  }
}
