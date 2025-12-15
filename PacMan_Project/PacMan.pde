class PacMan
{
  float x; // x position
  float y; // y position
  float speed; // movement speed
  int health;
  Wall wall;
  
  // for sprite 
  int spriteCounter = 0; // to be used as a timer for when the sprite should change
  PImage pacManSprite;
  
  // for movement 
  boolean right = false;
  boolean left = false;
  boolean up = false;
  boolean down = false;
  boolean isMoving = false;
  
  PacMan(float x, float y, float speed, int health)
  {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.health = health;
    pacManSprite = loadImage("PacMan_Closed.png");
  }
  
  void drawPacMan()
  {
    // code to switch sprite for pacman animation
    if (spriteCounter < 7) {
      pacManSprite = loadImage("PacMan_Closed.png");
    } else if (spriteCounter == 7 || spriteCounter == 26) {
      pacManSprite = loadImage("PacMan_Semi.png");
    } else if (spriteCounter == 15) {
      pacManSprite = loadImage("PacMan_Open.png");
    }
  
    if (spriteCounter > 29) { // reset counter
      spriteCounter = 0;
    }
  
    float angle = 0; // this will get pacmans rotation in radians based off of his movement direction
    
    if (left) {
      angle = 0;           // face left
    } else if (up) {
      angle = PI / 2.0; // face up
    } else if (down) {
      angle = 3 * PI / 2.0;     // face down
    } else {
      angle = PI;            // face right
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
    if (isMoving) {
      spriteCounter++;
    }
  }
  
  void checkCollisions (Wall wall)
  {
    
  }
  
  void updateMovement()
  {
    if (left)
    {
      isMoving = true;
      x -= speed;
    }
    if (right)
    {
      isMoving = true;
      x += speed;
    }
    if (up)
    {
      isMoving = true;
      y -= speed;
    }
    if (down)
    {
      isMoving = true;
      y += speed;
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
