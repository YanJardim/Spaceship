public class Bullet extends GameObject {
    private float lifeTime;
    private float timer;
    public Bullet (PVector position, PVector rotation, float speed, float lifeTime) {
        super("bullet1", position, rotation, new PVector(15, 6), speed);
        this.lifeTime = lifeTime;
        rotAngle = getAngle() * PI / 2;
    }

    @Override
    public void update(){
        super.update();
        timer += time.deltatime();
        position.add(rotation.copy().normalize().mult(speed * time.deltatime()));
        
    }
    @Override
    public void draw(){
        super.draw();
        
		drawWithRotation();
    }

    public boolean isDead(){
        return timer >= lifeTime;
    }

}
