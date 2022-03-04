/*
  Right angle triangles
  rows & cols
  use noise for randomness
  with rotate translate the triangle

*/


int TRIANGLE_SIZE = 25;
int OFFSET = 50;

int rows, cols;

void setup(){
  size(800, 500);
 
  noStroke(); 
  
  cols = (width - OFFSET * 2) / TRIANGLE_SIZE;
  rows = (height - OFFSET * 2) / TRIANGLE_SIZE;
}

void draw(){
  background(255);
  fill(75);
  
  for(int x = 0; x < cols; x++){
    for(int y = 0 ; y < rows; y++){
      place_right_triangle((x * TRIANGLE_SIZE) + OFFSET, (y * TRIANGLE_SIZE) + OFFSET);
    }
  }
  
}

void mouseClicked(){
  noiseSeed(int(random(0, 255)));
}

void place_right_triangle(int x, int y){
  pushMatrix();
  translate(x,y);
  int n = floor(noise(x, y) * 4);
  if(n == 0){
    rotate(PI/2);
    translate(0, -TRIANGLE_SIZE);
  }else if (n == 1){
    rotate(PI);
    translate(-TRIANGLE_SIZE, -TRIANGLE_SIZE);
  }else if (n == 2){
    rotate(3*PI/2);
    translate(-TRIANGLE_SIZE, 0);
  }
  triangle(0, 0, TRIANGLE_SIZE, 0, 0, TRIANGLE_SIZE);
  popMatrix();
}
