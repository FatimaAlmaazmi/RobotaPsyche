/*
Fatima Almaazmi. 22nd February 2021.
 
 This code uses a set of behaviors on vehicles and creates each vehicle with
 a unique DNA.
 
 Enjoy!
 */



//global variables

ArrayList<Vehicle> v;

FlowField f;

//PVector mouse = new PVector(mouseX, mouseY);

void setup() {

  size(630, 430);

  v = new ArrayList<Vehicle>();
  f = new FlowField();
}




void draw() {

  background(255);

  //f.displayField();

f.mouseField();
  //another form of a for loop, which goes through the array list better
  for (Vehicle vv : v) {
    vv.follow(f);
    vv.update();
    vv.display();
    //vv.separate(v);
    //vv.seek(mouse);
    vv.applyBehaviors(v);
  }
}




//call-back function that works when the mouse is pressed and dragged
void mouseDragged() {

  //adds a PVector Vehicle in the arrayList
  v.add(new Vehicle(new PVector(mouseX, mouseY), 2, 0.3));
}
