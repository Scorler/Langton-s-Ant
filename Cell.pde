class Cell
{
  int w, i, j;
  boolean ant = false;
  color clr = 0;
  
  Cell(int w_, int i_, int j_)
  {
     w = w_;
     i = i_;
     j = j_;
  }
  
  void switchColor()
  {
    clr++;
    if (clr > nColors) clr = 0;
  }
  
  void show()
  {
    noStroke();
    fill(colors[clr]);
   
     rect(i*w, j*w, w, w);
  }
}
