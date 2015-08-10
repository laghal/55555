class Glitchs
{
  boolean[] room;
  //int krr; SI PAS UTILER VIRER
  float unglitch;
  int NGRoom;
  
  Glitchs()
  {
    unglitch=0;
    //krr = 30; SI PAS UTILE VIRER
    NGRoom=1;
    room=new boolean[4];
    room[0]=false; //BAS GAUCHE//TRUEPARDEFAUT
    room[1]=false; //BAS DROITE
    room[2]=false;//HAUT GAUCHE
    room[3]=true;//HAUT DROITE
  }
  
  void update()
  {
    NGRoom=0;
    for(int i=0;i<4;i++)
    {
      if(room[i])
        NGRoom++;
    }
  }
}
