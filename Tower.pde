class Tower{
  float x;
  float y;
  float t = 0, t1 = 0, t2 = 0, t3 = 0;
  int enemy1 = 0, enemy2 = 0, enemy3 = 0;
  Tower(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void buttons(){
    t+=1;
    fill(0,0,150);
    rect(20,50,80,80);
    rect(120,50,80,80);
    rect(220,50,80,80);
    fill(0,100,50);
    rect(350,50,80,80);
    rect(450,50,80,80);
    rect(550,50,80,80);
    rect(650,50,80,80);
    fill(255);
    textSize(20);
    text("10", 80, 130);
    text("18", 180, 130);
    text("30", 280, 130);
    text("15", 410, 130);
    text("15", 510, 130);
    text("15", 610, 130);
    text("15", 710, 130);
    text("+25% bullet speed", 352, 50, 76, 100);
    text("+10 health", 460, 55, 60, 60);
    text("+10% speed", 560, 55, 60, 100);
    text("slow enemies 10 s", 652, 50, 76, 100);
    fill(215+40*sin(t/15),150+40*sin(t/15),50+40*sin(t/15));
    ellipse(60,90,40,40);
    fill(215+40*sin(t/10),215+40*sin(t/10),150+40*sin(t/10));
    ellipse(160,90,50,50);
    fill(180+40*sin(t/5),180+40*sin(t/5),215+40*sin(t/5));
    ellipse(260,90,60,60);
  }
  
  void display1(){
    t1 += 1;
    fill(215+40*sin(t1/15),150+40*sin(t1/15),50+40*sin(t1/15));
    ellipse(x+20,y,40,40);
    for (int i=0; i<7; i++){
      if(t1 > 0){
        break;
      }
      if(enemyBase[i].health > 0){
        enemy1 = i;
        break;
      }
    }
    if (enemyBase[enemy1].health>0){
      ellipse(lerp(x+20,enemyBase[enemy1].xPos,t1/80),lerp(y,enemyBase[enemy1].yPos,t1/80),15,15);
      if (t1 > 80){
        enemyBase[enemy2].health -=1;
      }
    }
    if (t1 > 80){
      t1 = 0;
    }
  }
  
  void display2(){
    t2 += 1;
    fill(215+40*sin(t2/10),215+40*sin(t2/10),150+40*sin(t2/10));
    ellipse(x+50,y+50,50,50);
    for (int i=0; i<7; i++){
      if(t2 > 0){
        break;
      }
      if(enemyBase[i].health > 0){
        enemy2 = i;
        break;
      }
    }
    if (enemyBase[enemy2].health>0){
      ellipse(lerp(x+50,enemyBase[enemy2].xPos,t2/40),lerp(y+50,enemyBase[enemy2].yPos,t2/40),20,20);
      if (t2 > 40){
        enemyBase[enemy2].health -=1;
      }
    }
    if (t2 > 40){
      t2 = 0;
    }
  }
  
  void display3(){
    t3 += 1;
    fill(180+40*sin(t3/5),180+40*sin(t3/5),215+40*sin(t3/5));
    ellipse(x+90,y+110,60,60);
    for (int i=0; i<7; i++){
      if(t3 > 0){
        break;
      }
      if(enemyBase[i].health > 0){
        enemy3 = i;
        break;
      }
    }
    if (enemyBase[enemy3].health>0){
      ellipse(lerp(x+90,enemyBase[enemy3].xPos,t3/20),lerp(y+110,enemyBase[enemy3].yPos,t3/20),25,25);
      if (t3 > 20){
        enemyBase[enemy3].health -=1;
      }
    }
    if (t3 > 20){
      t3 = 0;
    }
  }
  
  int buttonPressed(){
    textSize(48);
    fill(255);
    if (mouseY>50 && mouseY<130){
      if(mouseX>20 && mouseX<100){
        return(1);
      }
      else if(mouseX>120 && mouseX<200){
        return(2);
      }
      else if(mouseX>220 && mouseX<300){
        return(3);
      }
      else if(mouseX>450 && mouseX<530){
        return(4);
      }
      else if(mouseX>550 && mouseX<630){
        return(5);
      }
      else if(mouseX>550 && mouseX<730){
        return(6);
      }
      else if(mouseX>350 && mouseX<430){
        return(7);
      }
    }
    return(0);
  }
}
