/*
Fatima Almaazmi. 1st March 2021.
 
 This code mimics the evolution of bees.
 
 Enjoy!
 */



//global variables

ArrayList<Bee> b;

FlowField f;

PImage hive;

//PVector mouse = new PVector(mouseX, mouseY);

void setup() {

  size(630, 430);

  b = new ArrayList<Bee>();
  f = new FlowField();

  hive = new PImage();
  hive = loadImage("hive.png");


  //start with two bees to check whether your code works or not.
  for (int i = 0; i< 2; i++) {

    b.add(new Bee(new PVector(random(width), random(width))));
  }
}




void draw() {
  imageMode(CENTER);
  background(255);
  image(hive, width/2, height/2, 200, 200);

  //f.displayField();
  //f.mouseField();


  for (Bee bb : b) {


    bb.update();
    bb.display();
    bb.applyBehaviors(b);
  }

  for (int i = b.size()-1; i>=0; i--) {

    Bee bb = b.get(i);

    bb.hive();

    if (bb.dead() && bb.gender == 2 ) {
      b.remove(bb);
      //println("killing a male bee");
      for (int j=0; j<round(random(2, 3)); j++) {
        b.add(new Bee(bb.location));
        //println("adding a bee");
      }
    }
  }
}// end of draw
