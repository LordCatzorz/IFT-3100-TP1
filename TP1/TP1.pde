color primaryColour = color(255, 255, 255); //<>// //<>// //<>// //<>//
color secondaryColour = color(0, 0, 0);
color debugColour = color(255, 0, 0);

int tileCountX = 4;
int tileCountY = 4;

void setup()
{
  size(512, 512);
  drawCheckerboard(0, 0, width, height, tileCountX, tileCountY, primaryColour, secondaryColour);

  float tileWidth = width/tileCountX;
  float tileHeight =  height/tileCountY;

  drawPlusSign(getTilePosX(0), getTilePosY(0), tileWidth, tileHeight, 0.125, 0.5, 0.5, 0.125, secondaryColour, 0.5, 0.5);
  drawCrossSign(getTilePosX(2), getTilePosY(0), tileWidth, tileHeight, 0.25, 0.25, 0.75, 0.75, 0.125, secondaryColour);
  drawStackedLine(getTilePosX(1), getTilePosY(1), tileWidth, tileHeight, 5, 0.8, secondaryColour);
  drawRecursiveCheckerboard(getTilePosX(3), getTilePosY(3), tileWidth, tileHeight, tileCountX, tileCountY, primaryColour, secondaryColour, 3, 3);
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

/// Draws a recursive checkboard pattern in a defined scene
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

/// Draws a recursive checkboard pattern in a defined scene
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

  drawCheckerboard(_xPosScene, _yPosScene, _widthScene, _heightScene, _tileCountX, _tileCountY, _colour1, _colour2);
  if (_widthScene > 0 && _heightScene > 0)
  {
    float widthOfTile = _widthScene / _tileCountX;
    float heightOfTile = _heightScene / _tileCountY;
    float xPosNextTile = _xPosScene + (_recursiveTileX * (widthOfTile));
    float yPosNextTile = _yPosScene + (_recursiveTileY * (heightOfTile));
    drawRecursiveCheckerboard(xPosNextTile, yPosNextTile, widthOfTile, heightOfTile, _tileCountX, _tileCountY, _colour1, _colour2, _recursiveTileX, _recursiveTileY);
  }
}

/// Draws a plus sign ("+") in a defined scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The _heightScene of the rectangle of the scene.
/// @param[in] _widthRatioVerticalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the vertical arm of the +.
/// @param[in] _heightRatioVerticalArm Number between 0 and 1 reprensentating the percentage of the scene used by the height of the vertical arm of the +.
/// @param[in] _widthRatioHorizontalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the horizontal arm of the +.
/// @param[in] _heightRatioHorizontalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the horizontal arm of the +.
/// @param[in] _colour The colour of the +.
/// @param[in] _ratioXPositionCentre Number between 0 and 1 reprensentating the ratio X where to draw the + in the scene. 0.5 being the centre.
/// @param[in] _ratioYPositionCentre Number between 0 and 1 reprensentating the ratio Y where to draw the + in the scene. 0.5 being the centre.
void drawPlusSign(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _widthRatioVerticalArm, float _heightRatioVerticalArm, float _widthRatioHorizontalArm, float _heightRatioHorizontalArm, color _colour, float _ratioXPositionCentre, float _ratioYPositionCentre)
{
  float centreX = _xPosScene + _widthScene * _ratioXPositionCentre;
  float centreY = _yPosScene + _heightScene * _ratioYPositionCentre;

  float verticalArmWidth = _widthScene * _widthRatioVerticalArm;
  float verticalArmHeight = _heightScene * _heightRatioVerticalArm;

  float horizontalArmWidth = _widthScene * _widthRatioHorizontalArm;
  float horizontalArmHeight = _heightScene * _heightRatioHorizontalArm;

  float verticalArmX = centreX - ((verticalArmWidth)/2);
  float verticalArmY = centreY - ((verticalArmHeight)/2);
  float horizontalArmX = centreX - ((horizontalArmWidth)/2);
  float horizontalArmY = centreY - ((horizontalArmHeight)/2);

  noStroke();
  fill(_colour);

  rect(verticalArmX, verticalArmY, verticalArmWidth, verticalArmHeight);
  rect(horizontalArmX, horizontalArmY, horizontalArmWidth, horizontalArmHeight);
}

/// Draws a cross sign ("X") in a defined scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The _heightScene of the rectangle of the scene.
/// @param[in] _ratioXBegin Number between 0 and 1 reprensentating the percentage of the scene where the top-left of the sign X coordinate is.
/// @param[in] _ratioYBegin Number between 0 and 1 reprensentating the percentage of the scene where the top-left of the sign Y coordinate is.
/// @param[in] _ratioXEnd Number between 0 and 1 reprensentating the percentage of the scene where the bottom-right of the sign X coordinate is.
/// @param[in] _ratioYEnd Number between 0 and 1 reprensentating the percentage of the scene where the bottom-right of the sign X coordinate is.
/// @param[in] _strokeRatio Number between 0 and 1 reprensentating the percentage of the scene a stroke use.
/// @param[in] _colour The colour of the X.
void drawCrossSign(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _ratioXBegin, float _ratioYBegin, float _ratioXEnd, float _ratioYEnd, float _strokeRatio, color _colour)
{
  noFill();
  stroke(_colour);
  strokeWeight(sqrt(_widthScene * _heightScene) * _strokeRatio);

  line(_xPosScene + (_ratioXBegin * _widthScene), _yPosScene + (_ratioYBegin * _heightScene), _xPosScene + (_ratioXEnd * _widthScene), _yPosScene + (_ratioYEnd * _heightScene));
  line(_xPosScene + (_ratioXEnd * _widthScene), _yPosScene + (_ratioYBegin * _heightScene), _xPosScene + (_ratioXBegin * _widthScene), _yPosScene + (_ratioYEnd * _heightScene));
}

void drawStackedLine(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, int halfNumberOfLine, float ratioWidthLine, color _colour)
{
  noStroke();
  fill(_colour);
  float lineWidth = ratioWidthLine * _widthScene;
  float linePosX = _xPosScene + (((1-ratioWidthLine)/2) * _widthScene);

  float linePosYDelta = _heightScene/(halfNumberOfLine*2+0.5);

  float centreY = _yPosScene + (0.5  * _heightScene);
  
  //Variable for fibonacci
  float lineHeightA= _heightScene / _heightScene;
  float lineHeightB = lineHeightA;
  
  rect(linePosX, centreY, lineWidth, lineHeightB); 
  for (int i = 1; i < halfNumberOfLine; i++)
  {
    float lineHeightTemp = lineHeightA;
    lineHeightA = lineHeightB;
    lineHeightB = lineHeightB + lineHeightTemp;
    float lineTopPosY = centreY - i * linePosYDelta - lineHeightB/2;
    float lineBottomPosY = centreY + i * linePosYDelta - lineHeightB/2;
    rect(linePosX, lineTopPosY, lineWidth, lineHeightB); 
    rect(linePosX, lineBottomPosY, lineWidth, lineHeightB);
  }
}