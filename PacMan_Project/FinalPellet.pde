class FinalPellet {
  // Features
  PImage sprite;
  int xPos;
  int yPos;
  boolean isActive;  // Only appears after all pellets eaten
  boolean isEaten;
  
  // Constructor - starts inactive
  FinalPellet() {
    this.isActive = false;
    this.isEaten = false;
  }
  
  // Create final pellet at opposite side from PacMan
  void createFinalPellet(int pacmanX, int pacmanY) {
    // Calculate opposite position from PacMan
    // If PacMan is on left side, spawn on right, etc.
    if (pacmanX < width / 2) {
      xPos = int(width * 0.75);  // Right side
    } else {
      xPos = int(width * 0.25);  // Left side
    }
    
    if (pacmanY < height / 2) {
      yPos = int(height * 0.75);  // Bottom side
    } else {
      yPos = int(height * 0.25);  // Top side
    }
    
    isActive = true;
  }
  
  // Display the final pellet with special effects
  void display() {
    if (isActive && !isEaten) {
      // Outer glow effect
      for (int i = 3; i > 0; i--) {
        fill(255, 215, 0, 50);  // Gold color with transparency
        noStroke();
        circle(xPos, yPos, 20 + i * 10);
      }
      
      // Main pellet body
      fill(255, 215, 0);  // Gold color
      circle(xPos, yPos, 20);
      
      // Sparkle effect
      float sparkle = abs(sin(frameCount * 0.15)) * 255;
      fill(255, 255, 255, sparkle);
      circle(xPos, yPos, 12);
      
      // Rotating stars around it
      pushMatrix();
      translate(xPos, yPos);
      rotate(frameCount * 0.05);
      fill(255, 255, 0);
      for (int i = 0; i < 4; i++) {
        float angle = radians(90 * i);
        float starX = cos(angle) * 25;
        float starY = sin(angle) * 25;
        circle(starX, starY, 5);
      }
      popMatrix();
    }
  }
  
  // Remove final pellet when eaten
  void despawnFinalPellet() {
    isEaten = true;
    isActive = false;
  }
  
  // Check if final pellet is active
  boolean getIsActive() {
    return isActive;
  }
  
  // Check if final pellet has been eaten (win condition!)
  boolean getIsEaten() {
    return isEaten;
  }
  
  // Get position for collision detection
  int getX() {
    return xPos;
  }
  
  int getY() {
    return yPos;
  }
  
  // Reset for new game
  void reset() {
    isActive = false;
    isEaten = false;
  }
}
