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
  float prevX;
  float prevY;
  
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
    
    prevX = xPos;
    prevY = yPos;
    
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
  void collision(Wall wall)
  {
    boolean hitWall = false;
  
    for (int i = 0; i < 29; i++)
    {
      if (xPos < wall.wallCoordinates[0][i] + wall.wallCoordinates[2][i] &&
          xPos + sprite.width > wall.wallCoordinates[0][i] &&
          yPos < wall.wallCoordinates[1][i] + wall.wallCoordinates[3][i] &&
          yPos + sprite.height > wall.wallCoordinates[1][i])
      {
        hitWall = true;
        break;
      }
    }
  
    if (hitWall)
    {
      xPos = prevX;
      yPos = prevY;
  
      direction = pickNewDirection(wall);
    }
  }
  
  int pickNewDirection(Wall wall)
  {
    int[] possibleDirections = new int[4];
    int count = 0;
  
    for (int d = 0; d < 4; d++)
    {
      boolean isOpposite =
        (direction == 0 && d == 2) ||
        (direction == 2 && d == 0) ||
        (direction == 1 && d == 3) ||
        (direction == 3 && d == 1);
  
      if (isOpposite)
      {
        continue;
      }
  
      float testX = xPos;
      float testY = yPos;
  
      if (d == 0)
      {
        testY -= speed;
      }
      else if (d == 1)
      {
        testX += speed;
      }
      else if (d == 2)
      {
        testY += speed;
      }
      else if (d == 3)
      {
        testX -= speed;
      }
  
      if (!wouldCollide(wall, testX, testY))
      {
        possibleDirections[count] = d;
        count++;
      }
    }
  
    if (count == 0)
    {
      if (direction == 0)
      {
        return 2;
      }
      else if (direction == 2)
      {
        return 0;
      }
      else if (direction == 1)
      {
        return 3;
      }
      else
      {
        return 1;
      }
    }
  
    return possibleDirections[(int)random(count)];
  }
  
  boolean wouldCollide(Wall wall, float testX, float testY)
  {
    for (int i = 0; i < 29; i++)
    {
      if (testX < wall.wallCoordinates[0][i] + wall.wallCoordinates[2][i] &&
          testX + sprite.width > wall.wallCoordinates[0][i] &&
          testY < wall.wallCoordinates[1][i] + wall.wallCoordinates[3][i] &&
          testY + sprite.height > wall.wallCoordinates[1][i])
      {
        return true;
      }
    }
  
    return false;
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
