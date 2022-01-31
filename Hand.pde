class Hand{
  Card card1,card2;
  float x,y;
  public Hand(float x,float y){
    this.x=x;
    this.y=y;
  }
  public void setCards(Card card1,Card card2){
    this.card1=card1;
    this.card2=card2;
    this.card1.setxy(x,y);
    this.card2.setxy(x+73,y);
  }
  public void showHand(){
    this.card1.show();
    this.card2.show();
  }
}
