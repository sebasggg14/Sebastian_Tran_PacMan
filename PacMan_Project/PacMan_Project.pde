PacMan player;
Wall map;


void setup() 
{
  size(1000,600); // size of the window 
  player = new PacMan(475, 525, 2.5, 3);
  map = new Wall();
}

void draw()
{
  background(25);
  for (int i = 0; i <= 42; i ++)
  {
    map.createWall(i);
  }
  player.drawPacMan();
  player.updateMovement();
}

void keyPressed()
{
  player.keyPressed();
}
