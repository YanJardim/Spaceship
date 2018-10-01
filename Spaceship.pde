Player player;
Time time;
MeteorSpawner meteorSpawner;
PImage bgImage;

void setup(){
    size(800, 800);
    player = new Player(new PVector(width / 2, height / 2), new PVector(1, 0), 100);
    meteorSpawner = new MeteorSpawner(2);
    time = new Time();
    bgImage = loadImage("images/bg.png");
}

void draw(){
    background(0);

    time.setDeltaTime();
    image(bgImage, 0, 0, width, height);
    meteorSpawner.update();
    meteorSpawner.draw();
    player.draw();

    time.setLastTime();
}

void keyPressed() {
  player.setMove(keyCode, true);
}
 
void keyReleased() {
  player.setMove(keyCode, false);
}
