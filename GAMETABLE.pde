class Gametable{
  Card[] table;
  int pot,currentB;
  float x,y;
  public Gametable(float x,float y){
    this.x=x;
    this.y=y;
    table=new Card[5];
    pot=0;
    currentB=0;
  }
  public void showT(){
    for(int t=0;t<table.length;t++){
      if(table[t]!=null){
        table[t].show();
        fill(0);
        text(currentB,x+50,y-10);
      }
    }
  }
  public void reseT(){
    table=new Card[5];
    pot=0;
    currentB=0;
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
  public void changeBet(int currentB){
    this.currentB=currentB;
  }
  public int getCurrentBet(){
    return(currentB);
  }
  public void addPot(int money){
    pot=pot+money;
  }
  public int getPot(){
    return(pot);
  }
}

//1) In the showTable function, also draw the currentBet on the screen.
//2) create a money variable in the hand class
//3) in the constructor set the money variable to be 1000
//4) in the showHands function draw out the money variable on the screen
//5) write a function called giveMoney with a number parameter.
//-subtract from how much money the hand has based on the money parameter
//-also return the money parameter
