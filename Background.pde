class Background
{
  float alpha;
  float size;
  float r;
  float v;
  float b;
  
  Background()
  {
    alpha=0;
    r=0;
    v=0;
    b=0;
  }
  
  void draw()
  {
    if(currentRoom.region==0&&!currentRoom.glitch||currentRoom.id%5!=0&&!currentRoom.glitch)
    {
      noStroke();
      fill(255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,125);
      rect(displayWidth/2, (displayHeight+1)/2, displayWidth, displayHeight+1);      
    }
    else
      background(0);
    if(gameFinished)
      background(256-gl.unglitch);
      
    strokeWeight(height/100);
    stroke(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255);
    if(currentRoom.region==0)  
    {   
      fill(255,255,255,150);
    }
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
    alpha+=PI/1000;
    
    for(int i=6;i>2;i--)
    {   
      if(currentRoom.glitch)
      {
        fill(random(0,2)*127,random(0,2)*127,random(0,2)*127);
        stroke(random(1,2)*127,0,random(1,2)*127);
        alpha=random(0,2*PI);
        rotate(alpha);
      }     
      else if(currentRoom.ground>12)
         rotate(-alpha*(i+1)/6);
      else if(currentRoom.ground>2)
        rotate(alpha/6);
      
      size = (1-(gl.unglitch/256))*(((height/3)*sin((2*i)*(PI/12)+alpha)*sin((2*i)*(PI/12)+alpha)+(height/1.2)-(height/10)+(height/55)*cos(alpha*2))*titleScreen.av/256);        
      rect(0, 0, size, size);
    }
    popMatrix();      
  }
}
