<<<<<<< Updated upstream
//PacMan Game
println("hello");
println("hey");
=======
PacMan player;
Wall map;
Ghost blinky;
ArrayList<Pellet> pellets = new ArrayList<Pellet>();
int score;
boolean gameWon = false;

void setup() 
{
  size(1000,600); // size of the window 
  score = 0;
  player = new PacMan(475, 525, 2.5, 3);
  map = new Wall();
  for (int i = 0; i <= 28; i ++)
  {
    map.createWall(i);
  }
  
  for (int i = 0; i < 4; i++)
  {
    int x;
    int y;
    do {
     x = int(random(100, 900));
     y = int(random(100, 900));
    } while (!isEmpty(x, y, map.wallCoordinates));
    Pellet pellet = new Pellet(x, y);
    pellets.add(pellet);
    }
  blinky = new Ghost(35, 85, 2.5);
}

void draw()
{
  if (gameWon) {
    background(0);
    fill(255,255,0);
    textAlign(CENTER,CENTER);
    textSize(40);
    text("YOU WON!", width/2,height/2);
    
    return;
  }
  
  background(25);
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 30);
  for (int i = 0; i <= 28; i ++)
  {
    map.createWall(i);
  }
  

  player.drawPacMan();
  blinky.display(player);
  blinky.movement();
  blinky.collision(map);
  player.updateMovement(map);
  
  player.checkRespawn(blinky);
  for (int i = pellets.size() - 1; i >= 0; i--)
  {
    Pellet p = pellets.get(i);
    p.createPellet();
    if (p.checkCollisions(player)) {
      pellets.remove(i);      // eaten
      score += 10;         // if you have score
  }
  }
  
  if (pellets.size()==0) {
    gameWon = true;
  }
  
  fill(255);
  textSize(20);
  text("Score: " + score,20,30);
}

void keyPressed()
{
  player.keyPressed();
}

boolean isPointInWall(int px, int py, int[][] walls) {
  for (int i = 0; i < walls[0].length; i++) {
    int x = walls[0][i];
    int y = walls[1][i];
    int w = walls[2][i];
    int h = walls[3][i];

    int left = x;
    int right = x + w;
    int top = y;
    int bottom = y + h;

    if (px >= left - 5 && px < right + 5 && py >= top - 5 && py < bottom+5) {
      return true;
    }
  }
  return false;
}

boolean isEmpty(int px, int py, int[][] walls) {
  return !isPointInWall(px, py, walls);
}
>>>>>>> Stashed changes
