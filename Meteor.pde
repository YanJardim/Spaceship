public class Meteor extends GameObject {

    public Meteor (PVector position, PVector scale, float speed) {
        super("meteor1-1", position, new PVector(0, 0), new PVector(40, 40), speed);
        direction = new PVector(random(0, 1), random(0, 1)).normalize();
    }
    @Override
    public void draw(){
        super.draw();
        drawImage();
    }
    @Override
    public void update(){
        super.update();
        position.add(direction.copy().mult(speed * time.deltatime()));
    }

}
