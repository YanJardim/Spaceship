class Player extends GameObject {

    private boolean isLeft, isRight, isUp, isDown, isSpace;
    private ArrayList<Bullet> bullets;
    private boolean canShoot;
    private float fireRatio, shootTimer;

    public Player(PVector position, PVector rotation, float speed) {
        super("player", position, rotation, new PVector(40, 40), speed);
        c = color(255, 255, 255);
        rotAngle = 0;
        bullets = new ArrayList<Bullet>();
        fireRatio = 0.2;
    }
    @Override
    public void draw() {
        super.draw();

        drawBullets();
        drawWithRotation();
    }

    @Override
    public void update() {
        super.update();
        move();
        shoot();
        applyRotation();
    }

    private void drawPlayer() {
    }
    public void limitVel() {
        constrain(direction.x, 0, 0.05);
        constrain(direction.y, 0, 0.05);
    }

    public void move() {
        position.add(propulsion.normalize().mult(speed * time.deltatime()));

        if (isUp) {
            propulsion = rotation.copy();
        }
        if (isLeft) {
            rotAngle -= time.deltatime() * rotSpeed;
        }
        if (isRight) {
            rotAngle += time.deltatime() * rotSpeed;
        }
        //propulsion.mult();
    }

    public void shoot() {
        if (isSpace && canShoot) {
            bullets.add(new Bullet(position.copy(), rotation.copy(), 200, 3));
            canShoot = false;
            shootTimer = 0;
        } else if (!canShoot) {
            shootTimer += time.deltatime();
            if (shootTimer >= fireRatio) {
                canShoot = true;
            }
        }
    }

    boolean setMove(int key, boolean value) {
        switch (key) {
        case 'W':
        case UP:
            return isUp = value;

        case 'S':
        case DOWN:
            return isDown = value;

        case 'A':
        case LEFT:
            return isLeft = value;

        case 'D':
        case RIGHT:
            return isRight = value;
        case ' ':
            return isSpace = value;

        default:
            return value;
        }
    }

    private void drawBullets() {
        for (int i = 0; i < bullets.size(); i++) {
            Bullet b = bullets.get(i);
            if (b.isDead()) {
                bullets.remove(b);
                return;
            }
            b.update();
            b.draw();
        }
    }
    
    public ArrayList<Bullet> getBullets(){
         return bullets;   
    }
}
