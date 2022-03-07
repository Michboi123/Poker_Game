class Gametable{
  Card[] table;
  float x,y;
  public Gametable(float x,float y){
    this.x=x;
    this.y=y;
    table=new Card[5];
  }
  public void showT(){
    for(int t=0;t<table.length;t++){
      if(table[t]!=null){
        table[t].show();
      }
    }
  }
  public void reseT(){
    table=new Card[5];
  }
  public void place3(Card c1,Card c2,Card c3){
    table[0]=c1;
    c1.setxy(x,y);
    table[1]=c2;
    c2.setxy(x+73,y);
    table[2]=c3;
    c3.setxy(x+146,y);
  }
  public void place1(Card c4){
    table[3]=c4;
    c4.setxy(x+36,y+96);
  }
  public void place11(Card c5){
    table[4]=c5;
    c5.setxy(x+109,y+96);
  }
  public Card[] getCards(){
    return(table);
  }
}
