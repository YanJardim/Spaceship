public class MeteorSpawner {
    private float spawnRatio, timer;
    private ArrayList<Meteor> meteors;

    public MeteorSpawner (float spawnRatio) {
        this.spawnRatio = spawnRatio;
        meteors = new ArrayList<Meteor>();
        spawnMeteor();
    }

    public void draw() {
        drawEnemies();
    }
    public void update() {
        countTime();
        if (timer >= spawnRatio) {
            spawnMeteor();
            timer = 0;
        }
    }

    public void countTime() {
        timer += time.deltatime();
    }

    public void spawnMeteor() {
        PVector pos = getRandomPosition();
        int r = (int)random(1, 4);

        meteors.add(new Meteor(r, pos, new PVector(1, 0), (int)random(60, 100), (int)random(40, 80)));
    }
    
    public ArrayList<Meteor> getMeteors(){
        return meteors;
    }    

    public void drawEnemies() {
        for (Meteor m : meteors) {
            m.draw();
        }
    }
    
    public void killMeteor(Meteor m){
        meteors.remove(m);
    }
    
    public PVector getRandomPosition() {
        int r = (int)floor(random(0, 4));
        switch (r) {
        case 0: 
            return new PVector(random(0, width), 0); 
        case 1: 
            return new PVector(random(0, width), height);
        case 2: 
            return new PVector(0, random(0, height)); 
        case 3: 
            return new PVector(width, random(0, height));
        }
        return new PVector(0, 0);
    }
}
