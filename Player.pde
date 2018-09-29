class Player extends GameObject {
	private float rotAngle;
	private float rotSpeed = 5;
  	public Player(String imageName, PVector position, PVector rotation, float speed) {
    	super(imageName, position, rotation, new PVector(40, 40), speed);
		c = color(255, 255, 255);
		rotAngle = 0;
  	}
  	@Override
    public void draw() {
    	super.draw();
    	stroke(c);
    	noFill();
	
    	pushMatrix();
			translate(position.x - scale.x / 2, position.y - scale.y / 2);
			rotate(getAngle());
			//triangle(0, 0, scale.x, 0, scale.x / 2, scale.y);
      		//rect(-scale.x / 2, -scale.x/2, scale.x, scale.y);
			imageMode(CENTER);
			pushMatrix();
				rotate(PI / 2);
				image(image, 0, 0);
			popMatrix();
    	popMatrix();
  	}
  	public float getAngle() {
    	PVector rot  = rotation.copy();
    	return atan2(-rot.x, rot.y);
  	}
  	@Override
  	public void update() {
  	  	super.update();
  	  	applyRotation();
  	  	move();
  	  	scroll();
  	}
  	public void limitVel(){
  	    constrain(direction.x, 0, 0.05);
  	    constrain(direction.y, 0, 0.05);
  	}
	public void applyRotation(){
		rotation.x = cos(rotAngle);
		rotation.y = sin(rotAngle);
	}
  	public void move() {
	  	position.add(direction.add(propulsion.normalize()).normalize().mult(speed * time.deltatime()));
		println("rot: "+ direction);
  	  	if (keyPressed) {
			if (key == 'w') {
				propulsion = rotation.copy();
			}
			if (key == 'a') {
				rotAngle -= time.deltatime() * rotSpeed;
			}
			if (key == 'd') {
				rotAngle += time.deltatime() * rotSpeed;
			}
			
  	  	}
  	  	//propulsion.mult();
  	}

  	public void scroll(){
  		position.x = position.x <= -scale.x/2 ? width : position.x >= width ? 0 : position.x; 
  	   	position.y = position.y <= -scale.y/2 ? height : position.y >= height ? 0 : position.y; 
  	}
}
