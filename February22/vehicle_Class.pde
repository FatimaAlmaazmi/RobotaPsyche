/**** Vehicle Class ****/


class Vehicle {

  //global variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxForce;
  float maxSpeed;
  float r;


  /*** CONSTRUCTOR & UPDATE ***/


  Vehicle(PVector v, DNA d) {

    //a copy of the vectors in the array list
    location = v.copy();

    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);


//    maxSpeed = 2;
//    maxForce = 0.3;
    r = 3;
  }


  // update function that adds velocity to acceleration
  void update() {

    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    acceleration.mult(0);
    location.add(velocity);
  }



  /*** FLOW FIELD FUNCTIONS ***/


  //follow function, that makes the vehicle follow the flow field
  void follow(FlowField flow) {

    PVector desired = flow.lookUp(location);
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }




  /*** DNA FUNCTIONS ***/


  DNA getDNA() {
    DNA d = new DNA();

    return d;
  }




  /*** FORCES AND BEHAVIORS FUNCTIONS ***/


  //apply function that applies any type of force on the vehicle
  void applyForce(PVector force) {

    acceleration.add(force);
  }

  // function that applies behaviors together
  void applyBehaviors(ArrayList<Vehicle> v) {

    PVector separate = separate(v);
    PVector seek = seek(new PVector(mouseX, mouseY));

    applyForce(seek);
    applyForce(separate);
  }

  //separate function that separates vehicles from each other
  PVector separate (ArrayList<Vehicle> v) {

    float desiredSeparation = 20;
    int count =0;
    PVector sum = new PVector (0, 0);

    for (Vehicle vv : v) {

      float d = PVector.dist(location, vv.location);

      if ((d > 0) && (d < desiredSeparation)) {

        PVector diff = PVector.sub(location, vv.location);
        diff.normalize();

        sum.add(diff);
        count++;
      }
    }

    if (count > 0) {

      sum.div(count);

      sum.setMag(maxSpeed);

      PVector steer = PVector.sub(sum, velocity);

      steer.limit(maxForce);

      applyForce(steer);
    }
    return sum;
  }


  //seek function that lets vehicles seek a target
  PVector seek(PVector target) {

    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    return steer;
  }



  /*** DISPLAY FUNCTION ***/


  //display function that draws the vehicle
  void display() {

    float theta = velocity.heading() + radians(90);

    fill(235);
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
