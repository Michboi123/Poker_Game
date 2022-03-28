class Hand{
  Card card1,card2;
  Card[] combine;
  float x,y;
  int score;
  public Hand(float x,float y){
    this.x=x;
    this.y=y;
    score=0;
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
    fill(0);
    text(score,x,y-10);
  }
  public void combineC(Card[] cs){
    combine=new Card[7];
    combine[0]=cs[0];
    combine[1]=cs[1];
    combine[2]=cs[2];
    combine[3]=cs[3];
    combine[4]=cs[4];
    combine[5]=card1;
    combine[6]=card2;
    sortA();
  }
  public void sortA(){
    Card temp;
    for(int g=0;g<7-1;g++){
      for(int e=0;e<7-1;e++){
        if(combine[e].num>combine[e+1].num){
          temp=combine[e];
          combine[e]=combine[e+1];
          combine[e+1]=temp;
        }
      }
    }
  }
  public int highcard(){
    int highest=0;
    for(int g=0;g<combine.length;g++){
      if(highest<combine[g].num){
        highest=combine[g].num;
      }
    }
    return(highest);
  }
  public int straitflush(){
      for(int y=0; y<3; y++){
        if(combine[y].num==combine[y+1].num-1 && combine[y].num==combine[y+2].num-2 && combine[y].num==combine[y+3].num-3 && combine[y].num==combine[y+4].num-4){
          if(combine[y].suit==combine[y+1].suit && combine[y].suit==combine[y+2].suit && combine[y].suit==combine[y+3].suit && combine[y].suit==combine[y+4].suit){
            return(combine[y+4].num+800);
          }
        }
      }
    return(0);
  }
  public int strait(){
    int counter=0;
    int highest=0;
    for(int y=0;y<6;y++){
      if(combine[y].num==combine[y+1].num-1){
        counter+=1;
        if(counter==4){
          highest=combine[y].num;
          return(combine[y].num+400);
        }
      }
      else{
        counter=0;
      } 
    }
    return(0);
  }
  public int doubles(){
    int highest=0;
    for(int y=0;y<6;y++){
      if(combine[y].num==combine[y+1].num){
        highest=combine[y].num;
        return(combine[y].num+100);
      }
    }
    return(0);
  }
  public int triples(){
    int highest=0;
    for(int y=0;y<5;y++){
      if(combine[y].num==combine[y+1].num && combine[y].num==combine[y+2].num){
        highest=combine[y].num;
        return(combine[y].num+300);
      }
    }
    return(0);
  }
  public int fullHouse(){
    int highest=0;
    boolean three=false;
    boolean two=false;
    for(int y=0;y<5;y++){
      if(combine[y].num==combine[y+1].num && combine[y].num==combine[y+2].num){
        highest=combine[y].num;
        three=true;
      }
    } 
    for(int y=0;y<6;y++){
      if(combine[y].num==combine[y+1].num && combine[y].num!=highest){
        two=true;
      }
    } 
    if(two==true && three==true){
      return(highest+600);
    }
    return(0);
  }
  public int quads(){
    int highest=0;
    for(int y=0;y<4;y++){
      if(combine[y].num==combine[y+1].num && combine[y].num==combine[y+2].num && combine[y].num==combine[y+3].num){
        highest=combine[y].num;
        return(combine[y].num+700);
      }
    }
    return(0);
  }
  public int doubles2(){
    int counter=0;
    int highest=0;
    for(int y=0;y<6;y++){
      if(combine[y].num==combine[y+1].num){
        counter+=1;
      }
      if(counter==2){
        highest=combine[y].num;
        return(combine[y].num+200);
      }
    }
    return(0);
  }
  public int flush(){
    int Dcount=0;
    int Hcount=0;
    int Scount=0;
    int Ccount=0;
    int highest=0;
    for(int y=0;y<7;y++){
      if(combine[y].suit=="Hearts"){
        Hcount+=1;
        if(Hcount==5){
          highest=combine[y].num;
          return(combine[y].num+500);
        }
      }
      if(combine[y].suit=="Diamonds"){
        Dcount+=1;
        if(Dcount==5){
          highest=combine[y].num;
          return(combine[y].num+500);
        }
      }
      if(combine[y].suit=="Spades"){
        Scount+=1;
        if(Scount==5){
          highest=combine[y].num;
          return(combine[y].num+500);
        }
      }
      if(combine[y].suit=="Clubs"){
        Ccount+=1;
        if(Ccount==5){
          highest=combine[y].num;
          return(combine[y].num+500);
        }
      }
    }
    return(0);
  }
  public void calcScore(){
    if(straitflush()!=0){
      score=straitflush();
      print("got a straitflush");
    }
    else if(quads()!=0){
      score=quads();
      print("got a quad");
    }
    else if(fullHouse()!=0){
      score=fullHouse();
      print("got a fullhouse");
    }
    else if(flush()!=0){
      score=flush();
      print("got a flush");
    }
    else if(strait()!=0){
      score=strait();
      print("got a strait");
    }
    else if(triples()!=0){
      score=triples();
      print("got a triple");
    }
    else if(doubles2()!=0){
      score=doubles2();
      print("got a 2double");
    }
    else if(doubles()!=0){
      score=doubles();
      print("got a double");
    }
    else{
      score=highcard();
    }
  }
}
