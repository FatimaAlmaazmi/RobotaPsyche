/*
Fatima Almaazmi. 22nd February 2021.
 
 This code uses a set of behaviors on vehicles and creates each vehicle with
 a unique DNA.
 
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



  for (int i = 0; i< 10; i++) {

    b.add(new Bee(new PVector(random(width), random(width))));
  }
}




void draw() {
  imageMode(CENTER);
  background(255);
  image(hive, width/2, height/2, 100, 100);

  //f.displayField();

  //f.mouseField();

  //another form of a for loop, which goes through the array list better
  for (Bee bb : b) {


    //vv.follow(f);
    bb.update();
    bb.display();
    //vv.separate(v);
    //vv.seek(mouse);
    bb.applyBehaviors(b);
  }

  for (int i = b.size()-1; i>=0; i--) {

    Bee bb = b.get(i);

    bb.hive();

    if (bb.dead()) {
      b.remove(bb);
      for (int j=0; j<random(2, 3); j++) {
        b.add(new Bee(bb.location));
        println("adding a bee");
      }
      println("killing a bee");
    }
  }
}// end of draw
