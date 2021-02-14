/**** Vehicle Class ****/


class Vehicle {

  //global variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxForce;
  float maxSpeed;
  float r;

  //constructor
  Vehicle(PVector v, float ms, float mf) {

    //a copy of the vectors in the array list
    location = v.copy();

    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);


    maxSpeed = ms;
    maxForce = mf;
    r = 3;
  }

  //follow function, that makes the vehicle follow the flow field
  void follow(FlowField flow) {

    PVector desired = flow.lookUp(location);
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  // update function that adds velocity to acceleration
  void update() {

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    acceleration.mult(0);
    location.add(velocity);
  }

  //apply function that applies any type of force on the vehicle
  void applyForce(PVector force) {

    acceleration.add(force);
  }

  //display function that draws the vehicle
  void display() {

    float theta = velocity.heading() + radians(90);

    fill(random(170, 247), random(170, 247), random(170, 247));
    stroke(0);

    pushMatrix();

    translate(location.x, location.y);
    rotate(theta);

    //beginShape(); allows you to draw complex shapes
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);

    popMatrix();
  }
}//end of class
