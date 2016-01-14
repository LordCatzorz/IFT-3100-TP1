color primaryColour = color(255, 255, 255);
color secondaryColour = color(0, 0, 0);
void setup()
{
  size(512, 512); //<>//
  drawCheckerboard(0, 0, width, height, 4, 4, primaryColour, secondaryColour);
}

  void drawCheckerboard(float _xPos, float _yPos, float _width, float _height, int _numberOfTileX, int _numberOfTileY, color _colour1, color _colour2)
{
  noStroke();
  float widthOfTile = _width / _numberOfTileX; //<>//
  float heightOfTile = _height / _numberOfTileX;
  for (int i = 0; i < _numberOfTileX; i++)
  {
    float xPosOfTile = _xPos + (i * widthOfTile);
    for (int j = 0; j < _numberOfTileY; j++)
    {
      float yPosOfTile = _yPos + (j * heightOfTile);

      if ((i + j) % 2 == 0)
      {
        fill(_colour1);
      } else
      {
        fill(_colour2);
      }

      rect(xPosOfTile, yPosOfTile, widthOfTile, heightOfTile);
    }
  }
}