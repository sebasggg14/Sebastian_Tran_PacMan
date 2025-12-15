class Pellet {
  // Features
  PImage sprite;
  static int counter = 0;  // Keeps track of total pellets
  int xPos;
  int yPos;
  boolean isEaten;  // To track if pellet has been eaten
  
  // Constructor
  Pellet(int x, int y) {
    this.xPos = x;
    this.yPos = y;
    this.isEaten = false;
    counter++;  // Increment total pellet count
  }
  
  // Create and display pellet
  void createPellet() {
    if (!isEaten) {
      fill(255, 255, 200);  // Light yellow color for pellet
      noStroke();
      circle(xPos, yPos, 8);  // Small circle for pellet
    }
  }
  
  // Remove pellet when eaten by PacMan
  void despawnPellet() {
    if (!isEaten) {
      isEaten = true;
      counter--;  // Decrease pellet count
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
  
  // Static method to get remaining pellet count
  static int getCounter() {
    return counter;
  }
  
  // Reset counter (useful when restarting game)
  static void resetCounter() {
    counter = 0;
  }
}
