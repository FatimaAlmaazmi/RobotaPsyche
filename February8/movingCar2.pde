/*
Fatima Almaazmi. 8th February 2021.
 
 This is a Processing program that uses the concepts of vectors and forces
 to move a car around the screen.
 
 Use the arrow keys to control the moving car.
 
 Enjoy!
 */



/**** My class ****/

class Car {

  // global variables in class

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topSpeed;


  Car() {

    location = new PVector (width/2, height/2);
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0);
    topSpeed = 10; //to control the car
  }


  // update function that adds velocity to acceleration
  void update() {

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    acceleration.mult(0);
    location.add(velocity);
  }


  // function to check if the car reaches the edge and displays it on the other end
  void checkEdges() {

    if (location.y > height) {
      location.y = 0;
    }

    if (location.y < 0) {
      location.y = height;
    }

    if (location.x > width) {
      location.x = 0;
    }

    if (location.x < 0) {
      location.x = width;
    }
  }


  // funtion that makes the car drive according to the direction
  void drive(PVector direction) {

    acceleration.add(direction);
  }


  // function that displays and draws the car
  void displayCar() {

    rectMode(CENTER);
    noStroke();

    pushMatrix();

    translate(location.x, location.y);
    rotate(velocity.heading());

    // draws the body of the car
    fill(173, 38, 38);
    rect(0, 0, 50, 30);

    fill(113, 2, 10);
    rect(-5, 0, 25, 20);

    //draws the tires
    fill(0);
    ellipse(10, 15, 10, 5);
    ellipse(-10, 15, 10, 5);
    ellipse(10, -15, 10, 5);
    ellipse(-10, -15, 10, 5);

    //draws the window in front of the car
    fill(169, 240, 234, 200);
    rect(18, 0, 10, 25);




    popMatrix();
  }
}



/**** Setup and Draw ****/

//my global variables

Car car;

//the directions
PVector right = new PVector(.1, 0);
PVector left = new PVector(-.1, 0);
PVector up = new PVector(0, -.1);
PVector down = new PVector(0, .1);
PVector halt = new PVector(0, 0);


void setup() {

  size(640, 430);
  background(255);

  car = new Car();
}


void draw() {

  background(255);

  car.update();
  car.checkEdges();
  car.displayCar();

  // to move car when an arrow key is pressed
  if (key == CODED && keyPressed == true) {
    if (keyCode == RIGHT) {

      car.drive(right);
    }
    if (keyCode == LEFT) {

      car.drive(left);
    }
    if (keyCode == UP) {
      car.drive(up);
    }
    if (keyCode == DOWN) {
      car.drive(down);
    }
  }

  // to stop car when no key is pressed
  if (keyPressed == false) {

    PVector stop = car.velocity.copy();
    stop.mult(-1);
    stop.normalize();
    stop.mult(0.01);

    car.drive(stop);
  }
}
