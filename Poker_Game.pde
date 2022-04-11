
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
boolean spacekey=false, justClicked=false;
PImage[] cardsprites=new PImage[52];
Deck d;
Hand player;
Hand player2;
Hand player3;
Hand player4;
Input in;
Button b,b2;
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
  b2=new Button(820,700,"Check");
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
      d.shuffe();
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
      if(b.mouseClick()==true){
        g.changeBet(in.getNum());
      }
      
      if(b2.mouseClick()==true){
        collectMoney();
        if(turnnumber==0){
          currentstate=Gamestates.THREECARD;
        }
        if(turnnumber==1){
          currentstate=Gamestates.FOURTHCARD;
        }
        if(turnnumber==2){
          currentstate=Gamestates.FIFTHCARD;
        }
        if(turnnumber==3){
          player.combineC(g.table);
          player.calcScore();
          player2.combineC(g.table);
          player2.calcScore();
          player3.combineC(g.table);
          player3.calcScore();
          player4.combineC(g.table);
          player4.calcScore();
          currentstate=Gamestates.CHECKWINNER;
          if(player.getScore()>player2.getScore() && player.getScore()>player3.getScore() && player.getScore()>player4.getScore()){
            player.addMoney(g.getPot());
          }
          if(player2.getScore()>player.getScore() && player2.getScore()>player3.getScore() && player2.getScore()>player4.getScore()){
            player2.addMoney(g.getPot());
          }
          if(player3.getScore()>player2.getScore() && player3.getScore()>player.getScore() && player3.getScore()>player4.getScore()){
            player3.addMoney(g.getPot());
          }
          if(player4.getScore()>player2.getScore() && player4.getScore()>player3.getScore() && player4.getScore()>player.getScore()){
            player4.addMoney(g.getPot());
          }
        }
      }
    break;
    case CHECKWINNER:
    turnnumber=4;
      if(b2.mouseClick()==true){
        g.reseT();
        currentstate=Gamestates.PASSCARD;
      }
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
  b2.setTextOffset(32);
  b2.setButtonColor(100);
  b2.roundButton(20);
  b2.show();
  spacekey=false;
  justClicked=false;
  player2.hideHand();
  player3.hideHand();
  player4.hideHand();
}
void collectMoney(){
  int bet=g.getCurrentBet();
  g.addPot(player.giveMoney(bet));
  g.addPot(player2.giveMoney(bet));
  g.addPot(player3.giveMoney(bet));
  g.addPot(player4.giveMoney(bet));
  g.changeBet(0);
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
void mouseClicked(){
  justClicked=true;
}
//write a show function that will show the rectangular button and the label on top of the button
//write another function called mouseover that will return a Boolean indicating whether or not your mouse is over the rectangular button
//then create a button object
//then create a button object in the main file
//in the draw function activate the mouseover function of the button object and print the result
