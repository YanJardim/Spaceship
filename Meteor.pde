public class Meteor extends GameObject {

    public Meteor (int meteorIndex, PVector position, PVector scale, float speed, int size) {
        super(("meteor" + meteorIndex + "-1"), position, new PVector(0, 0), new PVector(size, size), speed);
        direction = new PVector(random(-1, 1), random(-1, 1)).normalize();
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
        rotAngle += 5 * time.deltatime();
    }

}
