class Deck{
  Card[] cl;
  int topcard=0;
  public Deck(){
    cl=new Card[52];
    int c=0;
    for(int f=0;f<13;f++){
      cl[c]=new Card(f+1,"Diamonds",cardsprites[c]);
      c+=1;
      cl[c]=new Card(f+1,"Clubs",cardsprites[c]);
      c+=1;
      cl[c]=new Card(f+1,"Hearts",cardsprites[c]);
      c+=1;
      cl[c]=new Card(f+1,"Spades",cardsprites[c]);
      c+=1;
    }
  }
  public void showAllCards(){
    int n=0;
    for(int z=0;z<4;z++){
      for(int s=0;s<13;s++){
        cl[n].setxy(s*73,z*96);
        cl[n].show();
        n++;
      }
    }
  }
  public void shuffe(){
    for(int i=0;i<52;i++){
      int n=int(random(52));
      int num=n;
      Card temp=cl[i];
      cl[i]=cl[num];
      cl[num]=temp; 
    }
    topcard=0;
  }
  public Card passcard(){
    topcard++;
    return(cl[topcard]);
  }
}
