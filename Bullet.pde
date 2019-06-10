class Bullet {
  float shootX,shootY,bSpeed;
  boolean intersection = false;
  Bullet(float x, float y) {
    shootX = x+10;
    shootY = y;
  }
  
  void display() {
    stroke(255);
    strokeWeight(2);
    line(shootX,shootY,shootX,shootY-10);
    stroke(0);
    strokeWeight(1);
    noStroke();
  }
  
  void move() {
    shootY -= bulletSpeed*15;
  }
  
  boolean removeBullet() {
    if (shootY < 0 || intersection) {
      return true;
    }
    return false;
  }

  void intersect(Enemy [] enemyHolder) {
    for (Enemy i: enemyHolder) {
      if(dist(i.xPos, i.yPos, shootX, shootY) < i.radius && shoot == true) {
        intersection = true;
        i.health -= 1;
      }
    }
    }
  }
