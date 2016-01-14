color primaryColour = color(255, 255, 255); //<>// //<>//
color secondaryColour = color(0, 0, 0);

int tileCountX = 4;
int tileCountY = 4;

void setup()
{
  size(512, 512);
  drawCheckerboard(0, 0, width, height, tileCountX, tileCountY, primaryColour, secondaryColour);

  drawRecursiveCheckerboard(getTilePosX(3), getTilePosY(3), width, height, tileCountX, tileCountY, primaryColour, secondaryColour, 3, 3);
}

/// Get the x coordinate of the top-left corner of a tile position given. Starts at 0.
int getTilePosX(int _tileNumberX)
{
  return _tileNumberX * (width / tileCountX);
}
/// Get the y coordinate of the top-left corner of a tile position given Starts at 0.
int getTilePosY(int _tileNumberY)
{
  return _tileNumberY * (height / tileCountY);
}

/// Draws a recursive checkboard pattern in a defined Scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The _heightScene of the rectangle of the scene.
/// @param[in] _tileCountX The quantity of horizontal tile of the checkerboard.
/// @param[in] _tileCountY The quantity of vertical tile of the checkerboard.
/// @param[in] _colour1 The first colour to use for the checkboard pattern.
/// @param[in] _colour2 The alternated colour to use for the checkboard pattern.
void drawCheckerboard(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, int _tileCountX, int _tileCountY, color _colour1, color _colour2)
{
  noStroke();
  float widthOfTile = _widthScene / _tileCountX;
  float heightOfTile = _heightScene / _tileCountY;
  for (int i = 0; i < _tileCountX; i++)
  {
    float xPosOfTile = _xPosScene + (i * widthOfTile);
    for (int j = 0; j < _tileCountY; j++)
    {
      float yPosOfTile = _yPosScene + (j * heightOfTile);

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

/// Draws a recursive checkboard pattern in a defined Scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The _heightScene of the rectangle of the scene.
/// @param[in] _tileCountX The quantity of horizontal tile of the checkerboard.
/// @param[in] _tileCountY The quantity of vertical tile of the checkerboard.
/// @param[in] _colour1 The first colour to use for the checkboard pattern.
/// @param[in] _colour2 The alternated colour to use for the checkboard pattern.
/// @param[in] _recursiveTileX The number of the horizontal tile in which the checkboard recursivity will happen. Starts at 0;
/// @param[in] _recursiveTileY The number of the horizontal tile in which the checkboard recursivity will happen. Starts at 0;

void drawRecursiveCheckerboard(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, int _tileCountX, int _tileCountY, color _colour1, color _colour2, int _recursiveTileX, int _recursiveTileY)
{

  float widthOfTile = _widthScene / _tileCountX; //<>//
  float heightOfTile = _heightScene / _tileCountY;
  drawCheckerboard(_xPosScene, _yPosScene, widthOfTile, heightOfTile, _tileCountX, _tileCountY, _colour1, _colour2);
  if (widthOfTile > 0 && heightOfTile > 0)
  {
    float xPosNextTile = _xPosScene + (_recursiveTileX * (widthOfTile/_tileCountX));
    float yPosNextTile = _yPosScene + (_recursiveTileY * (heightOfTile/_tileCountY));
    drawRecursiveCheckerboard(xPosNextTile, yPosNextTile, widthOfTile, heightOfTile, _tileCountX, _tileCountY, _colour1, _colour2, _recursiveTileX, _recursiveTileY);
  }
}

public static class Tile
{
  
}

coor