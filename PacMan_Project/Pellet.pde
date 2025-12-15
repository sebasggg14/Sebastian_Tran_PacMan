class Pellet {
  // Features
  PImage sprite;
  int xPos;
  int yPos;
  boolean isEaten;  // To track if pellet has been eaten
  
  // Constructor
  Pellet(int x, int y) {
    this.xPos = x;
    this.yPos = y;
    this.isEaten = false;
  }
  
  // Create and display pellet
  void createPellet() {
    if (!isEaten) {
      fill(255, 255, 200);  // Light yellow color for pellet
      noStroke();
      ellipse(xPos, yPos, 8, 8);  // Small circle for pellet
    }
  }
  
  // Remove pellet when eaten by PacMan
  void despawnPellet() {
    if (!isEaten) {
      isEaten = true;
    }
  }
  
  // Check if pellet has been eaten
  boolean getIsEaten() {
    return isEaten;
  }
  
  // Get pellet position for collision detection
  int getX() {
    return xPos;
  }
  
  int getY() {
    return yPos;
  }
}
