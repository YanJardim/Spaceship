class Player extends GameObject {
	private float rotAngle;
	private float rotSpeed = 5;
  	public Player(PVector position, PVector rotation, float speed) {
    	super("player", position, rotation, new PVector(40, 40), speed);
		c = color(255, 255, 255);
		rotAngle = 0;
  	}
  	@Override
    public void draw() {
    	super.draw();
    	stroke(c);
    	noFill();
	
    	pushMatrix();
			translate(position.x , position.y );
			rotate(getAngle());

			pushMatrix();
				rotate(PI / 2);
				imageMode(CENTER);
				drawImage(0, 0);
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

}
