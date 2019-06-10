class Enemy {
  float xPos, yPos;
  int health, time, e;
  float Xdir, Ydir;
  int t = 200, ogHealth;
  float radius,s,speed,slowSpeed;
  boolean overAttached=false;
  float xLerp,yLerp, xL, yL;
  
  Enemy(float x, float y, float r, int h, int _e, float _s, boolean overA, boolean angryB){
    xPos = x;
    yPos = y;
    ogHealth = h;
    health = h;
    radius = r;
    e = _e;
    s = _s;
    slowSpeed = s*0.25;
    overAttached = overA;
    angryBlob = angryB;
    if (overAttached) {
      xLerp = random(0.05);
      yLerp = random(0.05);
    }
    xL = xLerp;
    yL = yLerp;
    
    
    Xdir = x0 - xPos;
    Ydir = y0 - yPos;
  }
  
  void display() {
    if (e == 1) {
      fill(150,0,0);
      ellipse(xPos,yPos,45,45);
    }
  
    else if (e==2) {
      fill(100,100,100);
      ellipse(xPos,yPos,45,45);
      fill(150,0,0);
      ellipse(xPos-10,yPos-5,15,10);
      ellipse(xPos+10,yPos-5,15,10);
    }
  
    else if (e==3) {
      fill(150,50,0);
      ellipse(xPos,yPos,45,45);
      fill(255);
      rect(xPos-20,yPos-15,40,10);
    }
  
    else if (e==4) {
      fill(125,0,75);
      ellipse(xPos,yPos,45,45);
      stroke(0);
      strokeWeight(5);
      line(xPos-13,yPos-9,xPos-4,yPos-5);
      line(xPos+13,yPos-9,xPos+4,yPos-5);
      fill(255,200,0);
      noStroke();
      ellipse(xPos-10,yPos,6,4);
      ellipse(xPos+10,yPos,6,4);
    }
  
    else if (e==5) {
      fill(200,0,0);
      ellipse(xPos,yPos,60,60);
    }
    
    else if (e==6) {
      fill(255,100,150);
      ellipse(xPos,yPos,45,45);
      stroke(100,150,255);
      strokeWeight(3);
      ellipse(xPos-12,yPos-5,15,10);
      ellipse(xPos+12,yPos-5,15,10);
      line(xPos-4,yPos-5,xPos+4,yPos-5);
    }
  
    else if (e==7) {
      fill(255,0,0);
      ellipse(xPos,yPos,80,80);
      strokeWeight(5);
      stroke(0);
      line(xPos-30,yPos-20,xPos-10,yPos-10);
      line(xPos+30,yPos-20,xPos+10,yPos-10);
      fill(255,200,0);
      noStroke();
      ellipse(xPos-20,yPos,15,10);
      ellipse(xPos+20,yPos,15,10);
      fill(100,0,0);
      bezier(xPos-30,yPos+10,xPos-5,yPos+40,xPos-5,yPos+40,xPos+30,yPos+10);      
    }
    
    else if (e==8) {
      fill(125,0,75);
      ellipse(xPos,yPos,15,15);
    }
    
    textSize(20);
    fill(255);
    if (e!=8) {
      text(health,xPos-3,yPos+5);
      noStroke();
    }
  }
  
  void update() {
    t+=1;
    if (buttons.buttonPressed()==6 && mousePressed && score >=15){
      t=0;
    }
    t+=1;
    if (t<200){
      speed = slowSpeed;
      xLerp = xLerp*0.99;
      yLerp = yLerp*0.99;
    }
    else{
      speed = s;
      xLerp = xL;
      yLerp = yL;
    }
    if (overAttached == true) {
      xPos = lerp(xPos,x0,xLerp);
      yPos = lerp(yPos,y0,yLerp);
    } else {
      xPos += speed*Xdir/60;
      yPos += speed*Ydir/60;
    }
    
    if (xPos < 0 || xPos > width) {
      if (random(1) < 0.5) {
        xPos = random(width);
        yPos = 0;
      } else {
        xPos = random(width);
        yPos = height;
      }
      Xdir = x0 - xPos;
      Ydir = y0 - yPos;
    }
    
    if (yPos < 0 || yPos > height) {
      if (random(1) < 0.5) {
        xPos = width;
        yPos = random(height);
      } else {
        xPos = 0;
        yPos = random(height);
      }
      Xdir = x0 - xPos;
      Ydir = y0 - yPos;
    }
    
    if(dist(x0+15, y0+15, xPos, yPos) < radius-10) {
      if (random(1) < 0.5) {
        xPos = width;
        yPos = random(height);
      } else {
        xPos = 0;
        yPos = random(height);
      }
      Xdir = x0 - xPos;
      Ydir = y0 - yPos;
      
      totalHealth -= 10;
    }
    
    for (int i=0; i<7; i++){
      if(enemyBase[i].health <= 0){
        if (random(1) < 0.5) {
            enemyBase[i].xPos = random(width);
            enemyBase[i].yPos = 0;
        } else {
          enemyBase[i].xPos = random(width);
          enemyBase[i].yPos = height;
        }
          enemyBase[i].Xdir = x0 - enemyBase[i].xPos;
          enemyBase[i].Ydir = y0 - enemyBase[i].yPos;
          
          enemyBase[i].health = ogHealth;
          score += 10;
      }
    }
  }
}
