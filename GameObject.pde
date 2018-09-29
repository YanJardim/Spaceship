abstract class GameObject{
    protected PVector position;
    protected PVector direction;
    protected PVector propulsion;
    protected PVector rotation;
    protected PVector scale;
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
    }
    public GameObject(PVector position, PVector rotation, PVector scale, float speed){
        this(position, rotation, scale);
        this.speed = speed;
    }

    public void draw(){
        update();
    }
    public void update(){   
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
