import java.awt.Rectangle;

abstract class GameObject{
    protected PVector position;
    protected PVector direction;
    protected PVector propulsion;
    protected PVector rotation;
    protected PVector scale;
    protected PImage image;
    protected Rectangle boudingBox;
    protected float speed;
    protected color c;
  
    public GameObject(PVector position, PVector rotation){
        this.position = position;
        this.rotation = rotation;
        this.propulsion = new PVector(0, 0);
        this.direction = new PVector(0, 0);
    }
    public GameObject(PVector position, PVector rotation, PVector scale){
        this(position, rotation);
        this.scale = scale;
        this.boudingBox = new Rectangle((int)(position.x - scale.x / 2) , (int)(position.y - scale.y / 2), (int)scale.x, (int)scale.y);
    }
    public GameObject(PVector position, PVector rotation, PVector scale, float speed){
        this(position, rotation, scale);
        this.speed = speed;
    }
    public GameObject(String imageName, PVector position, PVector rotation, PVector scale, float speed){
        this(position, rotation, scale, speed);
        this.image = loadImage("images/" + imageName + ".png");
    }

    public void draw(){
        update();
        drawBoudingBox();
    }
    public void update(){
        updateImage();   
    }
    public void drawImage(){
        if(image == null) return;

        image(image, position.x, position.y, scale.x, scale.y);
    }
    public void updateImage(){
        boudingBox.setLocation((int)(position.x - scale.x), (int)(position.y - scale.y));
    }
    public void drawBoudingBox(){
        stroke(200, 0, 50);
        rect((float)boudingBox.getX(), (float)boudingBox.getY(), (float)boudingBox.getWidth(), (float)boudingBox.getHeight());
    }
    public void drawImage(float x, float y){
        image(image, x, y, scale.x, scale.y);
    }
    public PVector getPosition(){
        return position; 
    }
    public void setPosition(PVector position){
        this.position = position;
    }
    public PVector getRotation(){
        return rotation; 
    }
    public void setRotation(PVector rotation){
        this.rotation = rotation;
    }

    public PVector getPropulsion(){
        return propulsion; 
    }
    public void setPropulsion(PVector propulsion){
        this.propulsion = propulsion;
    }
    public PVector getDirection(){
        return direction; 
    }
    public void setDiretion(PVector direction){
        this.direction = direction;
    }

    public PVector getScale(){
        return scale; 
    }
    public void setScale(PVector scale){
        this.scale = scale;
    }

    public color getColor(){
        return c; 
    }
    public void setScale(color c){
        this.c = c;
    }
  
  
}
