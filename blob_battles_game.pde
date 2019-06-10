import processing.sound.*;
mainEnemy menemy;
Protagonist you;
Shoot s;
Enemy [] enemyBase;
Enemy [] bullets;
EnemyInfo info;
Tower buttons;
SoundFile space;
Tower tower1, tower2, tower3, tower4, tower5, tower6, tower7, tower8, tower9, tower10;
Button mute, howTo, playButton, backToMain, tournament;
PFont f;
PFont d;
float x0,y0;
int totalHealth = 100;
int numEnemies = 7;
int score = 0, numTypes;
int towerCount1 = 0, towerCount2 = 0, towerCount3 =0;
float t=0, b=0;
float bulletSpeed = 1;
float pxSpeed = 0.5;
float pySpeed = 0.5;
boolean win = false;
boolean lose = false;
float finishLX, finishRX;
boolean shoot = false;
boolean sound = true;
Game g;
Button main, restart, restart2;
boolean pause = true;
boolean mainMenu = true;
boolean howToPlay = false;
boolean enemyType = false;
Table table;
boolean angryBlob = false;
boolean tmt = false;
float m;
int e=0;
boolean isUp = false;
boolean isDown = false;
boolean isLeft = false;
boolean isRight = false;
boolean isShoot = false;

void setup() {
  size(750,750);
  frameRate(20);
  space = new SoundFile(this,"Space.mp3");
  /*Music: Space Warp by 4barrelcarb (c) copyright 2015 Licensed under a Creative Commons Attribution Noncommercial  (3.0) license. http://dig.ccmixter.org/files/4barrelcarb/51768*/
  space.play();
  m=0.5;
  table = loadTable("Enemy.csv", "header");
  you = new Protagonist();
  s = new Shoot();
  g = new Game();
  main = new Button(265,380,250,50,"Main Menu", color(#A7A2B4),color(255),true);
  restart = new Button(265,450,250,50,"Restart",color(#A7A2B4),color(255),true);
  restart2 = new Button(10,300,150,50,"Restart",color(#A7A2B4),color(255),true);
  info = new EnemyInfo(50,340,table);
  playButton = new Button(250,300,250,50,"Quick Play",color(#A7A2B4),color(255),true);
  tournament = new Button(250,375,250,50,"Tournament",color(#A7A2B4),color(255),true);
  howTo = new Button(250,450,250,50,"How To Play",color(#A7A2B4),color(255),true);
  mute = new Button(250,525,250,50,"Mute",color(#A7A2B4),color(255),true);
  backToMain = new Button(25,25,100,50,"Main",color(255),color(0),true);
  menemy = new mainEnemy();
  finishLX = random(width-100);
  finishRX = finishLX+100;
  f = createFont("Arial",16,true);
  /*Font: Dominian by Chequered Ink (c) copyright 2017 Licensed under Chequered Ink Noncommerial license. http://www.fontspace.com/chequered-ink/dominian*/
  d = createFont("Dominian.otf",75);
  textSize(36);

  
  buttons = new Tower(0,0);
  tower1 = new Tower(200,180);
  tower2 = new Tower(300,180);
  tower3 = new Tower(400,180);
  tower4 = new Tower(500,180);
  tower5 = new Tower(600,180);
}

void draw() {
  background(0);
  if (sound==false){
    space.amp(0);
  }
  else{
    space.amp(5);
  }

  if (pause == false) {
    b+=1;
    g.display();
    if (g.win(x0,y0)) {
      if (tmt == false && score >= 100) {
        win = true;
        pause = true;
      }
      else if (tmt == true && score >= 100*(e+1)) {
        if (e == 6) {
          win = true;
          pause = true;
        }
        else {
          g.reset();
          info.allEnemies(e+=1);
        }
      }
    } else if (totalHealth <= 0) {
      lose = true;
      pause = true;
      if (tmt == false) {
        e = 0;
      }
    }
   }
    if (pause == true) {
      if (win == true || lose == true) {
        if (win) {
          mainMenu = false;
          howToPlay = false;
          g.winDisplay();
        } else {
          mainMenu = false;
          howToPlay = false;
          g.loseDisplay();
        }
      } else if (mainMenu == true) {
        backToMain.display();
        tmt = false;
        background(0);
        for (int i=0; i<100; i++){
          fill(200);
          int r = int(random(7));
          ellipse(random(750),random(750),r,r);
        }
        menemy.display();
        playButton.display(); 
        tournament.display();
        mute.display();
        howTo.display();
        t+=1;
        textSize(48);
        textAlign(CENTER);
        textFont(d);
        text("Blob",width/2,150);
        text("Battles",width/2,250);
        textFont(f);
        textAlign(LEFT);
        textSize(40);
      }
      if (howToPlay == true) {
        mainMenu = false;
        enemyType = false;
        g.howToDisplay();
        backToMain.display();
      }
        if (enemyType == true) {
        howToPlay = false;
        mainMenu = false;
        info.button();
        backToMain.display();
      }
    }
}

void keyPressed() {
 if (keyCode == UP) {
   isUp = true;
  } if (keyCode == DOWN) {
    isDown = true;
  } if (keyCode == LEFT) {
    isLeft = true;
  } if (keyCode == RIGHT) {
    isRight = true;
  } if (key == ' ') {
    isShoot = true;
    shoot = true;
  } 
}

void keyReleased() {
 if (keyCode == UP) {
   isUp = false;
  } if (keyCode == DOWN) {
    isDown = false;
  } if (keyCode == LEFT) {
    isLeft = false;
  } if (keyCode == RIGHT) {
    isRight = false;
  } if (key == ' ') {
    isShoot = false;
  }
}

void mouseClicked() {
  saveFrame("demo-######.png");
  if (restart2.intersect()) {
    pause = true;
    mainMenu = true;
  }
  if (pause == false) {
    buttons.buttons();
    if (buttons.buttonPressed()==1){
      if (score>=10){
        towerCount1+=1;
        score -= 10;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==2){
      if (score>=18){
        towerCount2+=1;
        score -= 18;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==3){
      if (score>=30){
        towerCount3+=1;
        score -= 30;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==4){
      if (score>=15){
        totalHealth += 10;
        score -= 15;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==5){
      if (score>=15){
        m*=1.1;
        score -= 15;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==6){
      if (score>=15){
        score -= 15;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
    else if (buttons.buttonPressed()==7){
      if (score>=15){
        bulletSpeed *=1.25;
        score -= 15;
      }
      else{
        text("Not enough points!", 200, 400);
      }
    }
  }
  if (mute.intersect()){
    if (sound == true){
      sound = false;
    }
    else{
      sound = true;
    }
  }
  if (backToMain.intersect() && pause == true) {
    mainMenu = true;
    howToPlay = false;
    enemyType = false;
    pause = true;
    tmt = false;
  }
  if (howTo.intersect() && pause == true && mainMenu == true && enemyType == false && howToPlay == false) {
    howToPlay = true;
    mainMenu = false;
    enemyType = false;
    tmt = false;
  }
  if (playButton.intersect() && pause == true && enemyType == false && mainMenu == true && howToPlay == false) {
    g.reset();
    enemyType = true;
    mainMenu = false;
    howToPlay = false;
    tmt = false;
  }
  if (tournament.intersect() && pause == true && enemyType == false && mainMenu == true && howToPlay == false) {
    g.reset();
    info.allEnemies(e);
    tmt = true;
    mainMenu = false;
    enemyType = false;
    howToPlay = false;
    pause = false;
  }
  
  if (win || lose) {
    if (main.intersect()) {
      g.reset();
      pause = true;
      mainMenu = true;
    }
    if (restart.intersect()) {
      pause = false;
      g.reset();
    }
  }
}
