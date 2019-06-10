class mainEnemy{
  int t1=0;
  float y1=0;
  float omega=0;
  mainEnemy(){
  }
  
  void display(){
    y1 = lerp(650,550,cos(omega));
    noStroke();
    //enemy1
    fill(150,0,0);
    ellipse(50,y1,45,45);
   //enemy2
    fill(100,100,100);
    ellipse(140,y1,45,45);
    fill(150,0,0);
    ellipse(150,y1,15,10);
    ellipse(130,y1,15,10);
    
    //enemy3
    fill(150,50,0);
    ellipse(250,y1,45,45);
    fill(255);
    rect(230,y1-10,40,10);
  
    //enemy4
    fill(125,0,75);
    ellipse(350,y1,45,45);
    stroke(0);
    strokeWeight(5);
    line(335,y1-8,345,y1-4);
    line(355,y1-4,365,y1-8);
    fill(255,200,0);
    noStroke();
    ellipse(340,y1,6,4);
    ellipse(360,y1,6,4);

    //enemy5
    fill(200,0,0);
    ellipse(450,y1,60,60);
   
    //enemy6
    fill(255,100,150);
    ellipse(550,y1,45,45);
    stroke(100,150,255);
    strokeWeight(3);
    ellipse(538,y1,15,10);
    ellipse(562,y1,15,10);
    line(548,y1,554,y1);
    t1+=1;
    
    
    //enemy7
    fill(255,0,0);
    noStroke();
    ellipse(680,y1,80,80);
    strokeWeight(5);
    stroke(0);
    line(650,y1-20,670,y1-10);
    line(690,y1-10,710,y1-20);
    line(710,y1-20,690,y1-10);
    fill(255,200,0);
    noStroke();
    ellipse(660,y1-5,15,10);
    ellipse(700,y1-5,15,10);
    fill(100,0,0);
    bezier(650,y1+10,675,y1+40,690,y1+40,710,y1+10);   
    
    omega += 0.15;
  }
}
