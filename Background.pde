class Background
{
  float alpha = 0;
  float size;
  float r=0;
  float v=0;
  float b=0;
  
  void draw(boolean squared)
  {
    if(squared&&currentRoom.region==0||currentRoom.id%5!=0)
    {
      noStroke();
      fill(255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,125);
      rect(displayWidth/2, (displayHeight+1)/2, displayWidth, displayHeight+1);      
    }
    else if(currentRoom.glitch)
    {
      background(int(random(0,2))*25,0,int(random(0,2))*25);
    }
    else
    {
      background(0);
    }
    if(squared)
    {
      alpha+=PI/1000;
      strokeWeight(height/100);
      stroke(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255);
      
      if(currentRoom.region==0)     
        fill(255,255,255,150);
      else if(currentRoom.groundColor==0) //VIOLET
        fill(255,5,205,150);
      else if(currentRoom.groundColor==1) //ROUGE
        fill(255,5,5,150);
      else if(currentRoom.groundColor==2) //ORANGE
        fill(255,200,5,150);
      else if(currentRoom.groundColor==3) //VERT
        fill(105,255,105,150);
      else if(currentRoom.groundColor==4) //BLEU
        fill(105,205,255,150);
        
      pushMatrix();
      
      translate((width/2)-laghal.x, (height/2)-laghal.y);
      
 
      for(int i=6;i>2;i--)
      {        
        if(currentRoom.ground>12)
        {
           rotate(-alpha*(i+1)/6);
        }
        else if(currentRoom.ground>2)
        {
          rotate(alpha/6);
        }
        size = (height/3)*sin((2*i)*(PI/12)+alpha)*sin((2*i)*(PI/12)+alpha)+currentRoom.size;        
        rect(0, 0, size, size);
      }
      popMatrix();      
    }
  }
}
