import javax.swing.*;

String playerName; //playername
String name; //playername substring check 
int diff; // dificulty modifier
int score; //score
int xShip; //ship X coordinate
int lives; // lives counter 
boolean shipTouchedPlanet = false; //collison dector
boolean gameStart = false; // starting game 
PImage img; // image variable
int[] array; // socre array
int arrayIndex = 0; // array counter 
int roundCount = 0; // round counter 
int scores = 0; // //total score 

PlanetM planet1; //planets
PlanetM planet2;
PlanetM planet3;


void setup() {
 background(0);
 size(800, 400);
 frameRate(30);
 img = loadImage("spaceship-crash.jpg");
 lives = 3;
 planet1 = new PlanetM(width, color(0, 100, 150)); //setting up planets
 planet2 = new PlanetM(width, color(150, 100, 0));
 planet3 = new PlanetM(width, color(100, 0, 150));
 array = new int[4];
}

void draw() {
 if (gameStart == true) {
  xShip = 50;
  background(10);
  stroke(0);
  stars();

  planet1.move(); // initializing planets
  planet1.display();
  planet2.move();
  planet2.display();
  planet3.move();
  planet3.display();

  fill(255);
  triangle(xShip, mouseY - 25, xShip, mouseY + 25, xShip + 50, mouseY); //spaceship

  lifeCounter();
  collision();

  fill(255, 255, 0);
  textSize(11);
  text("Score:" + score, 20, 10); //Score display
  text("Lives:" + lives, 30, 20);
 } else {
  playerName = JOptionPane.showInputDialog("What is your name? (Max 10 chars)", "John"); // name im put 

  name = playerName;
  if (name.length() < 10) {
   name = playerName;
  } else {
   name = playerName.substring(0, 10);
  }

  diff = Integer.parseInt(JOptionPane.showInputDialog("Please enter a number between 1 and 3 ", "2")); // difficulty setter
  if ((diff > 3) || (diff < 0)) {
   diff = 2;
   println("Difficulty set to 2");
  }
  gameStart = true;
 }
}

void lifeCounter() //dealing with lives and deaths
 {
  if (lives > 0) //score addition 
  {
   score += 1;
  } else if (lives <= 0) //replay screen 
  {
    array[roundCount] = score;
   
   if (roundCount < 3) {
    int reply = JOptionPane.showConfirmDialog(null, "Next round", "Input", JOptionPane.PLAIN_MESSAGE);
    if (reply == 0) {
     resetGame();
     roundCount += 1;
    }
   }
   else {
    image(img, 0, 0, width, height);
    for (int i = 0; i < array.length; i++) {
     scores += array[i];
    }
    
    JOptionPane.showConfirmDialog(null, "Game over " + name + ". Your score was " + scores, "Input", JOptionPane.PLAIN_MESSAGE);
    fill(255,0,0);
    textSize(26);
    text("Game Over", 400, 200);
    stop();
   }
  }
 }


void collision() //Detecting for collisions 
 {
  if (((dist(planet1.x, planet1.y, 65, mouseY + 25) <= 40)) || ((dist(planet2.x, planet2.y, 65, mouseY + 25) <= 40)) || ((dist(planet3.x, planet3.y, 65, mouseY + 25) <= 40))) //measuers distance from mouseY to center of spheres decides 
  {

   if (!shipTouchedPlanet) {
    lives -= 1;
    shipTouchedPlanet = true;
   }
   delay(3000);
   shipTouchedPlanet = false;
  }
 }

void stars() {
 for (int i = 1; i < 50; i++) //makes stars 
 {
  while (i < 5) {
   fill(255);
   ellipse(random(800), random(400), 10, 10);
   i++;
  }
  while (i < 50) {
   fill(255);
   ellipse(random(800), random(400), 5, 5);
   i++;
  }
 }
}

void resetGame() {
 score = 0;
 background(0);
 size(800, 400);
 frameRate(30);
 img = loadImage("spaceship-crash.jpg");
 lives = 3;
 planet1 = new PlanetM(width, color(0, 100, 150)); //setting up planets
 planet2 = new PlanetM(width, color(150, 100, 0));
 planet3 = new PlanetM(width, color(100, 0, 150));
}