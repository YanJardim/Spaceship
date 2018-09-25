class Player extends GameObject {
  public Player(PVector position, PVector rotation, float speed) {
    super(position, rotation, new PVector(40, 40), speed);
    c = color(255, 255, 255);
  }
  @Override
    public void draw() {
    super.draw();
    noStroke();
    fill(c);
    
    pushMatrix();
      translate(position.x - scale.x / 2, position.y - scale.y / 2);
      rotate(getAngle());
      //triangle(0, 0, scale.x, 0, scale.x / 2, scale.y);
      rect(0, 0, scale.x, scale.y);
    popMatrix();
  }
  public float getAngle() {
    
    PVector pos = position.copy();
    PVector dir  = direction.copy();
    
    return atan2(dir.x, dir.y);
  }
  @Override
    public void update() {
    super.update();
    move();
    limitVel();
    scroll();
  }
  public void limitVel(){
      constrain(direction.x, 0, 0.05);
      constrain(direction.y, 0, 0.05);
  }
  public void move() {
    
    if (keyPressed) {
      if (key == 's') {
        propulsion.set(0, 1);
      }
      if (key == 'w') {
        propulsion.set(0, -1);
      }
      if (key == 'a') {
        propulsion.set(-1, 0);
      }
      if (key == 'd') {
        propulsion.set(1, 0);
      }
    }
    propulsion.mult(speed * time.deltatime());

  }
  
  public void scroll(){
     position.x = position.x <= -scale.x/2 ? width : position.x >= width ? 0 : position.x; 
     position.y = position.y <= -scale.y/2 ? height : position.y >= height ? 0 : position.y; 
  }
}
