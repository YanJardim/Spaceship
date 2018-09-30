public class MeteorSpawner {
    private float spawnRatio, timer;
    private ArrayList<Meteor> meteors;
    public MeteorSpawner (float spawnRatio) {
        this.spawnRatio = spawnRatio;
        meteors = new ArrayList<Meteor>();
        spawnMeteor();
    }

    public void draw(){
        drawEnemies();
    }
    public void update(){
        countTime();
        if(timer >= spawnRatio){
            spawnMeteor();
            timer = 0;
        }
    }

    public void countTime(){
        timer += time.deltatime();
    }

    public void spawnMeteor(){
        meteors.add(new Meteor(new PVector(0, 0), new PVector(1, 0), (int)random(60, 100), (int)random(40, 80)));
    }

    public void drawEnemies(){
        for (Meteor m : meteors) {
            m.draw();
        }
    }

}
