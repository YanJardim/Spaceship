class CollisionManager {
    

    public CollisionManager() {
        
    }

    public void checkCollision() {
        for (int i=0; i<meteorSpawner.getMeteors().size(); ++i) {
            Meteor e = meteorSpawner.getMeteors().get(i);
            for (int j=0; j<player.getBullets().size(); ++j)
            {
                if (player.getBullets().get(j).checkCollision(e)) {
                    System.out.println("Colisão com Inimigo: " + i);
                    //meteorSpawner.killMeteor(e);
                    player.removeBullet(player.getBullets().get(j));
                    e.levelUp();
                    gameManager.addScore(10);
                    //System.out.println("Colisão com Inimigo: " + j);
                }
            }
        }
    }
}
