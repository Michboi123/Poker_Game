class Button{
  float x,y,w,h,radius,textOffset;
  int btnclr;
  String label;
  public Button(){
    x=0;
    y=0;
    w=200;
    h=100;
    radius=0;
    btnclr=0;
    textOffset=20;
    label="none";
  }
  public Button(float x, float y, String label){
    this.x=x;
    this.y=y;
    w=100;
    h=50;
    this.label=label;
  }
  public void roundButton(float corner){
    if(corner>w){
      radius=w;
    }
    else if(corner>h){
      radius=h;
    }
    else{
      radius=corner;
    }
  }
  public void setButtonColor(int clr){
    btnclr=clr;
  }
  public void setTextOffset(float offset){
    textOffset=offset;
  }
  public void show(){
      stroke(btnclr);
      fill(btnclr);
      rect(x+radius,y,w-(radius*2),h);
      rect(x,y+radius,w,h-(radius*2));
      circle(x+radius,y+radius,2*radius);
      circle(x+w-radius,y+radius,2*radius);
      circle(x+radius,y+h-radius,2*radius);
      circle(x+w-radius,y+h-radius,2*radius);
      fill(255);
      textSize(20);
      text(label,x+textOffset,y+30);
  }
  public boolean mouseover(){
    if((mouseX>= x-20 && mouseX<=x+20) && (mouseY>=y-20 && mouseY<=y+20)) {
      print("true");
      return(true);
    } 
    else{
      return(false);
    }
  }
}
