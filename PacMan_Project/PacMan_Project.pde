PacMan player;
Wall map;
Ghost blinky;


void setup() 
{
  size(1000,600); // size of the window 
  player = new PacMan(475, 525, 2.5, 3);
  map = new Wall();
  blinky = new Ghost(35, 85, 2.5);
}

void draw()
{
  background(25);
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
}

void keyPressed()
{
  player.keyPressed();
}
