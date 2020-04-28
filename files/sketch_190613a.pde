
int fieldX = 8;
int fieldY = 8;
int fieldSize = 30;
int textSize = 20;
int field[][] = new int[fieldX][fieldY];
int blockers = 4;

//Node n = new Node(null,11,1);
AStar pathfinding = new AStar();


void setup()
{
  frameRate(1);
  
  for ( int x=0; x<fieldX; x++)
  {
    for ( int y=0; y<fieldY; y++)
    {
      /*if ( x == 4 && blockers-- > 0)
      {
        field[x][y] = 1;        
      }
      else
      {*/
        field[x][y] = 0;
      //}
    }
  }
  
  size(240,240);
}

void draw()
{
  background(0);

  textAlign(CENTER);
  textSize(textSize);
  
  pathfinding.path(field, 1,1, 7,7);

  //top left start
  for ( int x=0; x<fieldX; x++)
  {
    for ( int y=0; y<fieldY; y++)
    {
      if ( field[x][y] == 0)
        fill(200);
      else
        fill(0);
        
      rect((x*fieldSize),(y*fieldSize),fieldSize,fieldSize);
      
      fill(0);
      text(field[x][y], (x*fieldSize)+(fieldSize/2), (y*fieldSize)+((fieldSize-textSize)/2)+textSize);
    }
  }
} //<>//
