class DNA {

  float speed;
  float force;
  float mass;
  float gender;





  DNA() {

    speed = random(1, 5);
  //  mass = random(10, 30);
    force= random(0.01, 0.4);
  }




  DNA getDNA() {

    DNA d = new DNA();

    return d;
  }

  float determineGender() {

    gender = random(1, 2);

    return gender;
  }

  float determineMass() {

    if (gender == 1) {

      mass = random(10, 20);
    } else if (gender == 2) {

      mass = random(30, 35);
    }
    
    return mass;
  }
}
