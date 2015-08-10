void getlost(int i)
{
  if(titleScreen.gameStarted)
    titleScreen.background = 0;
    
  if(currentRoom.glitch)
  {
    currentRoom.region=0;
    currentRoom.glitch=false;
    currentRoom.id=int(random(557,1553));
  }  
  if(titleScreen.gameStarted&&currentRoom.region==0) //WHITEZONE
  {
    if(i<2&&gl.NGRoom!=0)
    {
      currentRoom.id+=(i*2-1)*currentRoom.ground;
    }
    else if(i>1)
    {
      if(currentRoom.ground==1)
      {
        currentRoom.ground+=(i-2)*10+(-i+3)*110;
      }
      else if(currentRoom.ground==11)
      {
        currentRoom.ground+=(i-2)*100-(-i+3)*10;
      }
      else
      {
        currentRoom.ground-=+(i-2)*110+(-i+3)*100;
      }
    }
    if(currentRoom.id==555&&gl.NGRoom!=0)
    {
      currentRoom.region=1;
    }
    if(gl.NGRoom==0&&i<2)
    {
      if(currentRoom.ground==1)
      {
        currentRoom.id+=(i*2-1)*10001;
      }
      else if(currentRoom.ground==11)
      {
        currentRoom.id+=(i*2-1)*10;
      }
      else
      {
        currentRoom.id+=(i*2-1)*1000;
      }
    }
  }
  else if(currentRoom.region==1) //COLOURED ZONE
  {
    if(currentRoom.id%5==0) //DARK ZONE
    {
      if(i<2)
      {
        currentRoom.groundColor=(((currentRoom.groundColor+(i*2-1))%5)+5)%5;
      }
      else
      {
        currentRoom.id+=(((-i+3)*2)-1)*currentRoom.ground;
      }
    }
    else if(currentRoom.groundColor==0) //VIOLET
    {
      if(currentRoom.id%5==1)
      {
        if(i==0)
        {
          currentRoom.region=0;
        }
        else if(i<3)
        {
          currentRoom.id+=currentRoom.ground;
          if(i==1)
            currentRoom.groundColor=1;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
        }
      }
      else if(currentRoom.id%5==2)
      {
        if(i==0) //GLITCH HAUT GAUCHE
        {
          if(gl.room[2])
          {
            currentRoom.glitch=true;
            if(currentRoom.ground==1)
              currentRoom.id+=3;
            else if(currentRoom.ground==11)
              currentRoom.id+=55;
            else if(currentRoom.ground==111)
              currentRoom.id+=777;
            if(currentRoom.id==555)
            {
              gl.unglitch=1;
              gl.room[2]=false;
            }
          }
          else
            currentRoom.region=0;
        }
        else if(i==1)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else if(i==2)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
        }
      }
      else if(currentRoom.id%5==3)
      {
        if(i==0)
        {
          currentRoom.id-=currentRoom.ground;
        }
        else if(i==1)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else if(i==2)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
          currentRoom.groundColor=1;
        }
      }
      else
      {
        if(i==0)
        {
          currentRoom.id-=currentRoom.ground;
        }
        else if(i==1)
        {
          currentRoom.groundColor=2;
        }
        else if(i==2)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else
        {
          currentRoom.groundColor=1;
          currentRoom.id-=3*currentRoom.ground;
        }
      }
    }
    else if(currentRoom.groundColor==1) //ROUGE
    {
      if(currentRoom.id%5==1)
      {
        if(i<3)
        {
          currentRoom.id+=(i+1)*currentRoom.ground;
          if(i==1)
            currentRoom.groundColor=2;
          else if(i==2)
            currentRoom.groundColor=0;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
        }
      }
      else if(currentRoom.id%5==2)
      {
        if(i>1)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;          
        }
        if(i%2==0)
          currentRoom.groundColor=0;
      }
      else if(currentRoom.id%5==3)
      {
        if(i==0||i==3)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id+=((-2)*(i-1)+1)*currentRoom.ground;
        }
      }
      else
      {
        if(i<2)
        {
          currentRoom.id-=(i+1)*currentRoom.ground;
          if(i==1)
            currentRoom.groundColor=2;
        }
        else if(i==2)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else //GLITCH BAS GAUCHE
        {
          if(gl.room[0])
          {
            currentRoom.glitch=true;
            if(currentRoom.ground==1)
              currentRoom.id+=4;
            else if(currentRoom.ground==11)
              currentRoom.id+=66;
            else if(currentRoom.ground==111)
              currentRoom.id+=888;
            if(currentRoom.id==555)
            {
              gl.unglitch=1;
              gl.room[0]=false;
            }
          }
          else
            currentRoom.region=0;
        }
      }
    }
    else if(currentRoom.groundColor==2) //ORANGE
    {
      if(i<2)
      {
        if(currentRoom.id%5==1) //GLITCH BAS GAUCHE & DROITE
        {
          if(i==0&&gl.room[0]||i==1&&gl.room[1])
            currentRoom.glitch=true;
          else
            currentRoom.region=0;
        }
        else if(currentRoom.id%5<4)
        {
          currentRoom.id-=(((currentRoom.id%5)*2)-5)*2*currentRoom.ground;
          currentRoom.groundColor=(((currentRoom.groundColor+(i*2-1))%5)+5)%5;
        }
        else
        {
          currentRoom.groundColor=(((currentRoom.groundColor+2*(i*2-1))%5)+5)%5;
        }
      }
      else
      {
        currentRoom.id+=(2*(-i+3)-1)*currentRoom.ground;
      }
    }
    else if(currentRoom.groundColor==3) //VERT
    {
      if(currentRoom.id%5==1)
      {
        if(i<2)
        {
          currentRoom.id+=(2-i)*currentRoom.ground;
          if(i==0)
            currentRoom.groundColor=2;
        }
        else if(i==2)
        {
          currentRoom.id+=3*currentRoom.ground;
          currentRoom.groundColor=4;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
        }
      }
      else if(currentRoom.id%5==2)
      {
        if(i>1)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;          
        }
        if(i==1||i==2)
          currentRoom.groundColor=4;
      }
      else if(currentRoom.id%5==3)
      {
        if(i%2==1)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id-=(i-1)*currentRoom.ground;
        }
      }
      else
      {
        if(i<2)
        {
          currentRoom.id+=(i-2)*currentRoom.ground;
          if(i==0)
            currentRoom.groundColor=2;
        }
        else if(i==2)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else //GLITCH BAS DROITE
        {
          if(gl.room[1])
          {
            currentRoom.glitch=true;
            if(currentRoom.ground==1)
              currentRoom.id+=8;
            else if(currentRoom.ground==11)
              currentRoom.id+=66;
            else if(currentRoom.ground==111)
              currentRoom.id+=444;
            if(currentRoom.id==555)
            {
              gl.unglitch=1;
              gl.room[1]=false;
            }
          }
          else
            currentRoom.region=0;
        }
      }
    }
    else //BLEU
    {
      if(currentRoom.id%5==1)
      {
        if(i==1)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id+=(((-2)*(i%2))+1)*currentRoom.ground;
          if(i==0)
            currentRoom.groundColor=3;        
        }
      }
      else if(currentRoom.id%5==2)
      {
        if(i==1) //GLITCH HAUT DROITE
        {
          if(gl.room[3])
          {
            currentRoom.glitch=true;
            if(currentRoom.ground==1)
              currentRoom.id+=7;
            else if(currentRoom.ground==11)
              currentRoom.id+=55;
            else if(currentRoom.ground==111)
              currentRoom.id+=333;
            if(currentRoom.id==555)
            {
              gl.unglitch=1;
              gl.room[3]=false;
            }
          }
          else
            currentRoom.region=0;          
        }
        else if(i==0)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else if(i==2)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
        }
      }
      else if(currentRoom.id%5==3)
      {
        if(i==0)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else if(i==1)
        {
          currentRoom.id-=currentRoom.ground;
        }
        else if(i==2)
        {
          currentRoom.region=0;
        }
        else
        {
          currentRoom.id-=currentRoom.ground;
          currentRoom.groundColor=3;
        }
      }
      else
      {
        if(i==1)
        {
          currentRoom.id-=currentRoom.ground;
        }
        else if(i==0)
        {
          currentRoom.groundColor=2;
        }
        else if(i==2)
        {
          currentRoom.id+=currentRoom.ground;
        }
        else
        {
          currentRoom.groundColor=3;
          currentRoom.id-=3*currentRoom.ground;
        }
      }
    }
  }
  if(currentRoom.glitch&&currentRoom.id==555&&gl.NGRoom==1)
    ost.closeMazeMusic();
  if(gl.NGRoom!=0)
    currentRoom.id=(((currentRoom.id % 1000) + 1000) % 1000);
  else
    currentRoom.id=(((currentRoom.id % 100000) + 100000) % 100000);
  if(gl.NGRoom==0&&currentRoom.region!=0)
  {
    currentRoom.region=0;
    currentRoom.id=int(random(0,25525));
  }
  if(currentRoom.id==55555)
  {
    gameFinished=true;
    ost.setEndingMusic();
  }
}
