import java.awt.Rectangle;

abstract class GameObject {
    protected PVector position;
    protected PVector direction;
    protected PVector propulsion;
    protected PVector rotation;
    protected PVector scale;
    protected PImage image;
    protected Rectangle boudingBox;
    protected float speed;
    protected color c;
    protected float rotAngle;
    protected float rotSpeed = 5;

    public GameObject(PVector position, PVector rotation) {
        this.position = position;
        this.rotation = rotation;
        this.propulsion = new PVector(0, 0);
        this.direction = new PVector(0, 0);
    }
    public GameObject(PVector position, PVector rotation, PVector scale) {
        this(position, rotation);
        this.scale = scale;
        this.boudingBox = new Rectangle((int)(position.x - scale.x / 2), (int)(position.y - scale.y / 2), (int)scale.x, (int)scale.y);
    }
    public GameObject(PVector position, PVector rotation, PVector scale, float speed) {
        this(position, rotation, scale);
        this.speed = speed;
    }
    public GameObject(String imageName, PVector position, PVector rotation, PVector scale, float speed) {
        this(position, rotation, scale, speed);
        this.image = loadImage("images/" + imageName + ".png");
    }

    public void draw() {
        update();
        //drawBoudingBox();
    }
    public void update() {
        scroll();
        updateImage();
    }
    public float getAngle() {
        return atan2(-rotation.x, rotation.y);
    }
    public void drawImage() {
        if (image == null) return;
        imageMode(CENTER);
        drawImage(position.x, position.y);
    }
    public void drawImage(float x, float y) {
        imageMode(CENTER);
        image(image, x, y, scale.x, scale.y);
    }

    public void drawWithRotation() {
        pushMatrix();
        translate(position.x, position.y );
        rotate(getAngle());
        pushMatrix();
        rotate(PI / 2);
        imageMode(CENTER);
        drawImage(0, 0);
        popMatrix();
        popMatrix();
    }
    public void updateImage() {
        boudingBox.setLocation((int)(position.x - scale.x / 2), (int)(position.y - scale.y / 2));
    }
    public void updateBoudingBox(){
        boudingBox = new Rectangle((int)(position.x - scale.x / 2), (int)(position.y - scale.y / 2), (int)scale.x, (int)scale.y);   
    }
    public void drawBoudingBox() {
        stroke(200, 0, 50);
        rect((float)boudingBox.getX(), (float)boudingBox.getY(), (float)boudingBox.getWidth(), (float)boudingBox.getHeight());
    }

    public void scroll() {
        position.x = position.x <= -scale.x/2 ? width : position.x >= width ? 0 : position.x; 
        position.y = position.y <= -scale.y/2 ? height : position.y >= height ? 0 : position.y;
    }

    public void applyRotation() {
        rotation.x = cos(rotAngle);
        rotation.y = sin(rotAngle);
    }

    public boolean checkCollision(GameObject other) {
        return boudingBox.intersects(other.boudingBox);
    }

    //GETTERS AND SETTERS
    public PVector getPosition() {
        return position;
    }
    public void setPosition(PVector position) {
        this.position = position;
    }
    public PVector getRotation() {
        return rotation;
    }
    public void setRotation(PVector rotation) {
        this.rotation = rotation;
    }

    public PVector getPropulsion() {
        return propulsion;
    }
    public void setPropulsion(PVector propulsion) {
        this.propulsion = propulsion;
    }
    public PVector getDirection() {
        return direction;
    }
    public void setDiretion(PVector direction) {
        this.direction = direction;
    }

    public PVector getScale() {
        return scale;
    }
    public void setScale(PVector scale) {
        this.scale = scale;
    }

    public color getColor() {
        return c;
    }
    public void setScale(color c) {
        this.c = c;
    }
}
