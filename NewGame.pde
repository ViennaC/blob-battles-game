class Game {
  int counter;
  Game() {   
  }
  
  void display() {
    buttons.buttons();
    restart2.display();
    if(towerCount1>=1){
      tower1.display1();
    }
    if(towerCount1>=2){
      tower2.display1();
    }
    if(towerCount1>=3){
      tower3.display1();
    }
    if(towerCount1>=4){
      tower4.display1();
    }
    if(towerCount1>=5){
      tower5.display1();
    }
    if(towerCount2>=1){
      tower1.display2();
    }
    if(towerCount2>=2){
      tower2.display2();
    }
    if(towerCount2>=3){
      tower3.display2();
    }
    if(towerCount2>=4){
      tower4.display2();
    }
    if(towerCount2>=5){
      tower5.display2();
    }
    if(towerCount3>=1){
      tower1.display3();
    }
    if(towerCount3>=2){
      tower2.display3();
    }
    if(towerCount3>=3){
      tower3.display3();
    }
    if(towerCount3>=4){
      tower4.display3();
    }
    if(towerCount3>=5){
      tower5.display3();
    }
    for(int i = 0; i < numEnemies; i++) {
      enemyBase[i].display();
      enemyBase[i].update();
      if (angryBlob==true) {
        bullets[i].display();
        bullets[i].update();
      }
    }
    you.display();
    you.update();
    s.display(enemyBase);
    textAlign(LEFT);
    textFont(f,36);
    fill(255);
    text("Health: " + totalHealth,10,200);
    text("Score: " + score, 10, 250);
    if ((tmt == false && score >= 100) || (tmt == true && score >= 100*(e+1))) {
      text("Base Unlocked!", 10, 400);
      fill(#1ED3F5,200+55*cos(PI*counter/12));
      rect(finishLX-10*(cos(PI*counter/12)),0,100+10*cos(PI*counter/12),40+10*cos(PI*counter/12));
      counter ++;
      if (counter == 25) {
        counter = 0;
      }
      }
    }
  
  void reset() {
    you = new Protagonist();
    s = new Shoot();
    info = new EnemyInfo(50,340,table);
    win = false;
    lose = false;
    finishLX = random(width-100);
    finishRX = finishLX+100;
    if (tmt == false) {
      e = 0;
      score = 0;
    }
    shoot = false;
    totalHealth = 100;
    towerCount1 = 0;
    towerCount2 = 0;
    towerCount3 = 0;
    bulletSpeed=1;
    pxSpeed = 0.5;
    pySpeed = 0.5;
  }
  
  void winDisplay() {
    t+=1;
    background(0);
    stroke(200+30*sin(t/5),100+20*sin(t/5),20+10*sin(t/5));
    strokeWeight(15);
        for (int i=0; i<11; i++){     
          pushMatrix();
          translate(375+200*sin(t/20),375+200*cos(t/20));
          rotate(i*PI/5.5+sin(t/30));
          line(0,0,150+50*sin(t/5+sin(10*i)),0);
          popMatrix();
        } 
    strokeWeight(5);
    fill(225+30*sin(t/5),150+20*sin(t/5),50+10*sin(t/5));
    pushMatrix();
    translate(375+200*sin(t/20),375+200*cos(t/20));
    ellipse(0,0,150,150);
    stroke(0);
    strokeWeight(10);
    line(-70,-20,70,-20);
    noStroke();
    fill(0);
    ellipse(-35,-15,55,40);
    ellipse(35,-15,55,40);
    fill(150,0,0);
    bezier(-50,20,-30,70,30,70,50,20);
    popMatrix();
    fill(255);
    textSize(100);
    fill(255);
    textAlign(CENTER);
    text("Victory!", width/2, 200);
    textSize(36);
    textAlign(CENTER);
    text("Score: " + score, width/2, 370);
    main.display();
    restart.display();
  } 
    
  void loseDisplay() {
    t+=1;
    background(0);
    stroke(200+30*sin(t/5),100+20*sin(t/5),20+10*sin(t/5));
    strokeWeight(15);
        for (int i=0; i<11; i++){     
          pushMatrix();
          translate(375+200*sin(t/20),375+200*cos(t/20));
          rotate(i*PI/5.5+sin(t/30));
          line(0,0,150+50*sin(t/5+sin(10*i)),0);
          popMatrix();
        } 
    strokeWeight(5);
    fill(225+30*sin(t/5),150+20*sin(t/5),50+10*sin(t/5));
    pushMatrix();
    translate(375+200*sin(t/20),375+200*cos(t/20));
    ellipse(0,0,150,150);
    stroke(0);
    strokeWeight(10);
    line(-70,-20,70,-20);
    noStroke();
    fill(0);
    ellipse(-35,-15,55,40);
    ellipse(35,-15,55,40);
    fill(150,0,0);
    bezier(-40,50,-30,0,30,0,40,50); 
    popMatrix();
    fill(255);
    textSize(100);
    textAlign(LEFT);
    text("Try Again",180,250);
    textSize(36);
    main.display();
    restart.display();
  }

  void howToDisplay() {
    t+=1;
    fill(255);
    background(0);
    textSize(25);
    textAlign(LEFT);
    text("Avoid your enemies.", 150, 50);
    text("Press Space to Shoot.", 150, 75);
    text("Use points to buy Power-Ups.", 150, 100);
    text("Get to 100 points to reveal your base.", 150, 125);
    textSize(36);
    text("QUICK PLAY MODE", 25, 180);
    textSize(25);
    text("Choose your enemy", 50, 225);
    text("Win by defeating enough enemies to reveal the base", 50, 250);
    textSize(36);
    text("TOURNAMENT MODE", 25, 300);
    textSize(25);
    text("Play different enemies", 50, 345);
    text("Level up by defeating enough enemies to reveal the base", 50, 370);
    text("Win by defeating all 7 enemy bases", 50, 395);
    rect(50,425,30,30);
    text("You", 90, 450);
    text("Towers:",10,500);
    text("Red Dwarf (cost: 10, DPS: 0.25)",80,550);
    text("Main Sequence (cost: 18, DPS: 0.5)",80,620);
    text("Blue Giant (cost: 30, DPS: 1)",80,690);
    fill(215+40*sin(t/15),150+40*sin(t/15),50+40*sin(t/15));
    ellipse(40,538,40,40);
    fill(215+40*sin(t/10),215+40*sin(t/10),150+40*sin(t/10));
    ellipse(40,608,50,50);
    fill(180+40*sin(t/5),180+40*sin(t/5),215+40*sin(t/5));
    ellipse(40,678,60,60);
  }

  boolean win(float x, float y) {
    if (x >= finishLX && x <= finishRX && y <= 30) {
      return true;
    }
    return false;
  }
}
