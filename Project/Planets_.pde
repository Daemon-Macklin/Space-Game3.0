class PlanetM 
{
  float x; //for planet X coordinate
  float y; // for planet y coordinate 
  color c; // planet color
  
  
  PlanetM(float tempx, color tempc) // setting planet fields
  {
    x = tempx;
    c = tempc; 
    y = random(400);
  }
  
  void move()
  {
    x -= diff*15;//Movement alone X axis 
    
    if(x <= 0)
    {
      x = width; // Sending the planet back to the start
      y = random(400);
    }
  }
  
  void display()
  {
   fill(c); // coloring planet 
   ellipse(x,y,100,100); //drawing planet
  }
   
   //------------------//
  //     getters      //
  //------------------//
  
  public float getX()
  {
    return x;
  }
  
  public float getY()
  {
    return y;
  }
  
  public color getC()
  {
    return c;
  }
  
   //------------------//
  //     setters      //
  //------------------//
  
  public void setX(float x)
  {
  this.x = x; 
  }
  
   public void setY(float y)
  {
  this.y = y; 
  }
  
   public void setC(color c)
  {
  this.c = c; 
  }
}