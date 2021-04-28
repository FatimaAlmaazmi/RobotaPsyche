/*
Fatima Almaazmi. 3rd May 2021. Final Project.

This code uses the concept of association to help orcas living in the ocean identify sad orcas among them.
They would also have to make the association for orcas with dorsal fins.

To add new orcas, click on the screen!

---------------------------------------------------------------------------------------------------------------
This code aims to show the sense of community that orcas possess, and how they thrive more as a group than they
do alone. I hope that through this simple code, people will begin to understand the affects of captivity on
these animals.

Orcas in captivity are always suffering mentally and physically. They are placed in small tanks that do not offer
half of the distance that they travel everyday. As a result, most captive orcas have dorsal fins, this is due to 
their risricted and circular movements in tanks. 

Even though dorsal fins are not a direct association to sad orcas, I believe that this is only another proof of 
their suffering in captivity.

Thank you!
*/




ArrayList<Orca> orcas = new ArrayList<Orca>();
int numberOrcas = 5;

PImage ocean;


void setup() {

  size(1400, 800);

  ocean = new PImage();
  ocean = loadImage("ocean.jpg");

//creates pod
  for (int i = 0; i < numberOrcas; i++) {

    orcas.add(new Orca(random(330, 370), random(330, 370), 2, 2, false));
  }
}


void draw() {

  imageMode(CENTER);
  image(ocean, width/2, height/2);

  for (Orca o : orcas) {

    o.update();

    o.flock(orcas);

    o.helpSad(orcas);

    o.helpDorsal(orcas);

    o.stayInCanvas();

    o.display();
  }
}





void mouseClicked () {

  //creates new orcas
  for (int i = 0; i < 1; i++ ) {

    if (round(random(1)) == 1) {
      orcas.add(new Orca(mouseX, mouseY, random(-10, 0), random(-10, 0), true));
    } else {
      orcas.add(new Orca(mouseX, mouseY, 100, 100, false));
    }
  }
}
