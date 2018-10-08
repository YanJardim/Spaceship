class GameManager {
    
    private int score;
    
    public GameManager() {
        score = 0;
    }
    
    public void draw(){
        fill(255);
        textSize(30);
        textFont(pixelFont);
        text("SCORE: " + score, 10, 30); 
        text("HP: " + player.getHealth(), 10, 60); 
    }
    
    public void addScore(int amount){
         score += amount;
    }

    
}
