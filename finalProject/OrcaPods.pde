

ArrayList<Orca> orcas = new ArrayList<Orca>();
int numberOrcas = 5;
int dorsalOrcasThatAreSad = 0;

final int DORSALORCATHRESHOLD = 7;


void setup() {

  size(1400, 800);

  for (int i = 0; i < numberOrcas; i++) {

    orcas.add(new Orca(random(330, 370), random(330, 370), 2, 2, false));
  }
}


void draw() {

  background(81, 158, 196);

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

  for (int i = 0; i < 1; i++ ) {

    if (round(random(1)) == 1) {
      orcas.add(new Orca(mouseX, mouseY, random(-10, 0), random(-10, 0), true));
    } else {
      orcas.add(new Orca(mouseX, mouseY, 100, 100, false));
    }
  }
}
