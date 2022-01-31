enum Gamestates{
  PASSCARD,
  THREECARD,
  FOURTHCARD,
  FIFTHCARD,
  BET,
  CHECKWINNER
}
Gamestates currentstate=Gamestates.PASSCARD;
Gametable g;
int turnnumber=0;
boolean spacekey=false;
PImage[] cardsprites=new PImage[52];
Deck d;
Hand player;
void setup(){
  size(1000,800);
  PImage diamonds=loadImage("diamonds-cards.jpg");
  PImage hearts=loadImage("hearts-cards.jpg");
  PImage spades=loadImage("spades-cards.jpg");
  PImage clubs=loadImage("clubs-cards.jpg");
  int c=0;
  for(int h=0;h<13;h++){
    cardsprites[c]=diamonds.get(h*73,0,73,96);
    c++;
    cardsprites[c]=clubs.get(h*73,0,73,96);
    c++;
    cardsprites[c]=hearts.get(h*73,0,73,96);
    c++;
    cardsprites[c]=spades.get(h*73,0,73,96);
    c++;
  }
  d=new Deck();
  g=new Gametable(400,400);
  d.shuffe();
  player=new Hand(427,700);
}
void draw(){
  switch(currentstate){
    case PASSCARD:
    turnnumber=0;
      Card c1=d.passcard();
      Card c2=d.passcard();
      player.setCards(c1,c2);
      currentstate=Gamestates.BET;
    break;
    case THREECARD:
    turnnumber=1;
      g.place3(d.passcard(),d.passcard(),d.passcard());
      currentstate=Gamestates.BET;
    break;
    case BET:
      if(spacekey==true && turnnumber==0){
        currentstate=Gamestates.THREECARD;
      }
      if(spacekey==true && turnnumber==1){
        currentstate=Gamestates.THREECARD;
      }
    break;
  }
  player.showHand();
  g.showT();
  spacekey=false;
}
void keyPressed(){
  if(keyCode==32){
    spacekey=true;
  }
}
//Homework: write a shuffle function in deck that will randomize the positions of the card objects in the array.