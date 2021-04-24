

ArrayList<Orca> orcas = new ArrayList<Orca>();
int numberOrcas = 10;
int dorsalOrcasThatAreSad = 0;

final int DORSALORCATHRESHOLD = 7;


void setup() {

  size(700, 700);

  for (int i = 0; i < numberOrcas; i++) {

    orcas.add(new Orca(random(330, 370), random(330, 370), 2, 2, 2, round(random(1, 2))));
  }
}


void draw() {

  background(81, 158, 196);

  for (Orca o : orcas) {

    o.update();

    o.flock(orcas);

    o.helpSad(orcas);


    if (dorsalOrcasThatAreSad > DORSALORCATHRESHOLD) {

      o.helpDorsal(orcas);
    }


    o.stayInCanvas();
    
    o.display();
    
  }
}





void mouseClicked () {

  for (int i = 0; i < 1; i++ ) {

    orcas.add(new Orca(mouseX, mouseY, round(random(-10, 2)),round(random(-10, 2)), round(random(1, 2)), round(random(1, 2))));
  }
}
