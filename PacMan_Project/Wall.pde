class Wall {
  
  int [][] wallCoordinates = new int [4][42]; 
  // rows: x, y, width, height // cols: each unique wall
  
  void createWall(int i) 
  { 
    // outer border
    if (i == 1) rect(0, 50, 1000, 30); // top
    if (i == 2) rect(0, 570, 1000, 30); // bottom
    if (i == 3) rect(0, 50, 30, 275); // left-top
    if (i == 10) rect(0, 375, 30, 275); // left-bottom
    if (i == 4) rect(970, 50, 30, 275); // right-top
    if (i == 11) rect(970, 375, 30, 275); // right-bottom

    // top band
    if (i == 5) rect(100, 100, 200, 30); // top-left long
    if (i == 6) rect(700, 100, 200, 30); // top-right long
    if (i == 7) rect(400, 100, 200, 30); // top-middle
    if (i == 8) rect(100, 100, 30, 150); // left vertical down
    if (i == 9) rect(870, 100, 30, 150); // right vertical down

    // ghost spawn box (center)
    if (i == 12) rect(375, 200, 100, 15); // top-left
    if (i == 20) rect(525, 200, 100, 15); // top-right
    if (i == 13) rect(375, 320, 250, 15); // bottom
    if (i == 14) rect(375, 215, 15, 105); // left
    if (i == 15) rect(610, 215, 15, 105); // right

    // mid-row horizontals
    if (i == 16) rect(100, 250, 200, 25); // mid-left
    if (i == 17) rect(700, 250, 200, 25); // mid-right
    if (i == 18) rect(100, 350, 200, 25); // lower-mid-left
    if (i == 19) rect(700, 350, 200, 25); // lower-mid-right

    //// vertical pillars in lower mid
    //if (i == 20) rect(200, 350, 30, 150); // left pillar
    //if (i == 21) rect(770, 350, 30, 150); // right pillar

    // big horizontal above Pac-Man's starting corridor
    //if (i == 22) rect(250, 450, 500, 30); // central long bar

    // extra horizontals near bottom
    if (i == 23) rect(80, 498, 840, 25); // lower-left
    //if (i == 24) rect(700, 450, 200, 30); // lower-right

    // inner verticals near lower sides
    if (i == 25) rect(80, 350, 25, 100); // left-side vertical
    if (i == 26) rect(895, 350, 25, 100); // right-side vertical
    if (i == 27) rect(485, 335, 25, 35); // central vertical below spawn
    if (i == 27) rect(485, 423, 25, 75); // central vertical below spawn
    if (i == 27) rect(425, 423, 145, 25); // central horizontal below spawn
    
  }
}
