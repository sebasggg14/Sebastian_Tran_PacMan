class Wall {
  
  int [][] wallCoordinates = new int [4][29]; 
  // rows: x, y, width, height // cols: each unique wall
  
  void createWall(int i)
  {
    noStroke(); // remove the border from rects
    
    // outer border
    if (i == 0) // top
    { // top
      rect(0, 50, 1000, 30); // create wall
      wallCoordinates[0][i] = 0; // store x
      wallCoordinates[1][i] = 50; // store y
      wallCoordinates[2][i] = 1000; // store width
      wallCoordinates[3][i] = 30; // store height
    }

    if (i == 1) // bottom
    { 
      rect(0, 570, 1000, 30);
      wallCoordinates[0][i] = 0;
      wallCoordinates[1][i] = 570;
      wallCoordinates[2][i] = 1000;
      wallCoordinates[3][i] = 30;
    }

    if (i == 2) // left-top
    { 
      rect(0, 50, 30, 275);
      wallCoordinates[0][i] = 0;
      wallCoordinates[1][i] = 50;
      wallCoordinates[2][i] = 30;
      wallCoordinates[3][i] = 275;
    }

    if (i == 3) // left-bottom
    { 
      rect(0, 375, 30, 275);
      wallCoordinates[0][i] = 0;
      wallCoordinates[1][i] = 375;
      wallCoordinates[2][i] = 30;
      wallCoordinates[3][i] = 275;
    }

    if (i == 4) // right-top
    { 
      rect(970, 50, 30, 275);
      wallCoordinates[0][i] = 970;
      wallCoordinates[1][i] = 50;
      wallCoordinates[2][i] = 30;
      wallCoordinates[3][i] = 275;
    }

    if (i == 5) // right-bottom
    { 
      rect(970, 375, 30, 275);
      wallCoordinates[0][i] = 970;
      wallCoordinates[1][i] = 375;
      wallCoordinates[2][i] = 30;
      wallCoordinates[3][i] = 275;
    }

    // top band
    if (i == 6) 
    {
      rect(85, 135, 235, 25);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 135;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    if (i == 7) 
    {
      rect(680, 135, 235, 25);
      wallCoordinates[0][i] = 680;
      wallCoordinates[1][i] = 135;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    if (i == 8) 
    {
      rect(400, 50, 200, 95);
      wallCoordinates[0][i] = 400;
      wallCoordinates[1][i] = 50;
      wallCoordinates[2][i] = 200;
      wallCoordinates[3][i] = 95;
    }

    if (i == 9) 
    {
      rect(85, 135, 25, 130);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 135;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 130;
    }

    if (i == 10) 
    {
      rect(890, 135, 25, 130);
      wallCoordinates[0][i] = 890;
      wallCoordinates[1][i] = 135;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 130;
    }

    // ghost spawn box
    if (i == 11) 
    {
      rect(375, 200, 100, 15);
      wallCoordinates[0][i] = 375;
      wallCoordinates[1][i] = 200;
      wallCoordinates[2][i] = 100;
      wallCoordinates[3][i] = 15;
    }

    if (i == 12) 
    {
      rect(525, 200, 100, 15);
      wallCoordinates[0][i] = 525;
      wallCoordinates[1][i] = 200;
      wallCoordinates[2][i] = 100;
      wallCoordinates[3][i] = 15;
    }

    if (i == 13) 
    {
      rect(375, 320, 250, 15);
      wallCoordinates[0][i] = 375;
      wallCoordinates[1][i] = 320;
      wallCoordinates[2][i] = 250;
      wallCoordinates[3][i] = 15;
    }

    if (i == 14) 
    {
      rect(375, 215, 15, 105);
      wallCoordinates[0][i] = 375;
      wallCoordinates[1][i] = 215;
      wallCoordinates[2][i] = 15;
      wallCoordinates[3][i] = 105;
    }

    if (i == 15) 
    {
      rect(610, 215, 15, 105);
      wallCoordinates[0][i] = 610;
      wallCoordinates[1][i] = 215;
      wallCoordinates[2][i] = 15;
      wallCoordinates[3][i] = 105;
    }

    // mid rows
    if (i == 16) 
    {
      rect(85, 240, 235, 25);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 240;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    if (i == 17) 
    {
      rect(680, 240, 235, 25);
      wallCoordinates[0][i] = 680;
      wallCoordinates[1][i] = 240;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    if (i == 18) 
    {
      rect(85, 320, 235, 25);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 320;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    if (i == 19) 
    {
      rect(680, 320, 235, 25);
      wallCoordinates[0][i] = 680;
      wallCoordinates[1][i] = 320;
      wallCoordinates[2][i] = 235;
      wallCoordinates[3][i] = 25;
    }

    // lower blocks
    if (i == 20) 
    {
      rect(160, 400, 210, 40);
      wallCoordinates[0][i] = 160;
      wallCoordinates[1][i] = 400;
      wallCoordinates[2][i] = 210;
      wallCoordinates[3][i] = 40;
    }

    if (i == 21) 
    {
      rect(630, 400, 210, 40);
      wallCoordinates[0][i] = 630;
      wallCoordinates[1][i] = 400;
      wallCoordinates[2][i] = 210;
      wallCoordinates[3][i] = 40;
    }

    // bottom horizontals
    if (i == 22) 
    {
      rect(85, 498, 345, 25);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 498;
      wallCoordinates[2][i] = 345;
      wallCoordinates[3][i] = 25;
    }

    if (i == 23) 
    {
      rect(570, 498, 345, 25);
      wallCoordinates[0][i] = 570;
      wallCoordinates[1][i] = 498;
      wallCoordinates[2][i] = 345;
      wallCoordinates[3][i] = 25;
    }

    // side verticals
    if (i == 24) 
    {
      rect(85, 320, 25, 125);
      wallCoordinates[0][i] = 85;
      wallCoordinates[1][i] = 320;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 125;
    }

    if (i == 25) 
    {
      rect(890, 320, 25, 125);
      wallCoordinates[0][i] = 890;
      wallCoordinates[1][i] = 320;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 125;
    }

    // center pieces
    if (i == 26) 
    {
      rect(485, 335, 25, 30);
      wallCoordinates[0][i] = 485;
      wallCoordinates[1][i] = 335;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 30;
    }

    if (i == 27) 
    {
      rect(485, 423, 25, 100);
      wallCoordinates[0][i] = 485;
      wallCoordinates[1][i] = 423;
      wallCoordinates[2][i] = 25;
      wallCoordinates[3][i] = 100;
    }

    if (i == 28) 
    {
      rect(425, 415, 145, 25);
      wallCoordinates[0][i] = 425;
      wallCoordinates[1][i] = 415;
      wallCoordinates[2][i] = 145;
      wallCoordinates[3][i] = 25;
    }
  }
}
