public Player player;

void setup(){
  size(800, 800);
  player = new Player(new PVector(10, 10), new PVector(0, 0));
}

void draw(){
  player.draw();
}
