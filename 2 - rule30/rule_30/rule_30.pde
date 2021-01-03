int GRID_SIZE = 200;
int grid[][] = new int[GRID_SIZE][GRID_SIZE];
void setup(){
  size(800,800);
  background(255);
  
  noLoop();
  grid[0][0] = 1;
  for(int i=1; i < GRID_SIZE; i++){
    grid[i][0] = 0;
  }
  for(int i=1; i < GRID_SIZE; i++){
    for(int j = 0; j < GRID_SIZE; j++){
       if (j - 1 < 0){
         grid[j][i] = grid[GRID_SIZE - 1][i-1] ^ (grid[j][i-1] | grid[j+1][i-1]);
       } 
       else if (j + 1 > GRID_SIZE - 1){
         grid[j][i] = grid[j-1][i-1] ^ (grid[j][i-1] | grid[0][i-1]);
       }
       else{
         grid[j][i] = grid[j-1][i-1] ^ (grid[j][i-1] | grid[j+1][i-1]);
       }
    }
  }
}

void keyPressed(){
  if(key == ' '){
    int rand = (int) random(999999);
    save("rule30_" + rand +".jpg");
  }
}

void draw(){
  
  noStroke();
  for (int s = 0; s < 8; s++){ 
    pushMatrix();
    translate(width/2, height/2);
    float cr = (PI/4) * s;
    if (s  == 1) scale (-1, 1); //<>//
    else if (s == 2) rotate(PI/2);
    else if (s == 3) {
      scale (-1, 1);
      rotate(PI/2);
    }
    else if (s == 4) scale (-1, -1);
    else if (s == 5) scale (1, -1);
    else if (s == 6) rotate(-PI/2);
    else if (s == 7) {
      scale (-1, 1);
      rotate(-PI/2);
    }
    
    int r = 0;
    int g = 0;
    int b = 0;

    for(int i=0; i < GRID_SIZE/2; i++){
      for(int j=0; j < GRID_SIZE/2; j++){
          if (grid[i][j] == 1){
            r = abs(255 - j);
            g = abs(255 - i);
            b = abs(255 + ((i+j)/2));
            fill(r,g,b);
            rect(i*4,j*4,4,4);
          }
          else if(j >= i){
            r = 0 + j;
            g = 0 + i;
            b = 200 - ((i+j)/2);
            fill(r,g,b);
            rect(i*4,j*4,4,4);
          }
      }
    }    
    popMatrix();
  }
  

}
