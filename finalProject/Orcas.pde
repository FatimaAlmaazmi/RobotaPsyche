class Orca {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxForce;
  float maxSpeed;
  boolean isDorsal;
boolean isSad;

  //for triangles, remove when u add drawings
  int r;

  //how close are we to other orcas
  final float close = 100;

  PImage normalOrca;
  PImage dorsalOrca;

  float dorsal;
  float sad;

  /***** Constructor, Update, and Canvas Functions *****/

  Orca(float x, float y, float vx, float vy, float issad, float isdorsal) {

    location = new PVector(x, y);

    acceleration = new PVector(0, 0);
    velocity = new PVector(vx, vy);
    maxForce = 1;
    maxSpeed = 3;

    r=3;

    normalOrca = new PImage();
    normalOrca = loadImage("normalOrca.png");
    // normalOrca.resize(0, 50);

    dorsalOrca = new PImage();
    dorsalOrca = loadImage("dorsalOrca.png");
    //  dorsalOrca.resize(0, 50);

  
  if(round(random(1)) == 1) {
    isDorsal = true;
  } else {
    isDorsal = false;
  }
  
   
  if(round(random(1)) == 1) {
    isSad = true;
  } else {
    isSad = false;
  }
  
  //if(isSad == true){
  //  vx = -10;
  //  vy = -10;
  //}
  
  println(vx);
  println(vy);
    
  } // end of constructor



  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }





  void stayInCanvas() {
    //triangle 25, -130
    int d = 1;
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


  // how to use this?
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);

    return steer;
  }


  PVector separate (ArrayList<Orca> orcas) {
    //triangle 20, orca 30
    float desiredSeparation = 20;
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
    //triangle 20, orca 30
    float neighbordist = 20;
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

    //use 50 for triangles, 60 orca
    float neighbordist = 50;
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
    // (Try different ones!)

    //triangle: 
    //sep.mult(1.5);
    //ali.mult(1.0);
    //coh.mult(1.0);

    //orca:
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(-1.0);

    // Applying all the forces
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }





  /***** Chances Functions *****/




  private boolean getIsDorsal() {
    return (isDorsal);
  }


  private  boolean getIsSad() {
    float chance = random(100);

    if (isDorsal) {
      // If I am sad, the threshold for sadness is 20 (i.e. 80% are sad)
      return (chance > 20);
    } else {
      // otherwise, the threshold is 80 (i.e. only 20% are sad)
      return(chance > 80);
    }
    
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

      if (d <= 150) {
        continue;
      }


      boolean otherIsSad = other.getIsSad(); // to make sure other is sad.

      if (otherIsSad) { // if other is indeed sad do all this:

        //println("sad orca found");

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

      if (d <= 150) {
        continue;
      }

      boolean otherIsDorsal = other.isDorsal;

      if (otherIsDorsal) {

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


  //void display() { //display Orcas

  //  float theta = velocity.heading() + radians(90);


  //  pushMatrix();

  //  translate(location.x, location.y);
  //  rotate(theta);


  //  if (isDorsal) {

  //    image(dorsalOrca, 0, 0);
  //  } else {

  //    image(normalOrca, 0, 0);
  //  }

  //  popMatrix();
  //}

  void display() { //display triangles

    // Vehicle is a triangle pointing in
    // the direction of velocity; since it is drawn
    // pointing up, we rotate it an additional 90 degrees.
    float theta = velocity.heading() + PI/2;

    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);



    if (isDorsal) {
      fill(255, 0, 0);
    } else {
      fill(175);
    }
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);

    popMatrix();
  }
}// end of class Orca
