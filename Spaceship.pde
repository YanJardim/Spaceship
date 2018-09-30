Player player;
Time time;
Meteor meteor;

void setup(){
    size(800, 800);
    player = new Player(new PVector(width / 2, height / 2), new PVector(1, 0), 100);
    meteor = new Meteor(new PVector(0, 0), new PVector(1, 0), 100);
    time = new Time();
}

void draw(){
    background(0);

    time.setDeltaTime();

    player.draw();
    meteor.draw();

    time.setLastTime();
}
