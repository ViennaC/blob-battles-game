class Protagonist{
  Protagonist() {
    x0 = random(width-30);
    y0 = height-30;
  }

  void display() {
    fill(255);
    rect(x0,y0,30,30);
  }

  void update() {
    if (isShoot && b >= 8) {
      b = 0;
      s.addBullet(x0,y0);
    }
    if (isUp){
      if (pySpeed <= 30) {
       pySpeed -= 10;
      }
      if (isLeft) {
        if (pxSpeed >= -30) {
          pxSpeed -= 10;
        }
      }
      else if (isRight) {
        if (pxSpeed <= 30) {
          pxSpeed += 10;
        }
      }
    }
    else if (isDown) {
      if (pySpeed >= -30) {
        pySpeed += 10;
      }
      if (isLeft) {
        if (pxSpeed >= -30) {
          pxSpeed -= 10;
        }
      }
      else if (isRight) {
        if (pxSpeed <= 30) {
          pxSpeed += 10;
        }
      }
    }
    else if (isLeft) {
      if (pxSpeed >= -30) {
        pxSpeed -= 10;
      }
    }
    else if (isRight) {
      if (pxSpeed <= 30) {
        pxSpeed += 10;
      }
    }
    if(pySpeed < 1 && pySpeed > -1) {
      pySpeed = 0;
    } else {
      pySpeed *= m;
    }
    
    if(pxSpeed < 1 && pxSpeed > -1) {
      pxSpeed = 0;
    } else {
      pxSpeed *= m;
    }
    
    if(y0 + pySpeed + 30 /*you size*/ >= height || y0 + pySpeed <= 0) {
      pySpeed = 0;
    } else {
      y0 += pySpeed;
    }
    
    if(x0 + pxSpeed + 30 /*you size*/ >= width || x0 + pxSpeed <= 0) {
      pxSpeed = 0;
    } else {
      x0 += pxSpeed;
    }
  }
}
