color primaryColour = color(255, 255, 255);  //<>// //<>//
color secondaryColour = color(0, 0, 0);
color debugColour = color(255, 0, 0);

int frameSize = 512;
int frameGrowing = -1;

int tileCountX = 4;
int tileCountY = 4;

void setup()
{
  size(512, 512);
  //frameRate(60);
  //surface.setResizable(true);
  update();
}
void exit()
{
  save("IFT3100H16_TP1.png");
}
void draw()
{
  //update();
  //surface.setSize(frameSize, frameSize);
  frameSize = frameSize + frameGrowing;
  if (frameSize > 800)
  {
    frameGrowing = -1;
  } else if (frameSize < 10)
  {
    frameGrowing = 1;
  }
}
void update()
{
  drawCheckerboard(0, 0, width, height, tileCountX, tileCountY, primaryColour, secondaryColour);

  float tileWidth = width/tileCountX;
  float tileHeight =  height/tileCountY;

  drawPlusSign(getTilePosX(0), getTilePosY(0), tileWidth, tileHeight, 0.125, 0.5, 0.5, 0.125, secondaryColour, (64.5/128.0), (64.5/128.0));
  drawCrossSign(getTilePosX(2), getTilePosY(0), tileWidth, tileHeight, 0.25, 0.25, 0.75, 0.75, 0.125, secondaryColour);
  drawStackedLine(getTilePosX(1), getTilePosY(1), tileWidth, tileHeight, 103.0/128.0, 0.9375, 5, secondaryColour, 0.5, (63.5/128.0));
  drawLinesOfEllipses(getTilePosX(3), getTilePosY(1), tileWidth, tileHeight, 3, 3, secondaryColour); 
  drawTarget(getTilePosX(0), getTilePosY(2), tileWidth, tileHeight, (116.0/128.0), (116.0/128.0), 14, secondaryColour, primaryColour, (64.5/128.0), (64.5/128.0)); 
  drawStar(getTilePosX(1), getTilePosY(3), tileWidth, tileHeight, 0.8, 0.8, 90, 0.03, secondaryColour);
  drawRecursiveCheckerboard(getTilePosX(3), getTilePosY(3), tileWidth, tileHeight, tileCountX, tileCountY, primaryColour, secondaryColour, 3, 3);
  drawInfinitySign(getTilePosX(2), getTilePosY(2), tileWidth, tileHeight, 0.8, 0.3, 0.2, 0.025, secondaryColour);
}

/// Get the x coordinate of the top-left corner of a tile position given. Starts at 0.
/// @param[in] _tileNumberX The number of the tile starting at 0 from the left.
int getTilePosX(int _tileNumberX)
{
  return _tileNumberX * (width / tileCountX);
}
/// Get the y coordinate of the top-left corner of a tile position given Starts at 0..
/// @param[in] _tileNumberY The number of the tile starting at 0 from the top.
int getTilePosY(int _tileNumberY)
{
  return _tileNumberY * (height / tileCountY);
}

/// Get an absolute value from a percentage.
/// @param[in] _minimalPos The smallest value in pixel.
/// @param[in] _lenghtScene The size of the zone.
/// @param[in] _ratio The ration of the desired position. Ex: 0.5 for the middle
float getPositionByRatio(float _minimalPos, float _lenghtScene, float _ratio)
{
  float min = _minimalPos;
  float max = _minimalPos + _lenghtScene;
 
  return min + ((max - min)*_ratio);
}

/// Draws a recursive checkboard pattern in a defined scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
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
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _tileCountX The quantity of horizontal tile of the checkerboard.
/// @param[in] _tileCountY The quantity of vertical tile of the checkerboard.
/// @param[in] _colour1 The first colour to use for the checkboard pattern.
/// @param[in] _colour2 The alternated colour to use for the checkboard pattern.
/// @param[in] _recursiveTileX The number of the horizontal tile in which the checkboard recursivity will happen. Starts at 0;
/// @param[in] _recursiveTileY The number of the horizontal tile in which the checkboard recursivity will happen. Starts at 0;
void drawRecursiveCheckerboard(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, int _tileCountX, int _tileCountY, color _colour1, color _colour2, int _recursiveTileX, int _recursiveTileY)
{
  if (_widthScene > _tileCountX && _heightScene > _tileCountY)
  {
    drawCheckerboard(_xPosScene, _yPosScene, _widthScene, _heightScene, _tileCountX, _tileCountY, _colour1, _colour2);
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
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _widthRatioVerticalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the vertical arm of the +.
/// @param[in] _heightRatioVerticalArm Number between 0 and 1 reprensentating the percentage of the scene used by the height of the vertical arm of the +.
/// @param[in] _widthRatioHorizontalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the horizontal arm of the +.
/// @param[in] _heightRatioHorizontalArm Number between 0 and 1 reprensentating the percentage of the scene used by the width of the horizontal arm of the +.
/// @param[in] _colour The colour of the +.
/// @param[in] _ratioXPositionCentre Number between 0 and 1 reprensentating the ratio X where to draw the + in the scene. 0.5 being the centre.
/// @param[in] _ratioYPositionCentre Number between 0 and 1 reprensentating the ratio Y where to draw the + in the scene. 0.5 being the centre.
void drawPlusSign(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _widthRatioVerticalArm, float _heightRatioVerticalArm, float _widthRatioHorizontalArm, float _heightRatioHorizontalArm, color _colour, float _ratioMiddleX, float _ratioMiddleY)
{
  float centreX =  getPositionByRatio(_xPosScene, _widthScene, _ratioMiddleX);// _xPosScene + _widthScene-1 * _ratioXPositionCentre; //<>//
  float centreY = getPositionByRatio(_yPosScene, _heightScene, _ratioMiddleY);//_yPosScene + _heightScene-1 * _ratioYPositionCentre;

  float verticalArmWidth = _widthScene * _widthRatioVerticalArm;
  float verticalArmHeight = _heightScene * _heightRatioVerticalArm;

  float horizontalArmWidth = _widthScene * _widthRatioHorizontalArm;
  float horizontalArmHeight = _heightScene * _heightRatioHorizontalArm;

  float verticalArmX = centreX - ((verticalArmWidth)/2.0);
  float verticalArmY = centreY - ((verticalArmHeight)/2.0);
  float horizontalArmX = centreX - ((horizontalArmWidth)/2.0);
  float horizontalArmY = centreY - ((horizontalArmHeight)/2.0);

  noStroke();
  fill(_colour);

  rect(verticalArmX, verticalArmY, verticalArmWidth, verticalArmHeight);
  rect(horizontalArmX, horizontalArmY, horizontalArmWidth, horizontalArmHeight);
}

/// Draws a cross sign ("X") in a defined scene
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
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

/// Draws a stack of lines where the middle one is the smallest and the outer one grows at a fibonacci rate.
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _drawZoneWidthRatio Number between 0 and 1 representating the ratio of the width of the drawzone within the scene.
/// @param[in] _drawZoneHeightRatio Number between 0 and 1 representating the ratio of the Height of the drawzone within the scene.
/// @param[in] _halfNumberOfLine The number of line from the middle to the top. It must be odd.
/// @param[in] _colour The colour of the lines.
/// @param[in] _ratioXPositionCentre Number between 0 and 1 reprensentating the ratio X where to draw the + in the scene. 0.5 being the centre.
/// @param[in] _ratioYPositionCentre Number between 0 and 1 reprensentating the ratio Y where to draw the + in the scene. 0.5 being the centre.
void drawStackedLine(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _drawZoneWidthRatio, float _drawZoneHeightRatio, int _halfNumberOfLine, color _colour, float _ratioMiddleX, float _ratioMiddleY)
{
  noStroke();
  fill(_colour);
  
  float linePosYDelta = (_heightScene*_drawZoneHeightRatio)/(_halfNumberOfLine*2);

  float centreY = getPositionByRatio(_yPosScene, _heightScene, _ratioMiddleY);//_yPosScene + (0.5  * _heightScene);
  float centreX = getPositionByRatio(_xPosScene, _widthScene, _ratioMiddleX);
  
  float drawZoneWidth =  _widthScene * _drawZoneWidthRatio;
  float linePosX = centreX - (drawZoneWidth/2.0);

  //Variable for fibonacci
  float initialLineHeight = _heightScene / 128;
  float lineHeightA = initialLineHeight;
  float lineHeightB = lineHeightA;

  rect(linePosX, centreY + lineHeightA/2.0, drawZoneWidth, lineHeightB); 
  for (int i = 1; i < _halfNumberOfLine; i++)
  {
    float lineHeightTemp = lineHeightA;
    lineHeightA = lineHeightB;
    lineHeightB = lineHeightB + lineHeightTemp;
    
    float lineTopPosY = centreY - i * linePosYDelta - lineHeightB/2.0;
    float lineBottomPosY = centreY + i * linePosYDelta - lineHeightB/2.0 +initialLineHeight; // -1 Magic Number à cause du prof!
    rect(linePosX, lineTopPosY, drawZoneWidth, lineHeightB); 
    rect(linePosX, lineBottomPosY, drawZoneWidth, lineHeightB);
    
  }
}

/// Draws a stack of lines of ellipses with an alternating pattern.
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _lineCount The number of line.
/// @param[in] _ellipsesCountPerLineThe number of ellipsePerLine.
/// @param[in] _colour The colour of the ellipses.
/// @param[in] _ratioXPositionCentre Number between 0 and 1 reprensentating the ratio X where to draw the + in the scene. 0.5 being the centre.
/// @param[in] _ratioYPositionCentre Number between 0 and 1 reprensentating the ratio Y where to draw the + in the scene. 0.5 being the centre.
void drawLinesOfEllipses(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, int _lineCount, int _ellipsesCountPerLine, color _colour) 
{
  noStroke();
  fill(_colour);
  float lineDelta = _heightScene / (_lineCount+1);
  float columnDelta = _widthScene / (_ellipsesCountPerLine+1);
  float ellipseWidth = columnDelta / 2;
  float ellipseHeight = lineDelta / 2;
  for (int line = 0; line < _lineCount; line++)
  {
    float posY =  _yPosScene + lineDelta * (line+1);
    for (int i = 0; i < _ellipsesCountPerLine; i++)
    {
      float posX = _xPosScene + (i+1)*columnDelta - ellipseWidth/2;
      if (line % 2 == 0)
      {
        posX = posX + ellipseWidth;
      }
      ellipse(posX, posY, ellipseWidth, ellipseHeight);
    }
  }
}


/// Draws a target
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _widthOfLargestEllipse Number between 0 and 1 determining the ratio of the width taken by then bigest ellipse.
/// @param[in] _heightOfLargestEllipse Number between 0 and 1 determining the ratio of the height taken by then bigest ellipse.
/// @param[in] _ellipseCount The number of ellipses.
/// @param[in] _colour1 The first colour to use for the target pattern.
/// @param[in] _colour2 The altenate colour to use for the target pattern.
/// @param[in] _ratioXPositionCentre Number between 0 and 1 reprensentating the ratio X where to draw the + in the scene. 0.5 being the centre.
/// @param[in] _ratioYPositionCentre Number between 0 and 1 reprensentating the ratio Y where to draw the + in the scene. 0.5 being the centre.
void drawTarget(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _widthOfLargestEllipse, float _heightOfLargestEllipse, int _ellipseCount, color _colour1, color _colour2, float _ratioMiddleX, float _ratioMiddleY)
{
  noStroke();
  float centreX = getPositionByRatio(_xPosScene, _widthScene, _ratioMiddleX);
  float centreY = getPositionByRatio(_yPosScene, _widthScene, _ratioMiddleY);
  for (int i = 0; i < _ellipseCount; i++)
  {
    if (i % 2 == 0)
    {
      fill(_colour1);
    } else
    {
      fill(_colour2);
    }
    float differenceWidth = (_widthOfLargestEllipse/(_ellipseCount*2+1))*2;
    float differenceHeight =(_heightOfLargestEllipse/(_ellipseCount*2+1))*2;
    float widthEllipse = (_widthOfLargestEllipse-(i*(differenceWidth))) *_widthScene;
    float heightEllipse = (_heightOfLargestEllipse-(i*(differenceHeight)))*_heightScene;
    ellipse(centreX, centreY, widthEllipse, heightEllipse);
  }
}

/// Draws an infinity sign by following the rule of a lemniscate of Bernoulli
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _ratioWidthInfinity Number between 0 and 1 determining the ratio of the width taken by the lemniscate.
/// @param[in] _ratioHeightInfinity Number between 0 and 1 determining the ratio of the height taken by the lemniscate (Not yet implemented).
/// @param[in] _anglePrecison The precision to calculate the coordinate of the lemniscate.
/// @param[in] _strokeRatio Number between 0 and 1 reprensentating the percentage of the scene a stroke use.
/// @param[in] _colour The colour of the lemniscate.
/// @todo Find a way to make the height of the loop proportional to the size of the scene.
void  drawInfinitySign(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _ratioWidthInfinity, float _ratioHeightInfinity, float _anglePrecison, float _strokeRatio, color _colour)
{
  noFill();
  stroke(_colour);
  strokeWeight(sqrt(_widthScene * _heightScene) * _strokeRatio);
  float centreX = _xPosScene + 0.5 * _widthScene;
  float centreY = _yPosScene + 0.5 * _heightScene;
  float a = (_widthScene*_ratioWidthInfinity)-g.strokeWeight;
  float diff = 0.1;
  for (float x = -a-diff; x < a+diff; x = x + _anglePrecison)
  {

    float y1 = sqrt(sqrt(sq(a)*(sq(a)+8*sq(x)))-sq(a)-2*(sq(x)))/sqrt(2)*0.5;
    float y2 = -sqrt(sqrt(sq(a)*(sq(a)+8*sq(x)))-sq(a)-2*(sq(x)))/sqrt(2)*0.5;

    //stroke(#FF0000);
    ellipse(centreX + (x*0.5), centreY + y1, g.strokeWeight, g.strokeWeight);
    //line (centreX + (x*0.5) , centreY + y1,centreX + (x*0.5), centreY + y1);
    //stroke(#00FF00);
    ellipse(centreX + (x*0.5), centreY + y2, g.strokeWeight, g.strokeWeight);
    //line(centreX + (x*0.5), centreY + y2, centreX + (x*0.5), centreY + y2);
  }
}

/// Draws a five pointed star
/// @param[in] _xPosScene The x position of the top-left corner of the rectangle of the scene.
/// @param[in] _yPosScene The y position of the top-left corner of the rectangle of the scene.
/// @param[in] _widthScene The width of the rectangle of the scene.
/// @param[in] _heightScene The height of the rectangle of the scene.
/// @param[in] _ratioWidthStar Number between 0 and 1 determining the ratio of the width taken by the ellipse that could be drawn connecting each point.
/// @param[in] _ratioHeightStar Number between 0 and 1 determining the ratio of the height taken by the ellipse that could be drawn connecting each point.
/// @param[in] _angleFirstPoint The angle between 0 and 360 where the first point of the star should be drawn.
/// @param[in] _strokeRatio Number between 0 and 1 reprensentating the percentage of the scene a stroke use.
/// @param[in] _colour The colour of the star.
void  drawStar(float _xPosScene, float _yPosScene, float _widthScene, float _heightScene, float _ratioWidthStar, float _ratioHeightStar, float _angleFirstPoint, float _strokeRatio, color _colour)
{
  noFill();
  stroke(_colour);
  strokeWeight(sqrt(_widthScene * _heightScene) * _strokeRatio);
  int pointCount = 5;
  float heightEllipse = _ratioHeightStar * _heightScene;
  float widthEllipse = _ratioWidthStar * _widthScene;
  float xRadius = (widthEllipse/2);
  float yRadius = (heightEllipse/2);
  float centreX = _xPosScene + 0.5 * _widthScene;
  float centreY = _yPosScene + 0.5 * _heightScene;

  float angle = _angleFirstPoint;
  float point1X = centreX + getXCoordinateEllipseAngle(xRadius, angle);
  float point1Y = centreY + getYCoordinateEllipseAngle(yRadius, angle);
  for (int i = 0; i < pointCount; i = i+1)
  {
    angle = angle + 2*(360/pointCount);

    float point2X = centreX + getXCoordinateEllipseAngle(xRadius, angle);
    float point2Y = centreY + getYCoordinateEllipseAngle(yRadius, angle);   
    line(point1X, point1Y, point2X, point2Y);
    point1X = point2X;
    point1Y = point2Y;
  }
}

/// Gives the x coordinate of a point on a given angle of the ellipse.
/// @param[in] _radiusX The horizontal lenght of the central point of the ellipse and border.
/// @param[in] _angle The angle of the desired point, between 0 and 360.
/// @return The x coordinate of the point.
float getXCoordinateEllipseAngle(float _radiusX, float _angle)
{
  return -_radiusX * cos( (_angle - 180) *PI /180);
}

/// Gives the y coordinate of a point on a given angle of the ellipse.
/// @param[in] _radiusY The vertical lenght of the central point of the ellipse and border.
/// @param[in] _angle The angle of the desired point, between 0 and 360.
/// @return The y coordinate of the point.
float getYCoordinateEllipseAngle(float _radiusY, float _angle)
{
  return _radiusY * sin( (_angle - 180) *PI /180);
}