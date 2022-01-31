class Card{
  int num;
  float x,y,w,h;
  String suit;
  PImage sprite;
  public Card(int num,String suit,PImage sprite){
    this.num=num;
    this.suit=suit;
    this.sprite=sprite;
    x=0;
    y=0;
    w=73;
    h=96;
  }
  public void setxy(float x,float y){
    this.x=x;
    this.y=y;
  }
  public void show(){
    image(sprite,x,y,w,h);
  }
}
