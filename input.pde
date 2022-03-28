class Input{
  float x,y,w,h;
  String input;
  public Input(){
    x=0;
    y=0;
    w=100;
    h=50;
    input="";
  }
  public Input(float x,float y){
    this.x=x;
    this.y=y;
    this.w=100;
    this.h=50;
    input="";
  }
  public void show(){
    fill(255);
    rect(x,y,w,h);
    fill(0);
    textSize(20);
    text(input,x,y+30);
  }
  public void addChar(char n){
   input+=n;
  }
  public void deleteChar(){
    if(input.length()>0){
    input=input.substring(0,input.length()-1);
    }
  }
  public int getNum(){
    return(int(input));
  }
}
