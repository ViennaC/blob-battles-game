class EnemyInfo {
  float t, t1, t2, t3, t4;
  float x, y, radius;
  boolean popup = false;
  String name, speedstr, description;
  int health;
  Table table;
  int numTypes;
  float speed;
  boolean overAttached = false;
  Button [] typesEnemy;
  EnemyInfo(float x, float y, Table table){
    this.x = x;
    this.y = y;
    this.table = table;
  }
  
  void button(){
    noStroke();
    t1+=1;
    if(t1>180){
      t1=0;
    }
    t2+=1;
    if(t2>70){
      t2=0;
    }
    t3+=1;
    if(t3>100){
      t3=0;
    }
    fill(0);
    rect(0,0,750,750);
    fill(255);
    textAlign(CENTER);
    textSize(60);
    text("Enemies",375,50);
    textSize(28);
    text("Select an enemy type",375,85);
    textAlign(LEFT);
    textSize(12);
    for (int i=0; i<7; i++){
      TableRow row = this.table.getRow(i);
      String name = row.getString("Name");
      int health = row.getInt("Health");
      String speedstr = row.getString("Speed");
      String description = row.getString("Description");
      text(name + "\nHealth: " + health + "\nSpeed: " + speedstr + "\n" + description,420,110+(i*95));
    }
    //enemy1
    fill(150,0,0);
    ellipse(x-50+2*t1,150,45,45);
    
    //enemy2
    fill(100,100,100);
    ellipse(x-50+2*t1,240,45,45);
    fill(150,0,0);
    ellipse(x-60+2*t1,235,15,10);
    ellipse(x-40+2*t1,235,15,10);
    
    //enemy3
    fill(150,50,0);
    ellipse(x-50+5*t2,330,45,45);
    fill(255);
    rect(x-70+5*t2,315,40,10);
    
    //enemy4
    fill(125,0,75);
    ellipse(x-50+2*t1,420,45,45);
    ellipse(x-30+2*t1+15*t3,420,20,20);
    stroke(0);
    strokeWeight(5);
    line(x-63+2*t1,411,x-54+2*t1,415);
    line(x-37+2*t1,411,x-46+2*t1,415);
    fill(255,200,0);
    noStroke();
    ellipse(x-60+2*t1,420,6,4);
    ellipse(x-40+2*t1,420,6,4);

    //enemy5
    fill(200,0,0);
    ellipse(x-50+5*t2,510,60,60);
     
    //enemy6
    fill(255,100,150);
    ellipse(160-210*cos(t1/32),600+40*sin(t1/32),45,45);
    stroke(100,150,255);
    strokeWeight(3);
    ellipse(148-210*cos(t1/32),595+40*sin(t1/32),15,10);
    ellipse(172-210*cos(t1/32),595+40*sin(t1/32),15,10);
    line(156-210*cos(t1/32),595+40*sin(t1/32),164-210*cos(t1/32),595+40*sin(t1/32));
    noStroke();
    fill(255);
    rect(145-210*cos(t1/32+0.8),585+40*sin(t1/32+0.8),30,30);

    //enemy7
    fill(255,0,0);
    ellipse(x-50+2*t1,710,80,80);
    strokeWeight(5);
    stroke(0);
    line(x-80+2*t1,690,x-60+2*t1,700);
    line(x-20+2*t1,690,x-40+2*t1,700);
    fill(255,200,0);
    noStroke();
    ellipse(x-70+2*t1,710,15,10);
    ellipse(x-30+2*t1,710,15,10);
    fill(100,0,0);
    bezier(x-80+2*t1,720,x-55+2*t1,750,x-45+2*t1,750,x-20+2*t1,720);        
    t+=1;
    if (mousePressed && popup && t>5){
      popup = false;
      t=0;
    }
    selectEnemy();
  } 
  
  void allEnemies(int e) {
    numTypes = table.getRowCount();
    angryBlob = false;
    overAttached = false;
    pause = false;
    enemyType = false;
    name = this.table.getRow(e).getString("Name");
    radius = this.table.getRow(e).getInt("Radius");
    health = this.table.getRow(e).getInt("Health");
    speedstr = this.table.getRow(e).getString("Speed");
    if (speedstr.equals("slow")) {
      speed = 1;
    } else {
      speed = 1.5;
    }
    if (name.equals("Overly Attached Blob")) {
      overAttached = true;
    } if (name.equals("Angry Blob")) {
      angryBlob = true;
    }
    enemyBase = new Enemy[numEnemies];   
    bullets = new Enemy[numEnemies];
    for(int j = 0; j < numEnemies; j++) {
      if(random(1) < 0.5) {
        if(random(1) < 0.5) {
          enemyBase[j] = new Enemy(random(width), 0, radius, health,e+1,speed,overAttached,angryBlob);
          if (angryBlob) {
            bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
          }
        } else {
          enemyBase[j] = new Enemy(random(width), height, radius, health,e+1,speed,overAttached,angryBlob);
          if (angryBlob) {
            bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
          }
        }} else {
          if(random(1) < 0.5) {
            enemyBase[j] = new Enemy(0, random(height), radius, health,e+1,speed,overAttached,angryBlob);
            if (angryBlob) {
              bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
            }
          } else {
            enemyBase[j] = new Enemy(width, random(height), radius, health,e+1,speed,overAttached,angryBlob);
            if (angryBlob) {
              bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
            }
          }
        }
    }
    }
  
  void selectEnemy() {
    numTypes = table.getRowCount();
    Button [] typesEnemy = new Button[numTypes];
    for (int i=0;i<numTypes;i++) {
      typesEnemy[i] = new Button(0,90+(i*95),width,95, " ",color(255),color(255),false);
      typesEnemy[i].display();
      typesEnemy[i].intersect();
      if (typesEnemy[i].intersect() && mousePressed) {
        angryBlob = false;
        overAttached = false;
        pause = false;
        enemyType = false;
        name = this.table.getRow(i).getString("Name");
        radius = this.table.getRow(i).getInt("Radius");
        health = this.table.getRow(i).getInt("Health");
        speedstr = this.table.getRow(i).getString("Speed");
        if (speedstr.equals("slow")) {
          speed = 1;
        } else {
          speed = 1.5;
        }
        if (name.equals("Overly Attached Blob")) {
          overAttached = true;
        } if (name.equals("Angry Blob")) {
          print("Here");
          angryBlob = true;
        }
        e = i+1;
        enemyBase = new Enemy[numEnemies];   
        bullets = new Enemy[numEnemies];
        for(int j = 0; j < numEnemies; j++) {
          if(random(1) < 0.5) {
            if(random(1) < 0.5) {
              enemyBase[j] = new Enemy(random(width), 0, radius, health,e,speed,overAttached,angryBlob);
              if (angryBlob) {
                bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
              }
            } else {
              enemyBase[j] = new Enemy(random(width), height, radius, health,e,speed,overAttached,angryBlob);
              if (angryBlob) {
                bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
              }
            }} else {
              if(random(1) < 0.5) {
                enemyBase[j] = new Enemy(0, random(height), radius, health,e,speed,overAttached,angryBlob);
                if (angryBlob) {
                  bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
                }
              } else {
                enemyBase[j] = new Enemy(width, random(height), radius, health,e,speed,overAttached,angryBlob);
                if (angryBlob) {
                  bullets[j] = new Enemy(enemyBase[j].xPos, enemyBase[j].yPos, radius, health,8,speed*2,false,true);
                }
              }
            }
        }
      }
    }
  }
}
