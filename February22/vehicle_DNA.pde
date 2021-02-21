class DNA {

  float speed;
  float force;
  float mass;
  color vColor;


  DNA() {
   
    speed = random(1, 5);
    force= random(0.01, 0.4);
    mass = random(1, 3);
    vColor = color(random(170, 247), random(170, 247), random(170, 247));
    
  }
}
