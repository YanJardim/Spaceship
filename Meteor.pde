public class Meteor extends GameObject {
    private int level;
    private int maxLevel;
    private int meteorIndex;
    private boolean dead;

    public Meteor (int meteorIndex, PVector position, PVector scale, float speed, int size) {
        super(("meteor" + meteorIndex + "-1"), position, new PVector(0, 0), new PVector(size, size), speed);
        setRandomDirection();
        this.meteorIndex = meteorIndex;
        maxLevel = 4;
        level = 1;
        dead = false;
    }
    @Override
        public void draw() {
        super.draw();
        drawImage();
    }
    @Override
        public void update() {
        super.update();
        position.add(direction.copy().mult(speed * time.deltatime()));
        rotAngle += 5 * time.deltatime();
    }

    public void levelUp() {
        if (level >= maxLevel) {
            dead = true;
            return;
        };
        level++;
        image = loadImage("images/meteor" + meteorIndex + "-" + level + ".png");
        scale.div(1.3);
        speed *= 1.2;
        setRandomDirection();
        updateBoudingBox();
    }

    public void setRandomDirection() {
        direction = new PVector(random(-1, 1), random(-1, 1)).normalize();
    }

    public boolean isDead() {
        return dead;
    }
    public int getLevel(){
         return level;   
    }
}
