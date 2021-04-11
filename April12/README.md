## AvoidRedVehicles Assignment


I had to implement the avoidRedVehciles() function in the association program, so that the vehicles would avoid all red vehicles.

At first, I was a bit confused as to where to start with this assignment. However, after going over the avoidAgressiveVehicles() function and the separate() function, I understood what I had to do. 

By implementing aspects of the separate() function, and the avoidAgressiveVehciles() function, and just tweaking it a bit to work for redVehicles instead of any or agressive vehicles. I got it to work!!

Here is the block of code of my avoidRedVehicles() function:


void avoidRedVehicles(ArrayList<Vehicle> vehicles) {

    PVector sum = new PVector(); // empty vector, we'll use later

    int count = 0; // to keep count of close vehicles


    for (Vehicle other : vehicles) {

      float d = PVector.dist(location, other.location); // vector that checks distance between us and other vehicles

      if (d == 0) { // if distance is 0, it is us, so ignore.

        continue;
      }


      if (d > tooClose) {// vehicle and other are far away from each other, so ignore.

        continue;
      }

      boolean otherIsRed = other.isRed; // to make sure other is red.

      if (otherIsRed) { // if other is indeed red do all this:

        PVector diff = PVector.sub(location, other.location); // get the difference distance between them,
        diff.normalize(); //normalize it,
        diff.div(d); // divide it by d, because then the closer it is the stronger the desire to flee

        sum.add(diff); // add this diiferance and put it in our empty vector
        count++; // increment count so now we know we have met a red vehicle, and we know how many red vehicles we have met
      }
    }

    if (count > 0) { // if we have met a red vehicle

      sum.div(count); // hmm? this makes it our desired velocity
      sum.normalize(); // normalize our desired velocity
      sum.mult(maxspeed); // mult by the max speed, because we want to flee from red vehicles as fast as we can


      //applying steering formula
      PVector steer = PVector.sub(sum, velocity);  

      steer.limit(maxforce);

      applyForce(applyLimits(sum));
    }
  }
  
  
  Thank you :)
