
enum direction { none, up, down, left, right };

class Cell{
  int x, y, n_x, n_y;
  float n, r;
  color c;
  
  Cell(int _x, int _y, int _n_x, int _n_y){
    x = _x;
    y = _y;
    n_x = _n_x;
    n_y = _n_y;
    update_noise();
  }
  
  void move(direction dir){
    switch(dir){
      case up:
        n_y--;
        break;
      case down:
        n_y++;
        break;
      case right:
        n_x++;
        break;
      case left:
        n_x--;
        break;
      case none:
        break;
    }
    update_noise();
  }
  
  void update_noise(){
    n = noise(n_x, n_y);
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
    translate(x,y);
    rotate_triangle();
    triangle(0, 0, TRIANGLE_SIZE, 0, 0, TRIANGLE_SIZE);
    popMatrix();
  }

}
