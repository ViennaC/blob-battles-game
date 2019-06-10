class Button {
  float x,y,w,h;
  String s;
  color c, _c, textCol;
  color newC;
  boolean yFill;
  Button(float _x, float _y, float _w, float _h, String _s, color _c, color _textCol, boolean yFill) {
    this.x = _x;
    this.y = _y;
    this.w = _w;
    this.h = _h;
    this.s = _s;
    this._c = _c;
    this.c = _c;
    this.textCol = _textCol;
    newC = color(c,150);
    this.yFill = yFill;
  }
  
  void display() {
    noStroke();
    intersect();
    textSize(36);
    if (yFill) {
      fill(c);
      rect(x,y,w,h);
      fill(textCol);
      textAlign(CENTER);
      text(s,x+w/2,y+h-10);
    } else {
      noFill();
      rect(x,y,w,h);
    }
  }
  
  boolean intersect() {
    if (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h) {
      if (yFill) {
        c = newC;
      } else {
        stroke(255);
      }
      return true;
    } else {
      if (yFill) {
        c = _c;
      } else {
        noStroke();
      }
      return false;
    }
  }
}
