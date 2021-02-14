/*
Fatima Almaazmi. 15th February 2021.
 
 This code uses flow fields as a path for vehicles. The main three fields that work are the perlin
 field, the line field, and the middle field. The mouse field is still not ready.
 
 Enjoy!
 */



//global variables

ArrayList<Vehicle> v;

FlowField f;



void setup() {

  size(630, 430);

  v = new ArrayList<Vehicle>();
  f = new FlowField();
}




void draw() {

  background(255);

  //f.displayField();


  //another form of a for loop, which goes through the array list better
  for (Vehicle vv : v) {
    vv.follow(f);
    vv.update();
    vv.display();
  }
}




//call-back function that works when the mouse is pressed and dragged
void mouseDragged() {

  //adds a PVector Vehicle in the arrayList
  v.add(new Vehicle(new PVector(mouseX, mouseY), 1, 0.3));
}
