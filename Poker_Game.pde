
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
Hand player2;
Hand player3;
Hand player4;
Input in;
Button b;
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
  player2=new Hand(427,100);
  player3=new Hand(100,400);
  player4=new Hand(700,400);
  in=new Input(600,700);
  b=new Button(720,700,"Bet");
}
void draw(){
  background(255);
  switch(currentstate){
    case PASSCARD:
    turnnumber=0;
      Card c1=d.passcard();
      Card c2=d.passcard();
      player.setCards(c1,c2);
      Card c3=d.passcard();
      Card c4=d.passcard();
      player2.setCards(c3,c4);
      Card c5=d.passcard();
      Card c6=d.passcard();
      player3.setCards(c5,c6);
      Card c7=d.passcard();
      Card c8=d.passcard();
      player4.setCards(c7,c8);
      currentstate=Gamestates.BET;
    break;
    case THREECARD:
    turnnumber=1;
      g.place3(d.passcard(),d.passcard(),d.passcard());
      currentstate=Gamestates.BET;
    break;
    case FOURTHCARD:
    turnnumber=2;
      g.place1(d.passcard());
      currentstate=Gamestates.BET;
    break;
    case FIFTHCARD:
    turnnumber=3;
      g.place11(d.passcard());
      currentstate=Gamestates.BET;
    break;
    case BET:
      if(spacekey==true && turnnumber==0){
        currentstate=Gamestates.THREECARD;
      }
      if(spacekey==true && turnnumber==1){
        currentstate=Gamestates.FOURTHCARD;
      }
      if(spacekey==true && turnnumber==2){
        currentstate=Gamestates.FIFTHCARD;
      }
      if(spacekey==true && turnnumber==3){
        player.combineC(g.table);
        player.calcScore();
        player2.combineC(g.table);
        player2.calcScore();
        player3.combineC(g.table);
        player3.calcScore();
        player4.combineC(g.table);
        player4.calcScore();
        currentstate=Gamestates.CHECKWINNER;
      }
    break;
    case CHECKWINNER:
    turnnumber=4;
      
    break;
  }
  player.showHand();
  player2.showHand();
  player3.showHand();
  player4.showHand();
  in.show();
  g.showT();
  b.setTextOffset(32);
  b.setButtonColor(100);
  b.roundButton(20);
  b.show();
  b.mouseover();
  spacekey=false;
}
void keyPressed(){
  if(keyCode==32){
    spacekey=true;
  }
  if(keyCode>47 && keyCode<58){
    in.addChar(key);
  }
  if(keyCode==8){
    in.deleteChar();
  }
}
//write a show function that will show the rectangular button and the label on top of the button
//write another function called mouseover that will return a Boolean indicating whether or not your mouse is over the rectangular button
//then create a button object
//then create a button object in the main file
//in the draw function activate the mouseover function of the button object and print the result
