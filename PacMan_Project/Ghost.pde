class Ghost {
  // Features
  PImage sprite;
  int direction;  // 0=up, 1=right, 2=down, 3=left
  float xPos;
  float yPos;
  float speed;
  float baseX;  // Spawn position X
  float baseY;  // Spawn position Y
  boolean isVulnerable;  // Can be eaten by PacMan
  
  Wall wall;
  
  // Constructor
  Ghost(float x, float y, float s) {
    this.xPos = x;
    this.yPos = y;
    this.baseX = x;  // Remember spawn location
    this.baseY = y;
    this.speed = s;
    this.direction = int(random(4));  // Random starting direction
    this.isVulnerable = false;
  }
  
  // Display the ghost
  void display() 
  {
    if (isVulnerable) 
    {
      
    } 
    else 
    {
      if (direction == 0)
      {
        sprite = loadImage("Blinky_Up.png");
      }
      if (direction == 1)
      {
        sprite = loadImage("Blinky_Right.png");
      }
      if (direction == 2)
      {
        sprite = loadImage("Blinky_Down.png");
      }
      if (direction == 3)
      {
        sprite = loadImage("Blinky_Left.png");
      }
    }
    // load the sprite based 
    image(sprite, xPos, yPos);
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
    // Simple boundary check - if touching wall, reverse direction
    boolean hitWall = false;
    
    for (int i = 0; i <= 28; i++) // check through all of wallcoordinates 
      {
      if (xPos < wall.wallCoordinates[0][i] + wall.wallCoordinates[2][i] && 
        xPos + sprite.width > wall.wallCoordinates[0][i] &&
        yPos < wall.wallCoordinates[1][i] + wall.wallCoordinates[3][i] &&
        yPos + sprite.height > wall.wallCoordinates[1][i]) 
        {
          hitWall = true;
        }
      
      if (hitWall) {
        // Reverse direction when hitting wall
        if (direction == 0) {
          direction = 2;  // Up -> Down
          yPos += speed * 2;
        } else if (direction == 1) {
          direction = 3;  // Right -> Left
          xPos -= speed * 2;
        } else if (direction == 2) {
          direction = 0;  // Down -> Up
          yPos -= speed * 2;
        } else if (direction == 3) {
          direction = 1;  // Left -> Right
          xPos += speed * 2;
        }
      }
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
  float getX() {
    return xPos;
  }
  
  float getY() {
    return yPos;
  }
}
