class Room
{
  float alpha;
  int region;
  int ground;
  int id;
  float doorSize;
  int groundColor;
  float size;
  boolean glitch;  
  
  Room()
  {
    alpha=0;
    ground=1;
    region=0;
    id=0;
    groundColor=2;
    glitch = false;
  }
    
  void draw()
  {
    //size = (height/1.2)-(height/10)+(height/55)*cos(alpha*2);    
    if(gameFinished)
      size=(1-(gl.unglitch/256))*((height/1.2)-(height/10)+(height/55)*cos(alpha*2));
    else
      size = (height/1.2)-(height/10)+(height/55)*cos(alpha*2);
      
    doorSize = (titleScreen.av/256)*size/7;  
    rectMode(CENTER);
    strokeWeight(height/50);
    
    if(glitch)
    {
      fill((1-(gl.unglitch/256))*random(0,2)*55,(1-(gl.unglitch/256)),(1-(gl.unglitch/256))*random(0,2)*55);//,(1-(gl.unglitch/256))*255);
      stroke(255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(0,2)*105,255*(gl.unglitch/256),255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(0,2)*105);
    }
    else if(gameFinished) //VIRER LE ELSE SI BUG AINSI QUE LES // APRES LE ELSE SUIVANT
    {
      noFill();
      stroke(0,0,0,(1-(gl.unglitch/256))*255);
    }
    else //if(!glitch)
    {
      stroke(region*(1-ceil(((id%5)-0.1)/5))*255);
      fill(255-region*(1-ceil(((id%5)-0.1)/5))*255);
    }       
    pushMatrix();
    translate(-laghal.x+width/2, -laghal.y+height/2);
    pushMatrix();
    if(gl.unglitch>0&&!currentRoom.glitch)
    {
      rotate(-(256-gl.unglitch)*PI/512);
    }
    else if(!titleScreen.gameStarted)
    {
      if(titleScreen.press && titleScreen.background<255)
      {
        alpha-=(alpha/5)+(PI/1000);
        if(alpha<0.05&&alpha>-0.05)
          alpha=0;
      }
      rotate(alpha);
    }

    rect(0, 0, size, size);     
    noStroke();
    rect(0, 0, size+height/50, doorSize*2);
    rect(0, 0, doorSize*2, size+height/50);
    popMatrix();     
    textSize(height/10);
    if(glitch)
    {
      strokeWeight(height/150);
      fill(255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(0,2)*127,255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(0,2)*127,255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(0,2)*127,255-gl.unglitch);      
    }
    else if(gl.unglitch>0)
      fill(region*(1-ceil(((id%5)-0.1)/5))*255,region*(1-ceil(((id%5)-0.1)/5))*255,region*(1-ceil(((id%5)-0.1)/5))*255,255-gl.unglitch);
    else if(!gameFinished)
      fill(region*(1-ceil(((id%5)-0.1)/5))*255,region*(1-ceil(((id%5)-0.1)/5))*255,region*(1-ceil(((id%5)-0.1)/5))*255,titleScreen.av);    
    else
      fill(0,0,0,(1-(gl.unglitch/256))*255);
      
    if(gl.NGRoom!=0)
    {  
      if(id>99)
        text(id, 0, 0);
      else if(id>9)
        text("0"+id,0,0);
      else
        text("00"+id,0,0);
    }
    else
    {
      if(id>9999)
        text(id, 0, 0);
      else if(id>999)
        text("0"+id,0,0);
      else if(id>99)
        text("00"+id,0,0);
      else if(id>9)
        text("000"+id,0,0);
      else
        text("0000"+id,0,0);
    }
    popMatrix(); 
    
    if(titleScreen.background<255&&titleScreen.gameStarted) //Transition
    {
      titleScreen.background+=15;
      fill(region*255,region*255,region*255,(255-titleScreen.background));
      noStroke();        
      rect(width/2,height/2,width,height);
    }
    alpha=(alpha+PI/1000)%(2*PI);
  }
}
