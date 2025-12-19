class PacMan
{
  float x; // x position
  float y; // y position
  float speed; // movement speed
  int health;
  Wall wall;
  Ghost ghost;
  
  // for sprite 
  int spriteCounter = 0; // to be used as a timer for when the sprite should change
  PImage pacManSprite;
  
  // for movement 
  boolean right = false;
  boolean left = false;
  boolean up = false;
  boolean down = false;
  boolean isMoving = false;
  
  // for wall collisions
  float nextX;
  float nextY;
  
  // for respawning
  float xSpawn; 
  float ySpawn;
  boolean respawning;
  int respawnCounter = 0;
  
  PacMan(float x, float y, float speed, int health)
  {
    this.x = x;
    this.y = y;
    xSpawn = x; // set the local vars to the spawn coordinate
    ySpawn = y;
    this.speed = speed;
    this.health = health;
    pacManSprite = loadImage("PacMan_Closed.png");
  }
  
  void drawPacMan()
  {
    // code to switch sprite for moving pacman animation
    if (!respawning)
      {
      if (spriteCounter < 7) 
      {
        pacManSprite = loadImage("PacMan_Closed.png");
      } else if (spriteCounter == 7 || spriteCounter == 26) 
      {
        pacManSprite = loadImage("PacMan_Semi.png");
      } else if (spriteCounter == 15) 
      {
        pacManSprite = loadImage("PacMan_Open.png");
      }
    
      if (spriteCounter > 29) { // reset counter
        spriteCounter = 0;
      }
    }
  
    float angle = 0; // this will get pacmans rotation in radians based off of his movement direction
    
    if (!respawning)
    {
      if (left) 
      {
        angle = 0; // face left
      } 
      else if (up) 
      {
        angle = PI / 2.0; // face up
      }
      else if (down) 
      {
        angle = 3 * PI / 2.0; // face down
      } 
      else 
      {
        angle = PI; // face right
      }
    }
  
    // internally saves the transform of pacman to then apply rotation 
    pushMatrix();
  
    // gets the center coordinate of the sprite using sprite offset
    float cx = x + pacManSprite.width  / 2.0;
    float cy = y + pacManSprite.height / 2.0;
  
    translate(cx, cy); // changes from origin to center of sprite
    rotate(angle); // apply rotation based off of the translated 
  
    imageMode(CENTER); // sets the position where the image should be created
    image(pacManSprite, 0, 0); // create the image using the established rotation
    imageMode(CORNER); // resets it back to normal
  
    popMatrix(); // update all transforms made including the new sprite 
  
    // so it only does the anim if the pacman is moving
    if (isMoving && !respawning) 
    {
      spriteCounter++;
    }
  }
  
  boolean checkCollisions (Wall wall, float testX, float testY)
  {
    for (int i = 0; i <= 28; i++)
    {
      // check that detects if the pacman is ever overlapping with one of the rects based off of the matrix 
      if (testX < wall.wallCoordinates[0][i] + wall.wallCoordinates[2][i] && 
      testX + pacManSprite.width > wall.wallCoordinates[0][i] &&
      testY < wall.wallCoordinates[1][i] + wall.wallCoordinates[3][i] &&
      testY + pacManSprite.height > wall.wallCoordinates[1][i]) 
      {
        println("pacman collides with wall");
        isMoving = false;
        return true;
      }
    }
    return false;
  }
  
  boolean checkCollisions (Ghost ghost, float testX, float testY)
  {
    // check that detects if the pacman is ever overlapping with a ghost
    if (testX < ghost.xPos + ghost.sprite.width && 
    testX + pacManSprite.width > ghost.xPos &&
    testY < ghost.yPos + ghost.sprite.height &&
    testY + pacManSprite.height > ghost.yPos) 
    {
      println("pacman collides with ghost");
      return true;
    }
    
    return false;
  }
  
  
  void checkRespawn(Ghost ghost)
  {
    println(respawnCounter);
    if (checkCollisions(ghost, x, y) && !respawning)
    {
      respawning = true;
      pacManSprite = loadImage("PacMan_Death_Start.png");
    }
    
    if (respawning) //initiate counter
    {
      respawnCounter++;
    }
    
    // animation 
    if (respawnCounter == 10) pacManSprite = loadImage("PacMan_Death_Mid1.png");
    if (respawnCounter == 20) pacManSprite = loadImage("PacMan_Death_Mid2.png");
    if (respawnCounter == 30) pacManSprite = loadImage("PacMan_Death_Mid3.png");
    if (respawnCounter == 40) pacManSprite = loadImage("PacMan_Death_Mid4.png");
    if (respawnCounter == 50) pacManSprite = loadImage("PacMan_Death_Mid5.png");
    if (respawnCounter == 60) pacManSprite = loadImage("PacMan_Death_Mid6.png");
    if (respawnCounter == 70) pacManSprite = loadImage("PacMan_Death_Mid7.png");
    if (respawnCounter == 80) pacManSprite = loadImage("PacMan_Death_End.png");
    if (respawnCounter == 90) pacManSprite = loadImage("Sprite_Empty.png");
    
    if (respawnCounter == 120)
    {
       health--;
       x = xSpawn;
       y = ySpawn;
       right = false; 
       left = false;
       up = false;
       down = false;
    }
    if (respawnCounter == 150)
    {
      ghost.respawn(); // put the ghost back in its starting position
      respawnCounter = 0; 
      respawning = false;
      return;
    }
  }
  
  void checkDeath()
  {
    if (health == 0)
    {
      
    }
  }
  
  void updateMovement(Wall wall)
  { 
    if (!respawning)
    {
      nextX = x;
      nextY = y;
      if (left)
      {
        isMoving = true;
        nextX -= speed;
      }
      if (right)
      {
        isMoving = true;
        nextX += speed;
      }
      if (up)
      {
        isMoving = true;
        nextY -= speed;
      }
      if (down)
      {
        isMoving = true;
        nextY += speed;
      }
      
      // update x 
      if (!checkCollisions(wall, nextX, y))
      {
        x = nextX;
      }
      
      //update y
      if (!checkCollisions(wall, x, nextY))
      {
        y = nextY;
      }
      
      // for cross-screen movement (only implementing on the x axis since the only open spot is on the ex axis
      if (x < 0 - pacManSprite.width)
      {
        x = width;
      }
      if (x > width)
      {
        x = -pacManSprite.width;
      }
    }
  }
  
  void keyPressed()
  {
    if (key == 'a')
    {
      left = true;
      right = false;
      up = false;
      down = false;
    }
    if (key == 's')
    {
      down = true;
      left = false;
      up = false;
      right = false;
    }
    if (key == 'w')
    {
      up = true;
      down = false;
      left = false;
      right = false;
    }
    if (key == 'd')
    {
      right = true;
      up = false;
      down = false;
      left = false;
    }
  }
}
