public class MeteorSpawner {
    private float spawnRatio, timer;
    private ArrayList<Meteor> meteors;
    private int maxMeteors;

    public MeteorSpawner (float spawnRatio, int maxMeteors) {
        this.spawnRatio = spawnRatio;
        this.maxMeteors = maxMeteors;
        meteors = new ArrayList<Meteor>();
        spawnMeteor();
    }

    public void draw() {
        update();
        drawEnemies();
    }
    public void update() {
        countTime();
        if (timer >= spawnRatio && meteors.size() < maxMeteors) {
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

        meteors.add(new Meteor(r, pos, new PVector(1, 0), (int)random(getParameter(20), getParameter(40)), (int)random(40, 80)));
    }

    public ArrayList<Meteor> getMeteors() {
        return meteors;
    }    
    public float getParameter(float number){
        float result = number * ((pow(gameManager.getScore(), 2) / 1000) / 20000  + 1);
        result = constrain(result, 0, 160);
        println(result);
        return result;
    }
    public void drawEnemies() {
        for (Meteor m : meteors) {
            m.draw();
        }
    }

    public void killMeteor(Meteor m) {
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
