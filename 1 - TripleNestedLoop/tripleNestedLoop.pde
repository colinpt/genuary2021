int num = 50;

void setup(){
  size(800,800);
  background(random(200,255),random(200,255),150);
  noLoop();
  noStroke();
}

void draw(){
  for(int i = 0; i < num; i++){
    float x1 = random(width);
    float y1 = random(height);
    float r1 = random(height/36, height/6);
    fill(random(125,255),random(100),random(50),random(100));
    ellipse(x1,y1,r1,r1);
    
    for(int j = 0; j < (num / 1.5); j++){
      float x2 = random(x1 - (r1/2), x1 + (r1/2));
      float y2 = random(y1 - (r1/2), y1 + (r1/2));
      float r2 = random(r1 / 4, r1 / 2);
      fill(random(125),random(100),random(90),random(100));
      ellipse(x2,y2,r2,r2);
      for(int k = 0; k < (num / 2); k++){
        float x3 = random(x2 - (r2 / 2), x2 + (r2 / 2));
        float y3 = random(y2 - (r2 / 2), y2 + (r2 / 2));
        float r3 = random(r2 / 4, r2 / 2);
        fill(random(125,255),random(255),random(50),random(100));
        ellipse(x3,y3,r3,r3);
      }
    }
  }
}
