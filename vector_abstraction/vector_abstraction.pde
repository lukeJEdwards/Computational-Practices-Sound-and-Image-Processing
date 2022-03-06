/*
  Right angle triangles
  rows & cols
  use noise for randomness
  with rotate translate the triangle
  
  make svg from button click
  have sliders to change colours
  set noise seed
*/

int TRIANGLE_SIZE = 25;
int OFFSET = 50;

int rows, cols;

Cell[][] cells;

void setup(){
  size(800, 500);
  
  noStroke();
  frameRate(12);
  
  cols = (width - OFFSET * 2) / TRIANGLE_SIZE;
  rows = (height - OFFSET * 2) / TRIANGLE_SIZE;
  
  cells = new Cell[cols][rows];
  
  for(int x = 0; x < cols; x++){
    for(int y = 0; y < rows; y++){
      cells[x][y] = new Cell((x * TRIANGLE_SIZE) + OFFSET, (y * TRIANGLE_SIZE) + OFFSET, x, y);
    }
  }
  
}

void draw(){
  background(255);
  fill(75);
  
  update_cell_n_pos();
  
  for(Cell[] col: cells){
    for (Cell cell: col){
      cell.draw();
    }
  }
 
}

void mouseClicked(){
  noiseSeed(int(random(0, Integer.MAX_VALUE)));
  for(Cell[] col: cells){
    for (Cell cell: col){
      cell.update_noise();
    }
  }
}

void update_cell_n_pos(){
  direction dir = direction.none;
  if(keyPressed){
    if(key == 'w'){
      dir = direction.up;
    }
    else if(key == 's'){
      dir = direction.down;
    }
    else if(key == 'd'){
      dir = direction.right;
    }
    else if(key == 'a'){
      dir = direction.left;
    }
  }
  
  if(dir != direction.none){
    for(Cell[] col: cells){
      for (Cell cell: col){
        cell.move(dir);
      }
    }
  }
  
}
