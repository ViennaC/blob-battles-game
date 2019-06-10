class Shoot {
  ArrayList<Bullet> bHolder = new ArrayList<Bullet>();
  Enemy [] enemyHolder;
  Shoot() {
  }
  
  void addBullet(float x, float y){
    bHolder.add(new Bullet(x,y));
  }
  
  void display(Enemy [] enemyHolder) {
    for (int i = bHolder.size()-1;i>=0;i--) {
      Bullet b = bHolder.get(i);
      b.move();
      b.display();
      b.intersect(enemyHolder);
      if (b.removeBullet()) {
        bHolder.remove(i);
      }
    }
  }
}
