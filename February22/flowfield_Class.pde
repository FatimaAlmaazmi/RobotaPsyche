/**** Flow Field Class ****/


class FlowField {

  //global variables
  PVector [][] field;
  int cols;
  int rows;
  int resolution;


  FlowField() {

    resolution = 10;

    rows = height/resolution;
    cols = width/resolution;

    field = new PVector [cols][rows];

    mouseField();
    //  lineField();
   
    //middleField();
  }


/*** LOOKUP FUNCTION ***/


  //lookUp function that returns the PVector's location in the grid
  PVector lookUp (PVector lookUp) {

    int column = int(constrain(lookUp.x/resolution, 0, cols-1));
    int row = int(constrain(lookUp.y/resolution, 0, rows-1));

    return field [column][row].copy();
  }



/*** FIELD FUNCTIONS ***/


  //flow field created using perlin noise
  void perlinField() {

    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {

        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);

        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }


  //arrows point to one point at the top of the screen
  void lineField() {

    //float xoff = 0;
    for (int i =0; i<cols; i++) {
      //float yoff = 0;
      for (int j=0; j<rows; j++) {

        float x = i*resolution;
        float y = j*resolution;

        PVector v = new PVector(width/2-x, -y);
        v.normalize();

        field[i][j] =v;
        //yoff += 0.1;
      }
      //xoff += 0.1;
    }
  }


  //attempt to make a flow field that follows th mouse

  void mouseField() {

    for (int i =0; i<cols; i++) {
      for (int j=0; j<rows; j++) {

        PVector mouse = new PVector (mouseX, mouseY);
        PVector currentLocation = new PVector (i*resolution, j*resolution);
        
        PVector followMouse = PVector.sub(mouse, currentLocation);
        followMouse.normalize();

        field[i][j] = followMouse;
      }
    }
  }


  //arrows point to one point in the middle of the screen
  void middleField() {

    for (int i =0; i<cols; i++) {
      for (int j=0; j<rows; j++) {

        float x = i*resolution;
        float y = j*resolution;

        PVector v = new PVector(width/2-x, height/2-y);
        v.normalize();

        field[i][j] =v;
      }
    }
  }

  //fucntion to display field
  void displayField() {

    for (int i=0; i< cols; i++) {
      for (int j=0; j< rows; j++) {

        pushMatrix();

        translate(i*resolution + resolution/2, j*resolution + resolution/2);

        PVector f = field[i][j].copy();

        f.mult(resolution);

        line(0, 0, f.x, f.y);
        fill(137);
        ellipse(f.x, f.y, 5, 5);

        popMatrix();
      }
    }
  }
} //end of class
