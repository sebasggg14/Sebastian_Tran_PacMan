class PowerUp {
  // Features
  PImage sprite;
  int xPos;
  int yPos;
  boolean isActive;  // Track if power-up is still available
  
  // Constructor
  PowerUp(int x, int y) {
    this.xPos = x;
    this.yPos = y;
    this.isActive = true;
  }
  
  // Create and display power-up
  void createPowerUp() {
    if (isActive) {
      fill(255, 150, 0);  // Orange color for power-up
      noStroke();
      circle(xPos, yPos, 16);  // Larger than regular pellet
      
      // Add pulsing effect
      float pulseSize = 16 + sin(frameCount * 0.1) * 3;
      noFill();
      stroke(255, 150, 0, 150);
      strokeWeight(2);
      circle(xPos, yPos, pulseSize);
      strokeWeight(1);  // Reset stroke weight
    }
  }
  
  // Remove power-up when eaten by PacMan
  void despawnPowerUp() {
    isActive = false;
  }
  
  // Check if power-up is still active
  boolean getIsActive() {
    return isActive;
  }
  
  // Get position for collision detection
  int getX() {
    return xPos;
  }
  
  int getY() {
    return yPos;
  }
  
  // Optional: Reset power-up (if you want it to respawn)
  void reset() {
    isActive = true;
  }
}
