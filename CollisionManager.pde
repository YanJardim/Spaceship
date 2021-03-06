class CollisionManager {


    public CollisionManager() {
    }

    public void checkCollision() {
        for (int i=0; i<meteorSpawner.getMeteors().size(); ++i) {
            Meteor e = meteorSpawner.getMeteors().get(i);
            for (int j=0; j<player.getBullets().size(); ++j)
            {
                if (player.getBullets().get(j).checkCollision(e)) {
                    //
                    player.removeBullet(player.getBullets().get(j));
                    if (e.isDead()) {
                        meteorSpawner.killMeteor(e);
                        gameManager.addScore(10 * e.getLevel() * 2);
                    } else {
                        e.levelUp();
                        gameManager.addScore(10 * e.getLevel());
                    }
                }
            }
        }
        for (int i=0; i<meteorSpawner.getMeteors().size(); ++i) {
            Meteor e = meteorSpawner.getMeteors().get(i);
            if (player.checkCollision(e)) {
                player.takeDamage();
            }
        }
    }
}
