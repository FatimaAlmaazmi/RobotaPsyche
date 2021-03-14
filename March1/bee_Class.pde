/**** Bee Class ****/


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
  float mass;
  DNA d;

  PImage mBee;
  PImage fBee;

  /*** CONSTRUCTOR & UPDATE ***/


  Bee(PVector b, float mass) {

    //a copy of the vectors in the array list
    location = b.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector (0, 0);


    d = new DNA();

    maxSpeed = d.speed;
    maxForce = d.force;
    lifeSpan = 5;
    gender = d.gender;
    mass = r;
    r = d.determineMass();


    mBee = new PImage();
    mBee = loadImage("mbee.png");

    fBee = new PImage();
    fBee = loadImage("fbee.png");
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

  //function that gets the DNA of one bee
  DNA getDNA() {

    return(d.getDNA());
  }

  //function that determines when a male bee has spent too much time in the hive
  //with the queen.
  void hive() {

    PVector queen = new PVector(width/2, height/2);
    float d = PVector.dist(location, queen);

    if (d<r/2) {

      lifeSpan -= 0.2;
    }
  }


  //function that checks whether the male bee has reached his max. lifespan
  boolean dead() {


    //println(lifeSpan);
    if (lifeSpan < 0 && gender == 2) {

      //println("life span is zero, male bee dies");
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

    //draw female bee
    if (d.gender == 1) {

      pushMatrix();

      translate(location.x, location.y);
      rotate(theta);


      image(fBee, 0, 0, r*2, r*2);

      popMatrix();

      //println("displaying female bees");


      //draw male bee
    } else if (d.gender == 2) {

      pushMatrix();

      translate(location.x, location.y);
      rotate(theta);


      image(mBee, 0, 0, r*2, r*2);

      popMatrix();

      //println("displaying male bees");
    }
  }
}//end of class
