class Player extends GameObject{
  public Player(PVector position, PVector rotation){
    super(position, rotation, new PVector(40, 40), 1);
    c = color(255, 255, 255);
    direction = new PVector(1, 0);
  }
  @Override
  public void draw(){
    super.draw();
    noStroke();
    fill(c);
    rect(position.x, position.y, scale.x, scale.y);
    
  }
  @Override
  public void update(){
     super.update();
     move();
  }
  
  public void move(){
    if(keyPressed){
      if(key == 's'){
           velocity.set(0, speed * time.deltatime());
      }
      if(key == 'w'){
           velocity.set(0, -speed * time.deltatime());
      }
      if(key == 'a'){
           velocity.set(-speed * time.deltatime(), 0);
      }
      if(key == 'd'){
           velocity.set(speed * time.deltatime(), 0);
      }
    }
    else{
       velocity.set(0,  0); 
    }
  }
}
