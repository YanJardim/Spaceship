public Player player;
public Time time;

void setup(){
    size(800, 800);
    player = new Player(new PVector(width / 2, height / 2), new PVector(1, 0), 10);
    time = new Time();
}

void draw(){
    background(0);

    time.setDeltaTime();

    player.draw();

    time.setLastTime();
}
