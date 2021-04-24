
//not sure if this class is necessary


class DNA {
  
  
  
  float speed;
  float force;
  float fin;
  float feeling;
  Orca o;
  
  DNA() {
    
    fin = round(random(1, 2));
    feeling = round(random(1, 2));
    
    
    
  }
  
  DNA getDNA() {
    DNA d = new DNA();
    
    return d;
    
  }
  
}
