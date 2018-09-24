abstract class GameObject{
  protected PVector position;
  protected PVector rotation;
  protected PVector scale;
  protected color color;
  
  public GameObject(PVector position, PVector rotation){
    this.position = position;
    this.rotation = rotation;
  }
  public GameObject(PVector position, PVector rotation, PVector scale){
    this(position, rotation);
    this.scale = scale;
  }
  
  public void draw(){}
  public void update(){}
  
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
  
  public PVector getScale(){
     return scale; 
  }
  public void setScale(PVector scale){
      this.scale = scale;
  }
  
   public color getColor(){
     return color; 
  }
  public void setScale(color color){
      this.color = color;
  }
  
  
}
