class Square
{
  float x;
  float[] old_x;  
  float y;
  float[] old_y;
  float vx;
  float vy;
  float size;
  float[] old_s;
  float max;
  int[][] newRoomMap ={{2, 0, 3, 1},
                       {3, 1, 2, 0},
                       {1, 2, 0, 3},
                       {0, 3, 1, 2}};
  
  Square()
  {
    x=0;
    y=0;
    vx=0;
    vy=0;
    max = currentRoom.size/8;
    old_x=new float[15];
    old_y=new float[15];
    old_s=new float[15];   
    for(int i=0;i<15;i++)
    {
      old_x[i]=0;
      old_y[i]=0;
      old_s[i]=height/20; 
    }
  }
  
  void draw()
  {
    old_x[14]=x;
    old_y[14]=y;
    old_s[14]=size;
    for(int i=0;i<14;i++)
    {
       old_x[i]=old_x[i+1];
       old_y[i]=old_y[i+1];
       old_s[i]=old_s[i+1];
    }    
    max = currentRoom.size/8;
    if(gameFinished&&gl.unglitch>255)
      translate(eye.x+width/2, eye.y+height/2);
    else
      translate(width/2, height/2);
    strokeWeight(height/125);
    size=height/20;
    if(frameCount%75<4||frameCount%75<9&&frameCount%75>5)
    {
      size-=height/75;
    }
    if(menu.stg[1])
    {
      for(int i=0;i<14;i+=1)
      {
        if(!currentRoom.glitch)
        {
          fill((1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),(1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),(1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),titleScreen.av);
          stroke((1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),(1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),(1-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5)))*(16-i)*15+(i+1)*15*(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))),titleScreen.av);
          rect(old_x[i]-x,old_y[i]-y,old_s[i]*(i+1)/15,old_s[i]*(i+1)/15);
        }
        else
        {
          fill(random(0,2)*127,random(0,2)*127,random(0,2)*127);
          stroke(random(1,2)*127,0,random(1,2)*127);
          rect(old_x[i]-x+random(-5,5),old_y[i]-y+random(-5,5),old_s[i]*(i+1)/15,old_s[i]*(i+1)/15);
        }
      }
    }
    if(!currentRoom.glitch)
    {
      fill(255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,255-currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,titleScreen.av);    
      stroke(currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,currentRoom.region*(1-ceil(((currentRoom.id%5)-0.1)/5))*255,titleScreen.av); 
    }
    else
    {
      fill((1-(gl.unglitch/256))*random(0,2)*127,(1-(gl.unglitch/256))*random(0,2)*127,(1-(gl.unglitch/256))*random(0,2)*127);
      stroke(255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(1,2)*127,255*(gl.unglitch/256),255*(gl.unglitch/256)+(1-(gl.unglitch/256))*random(1,2)*127);
    }
    rect(0,0,size,size);    
  }
  
  void move()
  {        
    if(keyboard.keys[0]&&keyboard.keys[2]&&vx*vx+vy*vy<max*max)
    {
      vy-=1;
      vx-=1;
    }
    else if(keyboard.keys[0]&&keyboard.keys[3]&&vx*vx+vy*vy<max*max)
    {
      vy-=1;
      vx+=1;
    }
    else if(keyboard.keys[1]&&keyboard.keys[2]&&vx*vx+vy*vy<max*max)
    {
      vy+=1;
      vx-=1;
    }
    else if(keyboard.keys[1]&&keyboard.keys[3]&&vx*vx+vy*vy<max*max)
    {
      vy+=1;
      vx+=1;
    }
    else if(keyboard.keys[0]&&vy>-max)
      vy-=2;
    else if(keyboard.keys[1]&&vy<max)
      vy+=2;
    else if(keyboard.keys[2]&&vx>-max)
      vx-=2; 
    else if(keyboard.keys[3]&&vx<max)
      vx+=2;
      
    if(vx*vx>0.5)
      x+=vx;
    if(vy*vy>0.5)
      y+=vy;
    
    if(x>(currentRoom.size/2)-(size/2)-(height/100)&&y*y+size*size+height*height/500>currentRoom.doorSize*currentRoom.doorSize)
    {
      vx=0;
      x = (currentRoom.size/2)-(size/2)-(height/100);
    }
    else if(x<-(currentRoom.size/2)+(size/2)+(height/100)&&y*y+size*size+height*height/500>currentRoom.doorSize*currentRoom.doorSize)
    {
      vx=0;
      x = -(currentRoom.size/2)+(size/2)+(height/100);
    }
    if(y>(currentRoom.size/2)-(size/2)-(height/100)&&x*x+size*size+height*height/500>currentRoom.doorSize*currentRoom.doorSize)
    {
      vy=0;
      y = (currentRoom.size/2)-(size/2)-(height/100);
    }
    else if(y<-(currentRoom.size/2)+(size/2)+(height/100)&&x*x+size*size+height*height/500>currentRoom.doorSize*currentRoom.doorSize)
    {
      vy=0;
      y = -(currentRoom.size/2)+(size/2)+(height/100);      
    }
    
    if(vx>0)
    {
      vx=min(vx,sqrt(max));
      vx-=0.5;
    }
    else if(vx<0)
    {
      vx=max(vx,-sqrt(max));
      vx+=0.5;
    }
    if(vy>0)
    {
      vy=min(vy,sqrt(max));
      vy-=0.5;
    }
    else if(vy<0)
    {
      vy=max(vy,-sqrt(max));
      vy+=0.5;
    }
          
    if(2*x<=-currentRoom.size+size+height/50&&y*y+size*size+height*height/500<currentRoom.doorSize*currentRoom.doorSize&&vx<-sqrt(0.5)) //LEFT -> 0
    {
      getlost(newRoomMap[3][gl.NGRoom%4]);
      vx-=3;
      x=-x;
    }
    else if(2*x>=currentRoom.size-size-height/50&&y*y+size*size+height*height/500<currentRoom.doorSize*currentRoom.doorSize&&vx>sqrt(0.5)) //RIGHT -> 1
    {
      getlost(newRoomMap[2][gl.NGRoom%4]);
      vx+=3;
      x=-x;
    }
    else if(2*y<=-currentRoom.size+size+height/50&&x*x+size*size+height*height/500<currentRoom.doorSize*currentRoom.doorSize&&vy<-sqrt(0.5)) //UP -> 2
    {
      getlost(newRoomMap[0][gl.NGRoom%4]);
      vy-=3;
      y=-y;
    }
    else if(2*y>=currentRoom.size-size-height/50&&x*x+size*size+height*height/500<currentRoom.doorSize*currentRoom.doorSize&&vy>sqrt(0.5)) //DOWN -> 3
    {
      getlost(newRoomMap[1][gl.NGRoom%4]);
      vy+=3;
      y=-y;
    }
    /*if(x>(currentRoom.size/2)-(size/2)&&vx*vx<0.5)
    {
      max=55555;
      vx+=55555;
    }
    else if(x<-(currentRoom.size/2)+(size/2)&&vx*vx<0.5)
    {
      max=55555;
      vx-=55555;
    }
    else if(y<-(currentRoom.size/2)+(size/2)&&vy*vy<0.5)
    {
      max=55555;
      vy-=55555;
    }
    else if(y<-(currentRoom.size/2)+(size/2)&&vy*vy<0.5)
    {
      max=55555;
      vy+=55555;
    }
    if(max>(width/18.75)+1&&vx*vx+vy*vy<width*0.04*width*0.04)
      max=height/18.75;*/
  }
}
