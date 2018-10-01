Player player;
Time time;
MeteorSpawner meteorSpawner;
PImage bgImage;
CollisionManager collisionManager;

void setup() {
    size(800, 800);
    player = new Player(new PVector(width / 2, height / 2), new PVector(1, 0), 100);
    meteorSpawner = new MeteorSpawner(2);
    time = new Time();
    bgImage = loadImage("images/bg.png");
    collisionManager = new CollisionManager();
}

void draw() {
    background(0);

    time.setDeltaTime();

    image(bgImage, width / 2, height / 2, width, height);
    
    collisionManager.checkCollision();
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
