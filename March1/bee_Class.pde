/**** Vehicle Class ****/


class Bee {

  //global variables
  PVector location;
  PVector velocity;
  PVector acceleration;

  float maxForce;
  float maxSpeed;
  float r;
  float lifeSpan;
  float gender;

  DNA d;

  PImage bees;

  /*** CONSTRUCTOR & UPDATE ***/


  Bee(PVector b) {

    //a copy of the vectors in the array list
    location = b.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);


    d = new DNA();

    maxSpeed = d.speed;
    maxForce = d.force;
    lifeSpan = 5;
    r = d.determineMass();
    gender = d.determineGender();

    bees = new PImage();
    bees = loadImage("bee.png");
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
    return(d.getDNA());
  }


  void hive() {

    PVector queen = new PVector(width/2, height/2);
    float d = PVector.dist(location, queen);

    if (d<r/2) {

      lifeSpan -= 0.2;
    }
  }



  boolean dead() {

    //what I would like to add is commented because it doesnt work :(
    
    if (lifeSpan < 0 /*&& gender == 2*/) {

      return true;
    } else {

      return false;
    }
  }




  /*** FORCES AND BEHAVIORS FUNCTIONS ***/


  //apply function that applies any type of force on the vehicle
  void applyForce(PVector force) {

    acceleration.add(force);
  }

  // function that applies behaviors together
  void applyBehaviors(ArrayList<Bee> b) {

    PVector separate = separate(b);
    PVector seek = seek(new PVector(width/2, height/2));

    applyForce(seek);
    applyForce(separate);
  }

  //separate function that separates vehicles from each other
  PVector separate (ArrayList<Bee> b) {

    float desiredSeparation = 5;
    int count = 0;
    PVector sum = new PVector (0, 0);

    for (Bee bb : b) {

      float d = PVector.dist(location, bb.location);

      if ((d > 0) && (d < desiredSeparation)) {

        PVector diff = PVector.sub(location, bb.location);
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


// draw according to gender:
    if (gender == 1) {

      pushMatrix();

      translate(location.x, location.y);
      rotate(theta);


      image(bees, 0, 0, r*2, r*2);

      popMatrix();
      
      println("displaying female bees");
    }

    else if (gender == 2) {

      pushMatrix();

      translate(location.x, location.y);
      rotate(theta);


      image(bees, 0, 0, r*2, r*2);

      popMatrix();
      
      println("displaying male bees");
    }


//draw normally:

    //pushMatrix();

    //translate(location.x, location.y);
    //rotate(theta);

    //image(bees, 0, 0, r, r);

    //popMatrix();
  }
}//end of class
