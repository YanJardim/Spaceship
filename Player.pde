class Player extends GameObject{
  public Player(PVector position, PVector rotation){
    super(position, rotation, new PVector(20, 20));
    color = color(255, 255, 255);
  }
  @Override
  public void draw(){
    fill(color);
    ellipse(position.x, position.y, scale.x, scale.y);
  }
  @Override
  public void update(){
     
  }
}
