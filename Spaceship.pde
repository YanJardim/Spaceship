public Player player;
public Time time;

void setup(){
  size(800, 800);
  player = new Player(new PVector(30, 100), new PVector(0, 0));
  time = new Time();
}

void draw(){
  background(0);
  time.setDeltaTime();
  
  player.draw();
  
  time.setLastTime();
}
