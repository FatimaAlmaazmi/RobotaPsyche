/**** DNA Class ****/


class DNA {



  float speed;
  float force;
  float mass;
  float gender;


  DNA() {

    //set random speeds, force, and gender for every bee that is born
    speed = random(1, 5);
    force= random(0.01, 0.4);
    gender = round(random(1, 2));
  }




  DNA getDNA() {

    DNA d = new DNA();

    return d;
  }

  //function the determines the bee's size according to gender
  float determineMass() {

    //female bees are smaller
    if (gender == 1) {

      mass = random(10, 20);

      //male bees are larger
    } else if (gender == 2) {

      mass = random(20, 30);
    }

    return mass;
  }
}
