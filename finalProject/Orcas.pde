
/***** Orca Class *****/


class Orca {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxForce;
  float maxSpeed;
  boolean isDorsal;
  boolean isSad;

  int r;

  PImage normalOrca;
  PImage dorsalOrca;


  /***** Constructor, Update, and Canvas Functions *****/

  Orca(float x, float y, float vx, float vy, boolean _isSad) {

    location = new PVector(x, y);
    acceleration = new PVector(0, 0);
    velocity = new PVector(vx, vy);
    maxForce = 1;
    maxSpeed = 3;

    r = 3;

    isSad = _isSad;

    normalOrca = new PImage();
    normalOrca = loadImage("normalOrca.png");
    normalOrca.resize(0, 100);

    dorsalOrca = new PImage();
    dorsalOrca = loadImage("dorsalOrca.png");
    dorsalOrca.resize(0, 100);


    if (round(random(1)) == 1) {
      isDorsal =  true;
    } else {
      isDorsal = false;
    }


    if (isSad == true) {

      println("I am sad orca and my velocity are: " + vx + " and " + vy);
    } else if (isSad == false) {

      println("I am NOT a sad orca and my velocity are: " + vx + " and " + vy);
    }

    if (isSad == true && isDorsal == true) {
      println("I am a dorsal and sad orca and my velocity are: " + vx + " and " + vy);
    }

    if (isSad == false && isDorsal == true) {
      println("I am a dorsal and NOT sad orca and my velocity are: " + vx + " and " + vy);
    }
  } // end of constructor




  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }





  void stayInCanvas() {

    int d = -50;
    PVector desired = null;

    if (location.x < d) {
      desired = new PVector(maxSpeed, velocity.y);
    } else if (location.x > width -d) {
      desired = new PVector(-maxSpeed, velocity.y);
    } 

    if (location.y < d) {
      desired = new PVector(velocity.x, maxSpeed);
    } else if (location.y > height-d) {
      desired = new PVector(velocity.x, -maxSpeed);
    } 

    if (desired != null) {
      desired.normalize();
      desired.mult(maxSpeed);
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }





  /***** Forces and Flocking Functions *****/


  private void applyForce(PVector force) {
    acceleration.add(force);
  }



  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    return steer;
  }


  PVector separate (ArrayList<Orca> orcas) {

    float desiredSeparation = 70;
    int count = 0;
    PVector sum = new PVector (0, 0);

    for (Orca podMember : orcas) {

      float d = PVector.dist(location, podMember.location);

      if ((d > 0) && (d < desiredSeparation)) {

        PVector diff = PVector.sub(location, podMember.location);
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


  PVector cohesion (ArrayList<Orca> orcas) {

    float neighbordist = 70;
    PVector sum = new PVector(0, 0);
    int count = 0;

    for (Orca podMember : orcas) {

      float d = PVector.dist(location, podMember.location);

      if ((d > 0) && (d < neighbordist)) {
        // Adding up all the others’ locations
        sum.add(podMember.location);
        count++;
      }
    }

    if (count > 0) {
      sum.div(count);

      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }



  PVector align (ArrayList<Orca> orcas) {

    float neighbordist = 140;
    PVector sum = new PVector(0, 0);
    int count = 0;

    for (Orca podMember : orcas) {
      float d = PVector.dist(location, podMember.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(podMember.velocity);

        count++;
      }
    }

    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }



  void flock(ArrayList<Orca> orcas) {
    // The three flocking rules
    PVector sep = separate(orcas);
    PVector ali = align(orcas);
    PVector coh = cohesion(orcas);

    // Arbitrary weights for these forces
    //you can change them and see what happens
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);

    // Applying all the forces
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }



  /***** helpSad and helpDorsal Functions *****/



  float distanceTo(PVector l) {
    return PVector.sub(l, location).mag();
  }


  void helpSad(ArrayList<Orca> orcas) {

    int count = 0; // to keep count of close vehicles

    PVector sum = new PVector(0, 0); // empty vector, we'll use later

    for (Orca other : orcas) {

      float d = PVector.dist(location, other.location); // vector that checks distance between us and other vehicles



      if (d == 0) { // if distance is 0, it is us, so ignore.
        continue;
      }

      if (d < 400) {
        continue;
      }

      if (other.isSad) { // if other is indeed sad do all this:
  
        sum = seek(other.location);

        count++; // increment count so now we know we have met a sad vehicle, and we know how many sad vehicles we have met
      }
    }

    if (count > 0) { // if we have met a sad vehicle


      applyForce(applyLimits(sum));
    }
  } // end of function helpSad();




  void helpDorsal(ArrayList<Orca> orcas) {

    int count = 0; 
    PVector sum = new PVector(0, 0);

    for (Orca other : orcas) {

      float d = PVector.dist(location, other.location);


      if (d == 0) {
        continue;
      }

      if (d < 400) {
        continue;
      }


      if (other.isDorsal) {
      
        sum = seek(other.location);

        count++;
      }
    }

    if (count > 0) {


      applyForce(applyLimits(sum));
    }
  } // end of helpDorsal;



  PVector applyLimits(PVector desiredVelocity) {
    
    desiredVelocity.normalize();
    desiredVelocity.mult(maxSpeed);

    PVector steerForce = PVector.sub(desiredVelocity, velocity);
    steerForce.limit(maxForce);
    return(steerForce);
  }



  /***** Display Function *****/


  void display() { //display Orcas

    float theta = velocity.heading() + radians(90);


    pushMatrix();

    translate(location.x, location.y);
    rotate(theta);


    if (isDorsal) {

      image(dorsalOrca, 0, 0);
    } else {

      image(normalOrca, 0, 0);
    }

    popMatrix();
  }


}// end of class Orca
