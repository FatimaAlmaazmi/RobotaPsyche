
/*
Fatima Almaazmi. April 5th, 2021.
 
 Static code of vector projection.
 */




PVector p1;
PVector p2;
PVector p3;

PVector V;
PVector VM;


void setup() {

  size(400, 400);


  p1 = new PVector (50, 100);
  p2 = new PVector (50, 300);
  p3 = new PVector (300, 200);

  V = PVector.sub(p1, p3);


  PVector B = PVector.sub(p1, p2);
  B.normalize();
  VM = B.mult(V.dot(B));


  // draw the thing
  ellipse(p1.x, p1.y, 10, 10);
  ellipse(p2.x, p2.y, 10, 10);
  ellipse(p3.x, p3.y, 10, 10);

  stroke(224, 54, 54); // V is the red line
  line(p1.x, p1.y, V.x, V.y);

  stroke(104, 54, 224); // VM is the purple line
  line(p1.x, p1.y, VM.x, VM.y);
}
