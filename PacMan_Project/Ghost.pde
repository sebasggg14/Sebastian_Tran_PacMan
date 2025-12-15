class Ghost {
  // Features
  PImage sprite;
  int direction;  // 0=up, 1=right, 2=down, 3=left
  int xPos;
  int yPos;
  int speed;
  int baseX;  // Spawn position X
  int baseY;  // Spawn position Y
  boolean isVulnerable;  // Can be eaten by PacMan
  
  // Constructor
  Ghost(int x, int y, int s) {
    this.xPos = x;
    this.yPos = y;
    this.baseX = x;  // Remember spawn location
    this.baseY = y;
    this.speed = s;
    this.direction = int(random(4));  // Random starting direction
    this.isVulnerable = false;
  }
  
  // Display the ghost
  void display() {
    if (isVulnerable) {
      fill(50, 50, 255);  // Blue when vulnerable
    } else {
      fill(255, 0, 0);  // Red when dangerous
    }
    noStroke();
    circle(xPos, yPos, 30);  // Ghost body
    
    // Simple eyes
    fill(255);
    circle(xPos - 6, yPos - 3, 8);
    circle(xPos + 6, yPos - 3, 8);
    fill(0);
    circle(xPos - 6, yPos - 3, 4);
    circle(xPos + 6, yPos - 3, 4);
  }
  
  // Move ghost randomly
  void movement() {
    // Randomly change direction occasionally
    if (random(1) < 0.02) {  // 2% chance per frame
      direction = int(random(4));
    }
    
    // Move based on direction
    if (direction == 0) {  // Up
      yPos -= speed;
    } else if (direction == 1) {  // Right
      xPos += speed;
    } else if (direction == 2) {  // Down
      yPos += speed;
    } else if (direction == 3) {  // Left
      xPos -= speed;
    }
  }
  
  // Return ghost to spawn position
  void respawn() {
    xPos = baseX;
    yPos = baseY;
    direction = int(random(4));
    isVulnerable = false;
  }
  
  // Check collision with wall and change direction
  void collision(Wall wall) {
    // Check if ghost is overlapping with wall
    if (xPos + 15 > wall.xPos && xPos - 15 < wall.xPos + wall.width &&
        yPos + 15 > wall.yPos && yPos - 15 < wall.yPos + wall.length) {
      // Reverse direction when hitting wall
      if (direction == 0) direction = 2;  // Up -> Down
      else if (direction == 1) direction = 3;  // Right -> Left
      else if (direction == 2) direction = 0;  // Down -> Up
      else if (direction == 3) direction = 1;  // Left -> Right
      
      // Move back slightly to prevent getting stuck
      if (direction == 0) yPos -= speed * 2;
      else if (direction == 1) xPos += speed * 2;
      else if (direction == 2) yPos += speed * 2;
      else if (direction == 3) xPos -= speed * 2;
    }
  }
  
  // Make ghost vulnerable (can be eaten)
  void makeVulnerable() {
    isVulnerable = true;
  }
  
  // Make ghost dangerous again
  void makeNormal() {
    isVulnerable = false;
  }
  
  // Get vulnerability status
  boolean getIsVulnerable() {
    return isVulnerable;
  }
  
  // Get position for collision detection
  int getX() {
    return xPos;
  }
  
  int getY() {
    return yPos;
  }
}
