int width = 900;
int height = 900;
int cellsW = 4;
String rules = "RRRRLLLL";

color[] colors = {color(255, 255, 255), color(0, 0, 0), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(0, 255, 255), color(255, 0, 255)};
int nColors = rules.length()-1;

Cell[][] grid = new Cell[width/cellsW][height/cellsW];
Cell antCell;

int[] ant = new int[3]; // X, Y, Direction: 0-up, 1-left, 2-down, 3-right

int steps = 0;

void settings()
{
  size(width, height); 
}

void setup()
{    
  frameRate(1000);
  for (int i=0; i<grid.length; i++)
  {
    for (int j=0; j<grid[0].length; j++)
    {
       grid[i][j] = new Cell(cellsW, i, j);
    }
  }
  
  Cell startingCell = grid[width/cellsW/2][height/cellsW/2];
    
  ant[0] = startingCell.i;
  ant[1] = startingCell.j;
  ant[2] = 0;
  
  antCell = grid[ant[0]][ant[1]];
  
  showCells();
}

void draw()
{
  think();
}

void think()
{  
  if ((ant[0] >= 0) && (ant[1] >= 0) && (ant[0] <= grid.length-1) && (ant[1] <= grid[0].length-1))
  {
    antCell = grid[ant[0]][ant[1]];
        
    if (rules.charAt(antCell.clr) == 'R') turn(1);
    else turn(-1);
    antCell.switchColor();
    go();
       
    steps++;
    if (steps % 100 == 0)
    {
      print("Step ");
      println(steps);
    }
    
    antCell.ant = true;
    antCell.show();
  }
  else
  {
    print("Finished after ");
    print(steps);
    println(" steps");
    
    noLoop();
  }
}

void go()
{
  switch(ant[2])
  {
    case 0:
      ant[1]--;
      break;
    case 1:
      ant[0]--;
      break;
    case 2:
      ant[1]++;
      break;
    case 3:
      ant[0]++;
      break;
  }  
}

void turn(int dir) // 1 - R, -1 - L
{
  ant[2] += dir;
  if (ant[2] < 0) ant[2] = 3;
  else if (ant[2] > 3) ant[2] = 0;
}

void showCells()
{
  for (int i=0; i<grid.length; i++)
  {
    for (Cell cell : grid[i])
    {
      cell.show();
    }
  }
}
