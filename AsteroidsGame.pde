SpaceShip koiShip;
Star [] stars;
//Asteroid [] asteroids;
ArrayList <Asteroid> theList;
ArrayList <Bullet> bullets;

public void setup() 
{
  size (500, 500);
  background(0);
  koiShip = new SpaceShip();

  stars = new Star[5000];
  for (int i = 0; i < 1000; i++)
  {
    stars[i] = new Star();
  }

  /* asteroids = new Asteroid[50];
   for(int i = 0; i < 25; i++)
   {
   asteroids[i] = new Asteroid();
   } */


  theList = new ArrayList <Asteroid> ();
  for (int i = 0; i < 20; i++)
  {
    theList.add(new Asteroid());
  }
  
  bullets = new ArrayList <Bullet> ();
  
}

public void draw() 
{
  background(0);
  for (int i = 0; i < 1000; i++)
  {
    stars[i].show();
  }

  /*for (int i = 0; i < 25; i++)
   {
   asteroids[i].show();
   asteroids[i].move();
   } */

  for (int i= 0; i< theList.size(); i++)
      {
        theList.get(i).move();
        theList.get(i).show();
      }
  for(int i = 0; i < bullets.size(); i++)
      {
        bullets.get(i).move();
        bullets.get(i).show();
      }
  for(int j = 0; j < bullets.size(); j++)
    {
      for(int i = 0; i < theList.size(); i++)
          {
          /*if (dist(koiShip.getX(), koiShip.getY(), theList.get(i).getX(), theList.get(i).getY()) < 20)
            {
              theList.remove(i);
            }
            */
            if (dist(bullets.get(j).getX(), bullets.get(j).getY(), theList.get(i).getX(), theList.get(i).getY()) < 20)
              {
                theList.remove(i);
              }
          }
    }
  koiShip.show();
  koiShip.move();
}

public void keyPressed()
{
  if(key == ' ')
  { 
    bullets.add(new Bullet(koiShip));
  }   
  if (keyCode == UP)
  {
    koiShip.accelerate(0.08);
  } else if (keyCode == DOWN)
  {
    koiShip.accelerate(-0.08);
  } else if (keyCode == LEFT)
  {
    koiShip.rotate(-25);
  } else if (keyCode == RIGHT)
  {
    koiShip.rotate(25);
  } else if (key == 'a')
  {
    koiShip.setX((int)(Math.random()*501));
    koiShip.setY((int)(Math.random()*501));
    koiShip.setPointDirection((int)(Math.random()*361));
  } else if (key == 'z')
  {
    koiShip.setDirectionX(0);
    koiShip.setDirectionY(0);
  }
}

public class Star
{
  private int posX, posY, mySize;
  public Star()
  {
    posX = ((int)(Math.random()*501));
    posY = ((int)(Math.random()*501));
    mySize = ((int)(Math.random()*6));
  }
  public void show()
  {
    noStroke();
    fill(170, 174, 170);
    ellipse(posX, posY, mySize, mySize);
  }
}

public class SpaceShip extends Floater  
{   
  public SpaceShip() {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    myColor = 255;
    myCenterX = 250;
    myCenterY = 250;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }

  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int)myCenterX;
  }
  public void setY(int y) { 
    myCenterY = y;
  }
  public int getY() { 
    return (int)myCenterY;
  }
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }
  public double getDirectionX() { 
    return myDirectionX;
  }
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }
  public double getDirectionY() { 
    return myDirectionY;
  }
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }
  public double getPointDirection() { 
    return myPointDirection;
  }
}

public class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -11;
    yCorners[0] = -8;
    xCorners[1] = 7;
    yCorners[1] = -8;
    xCorners[2] = 9;
    yCorners[2] = 0;
    xCorners[3] = 6;
    yCorners[3] = 10; 
    xCorners[4] = -11;
    yCorners[4] = 8;
    xCorners[5] = -14;
    yCorners[5] = 0;
    myColor = 100;
    myCenterX = ((int)(Math.random()*501));
    myCenterY = ((int)(Math.random()*501));
    myDirectionX = ((int)(Math.random()*4)-1);
    myDirectionY = ((int)(Math.random()*4)-1);
    myPointDirection = ((int)(Math.random()*361));
    rotSpeed = ((int)(Math.random()*8));
  }

  public void move()
  {
    rotate((int)(rotSpeed));
    super.move();
  }

  public void setX(int x) { 
    myCenterX = x;
  }
  public int getX() { 
    return (int)myCenterX;
  }
  public void setY(int y) { 
    myCenterY = y;
  }
  public int getY() { 
    return (int)myCenterY;
  }
  public void setDirectionX(double x) { 
    myDirectionX = x;
  }
  public double getDirectionX() { 
    return myDirectionX;
  }
  public void setDirectionY(double y) { 
    myDirectionY = y;
  }
  public double getDirectionY() { 
    return myDirectionY;
  }
  public void setPointDirection(int degrees) { 
    myPointDirection = degrees;
  }
  public double getPointDirection() { 
    return myPointDirection;
  }
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if (myCenterX >width)
    {     
      myCenterX = 0;
    } else if (myCenterX<0)
    {     
      myCenterX = width;
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;
    } else if (myCenterY < 0)
    {     
      myCenterY = height;
    }
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for (int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated, yRotatedTranslated);
    }   
    endShape(CLOSE);
  }
} 