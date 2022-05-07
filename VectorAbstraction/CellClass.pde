
enum direction { none, up, down, left, right };

class Cell{
  PVector pos, n_pos;
  float n, r;
  color c;
  
  Cell(int x, int y, int n_x, int n_y){
    pos = new PVector(x, y);
    n_pos = new PVector(n_x, n_y);
    update_noise();
  }
  
  void move(direction dir){
    switch(dir){
      case up:
        n_pos.y++;
        break;
      case down:
        n_pos.y--;
        break;
      case right:
        n_pos.x--;
        break;
      case left:
        n_pos.x++;
        break;
      case none:
        break;
    }
    update_noise();
  }
  
  void update_noise(){
    n = noise(n_pos.x, n_pos.y);
    r = floor(n * 3) * PI/2;
    int scale = int(map(floor(n * 2), 0, 2, 0, 255)); 
    c = color(scale, scale, scale);
  }  
  
  void rotate_triangle(){
    rotate(r);
    if(r == PI/2){
      translate(0, -TRIANGLE_SIZE);
    }else if (r == PI){
      translate(-TRIANGLE_SIZE, -TRIANGLE_SIZE);
    }else if (r == (3*PI)/2){
      translate(-TRIANGLE_SIZE, 0);
    }
  }
  
  void draw(){
    pushMatrix();
    fill(c);
    translate(pos.x, pos.y);
    rotate_triangle();
    triangle(0, 0, TRIANGLE_SIZE, 0, 0, TRIANGLE_SIZE);
    popMatrix();
  }

}
