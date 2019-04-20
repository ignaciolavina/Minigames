enum Status { HIDE, VISIBLE, FLAG, EXPLODED};

class Cell{
 int value = 0;
 int x;
 int y;
 PImage img;
 boolean visible = false;
 boolean mine = false;
 Status status = Status.HIDE;
 
 
  public Cell(int x, int y){
    this.mine = mine;
    this.x = x;
    this.y = y;    
  }
  
  public void mark_flag(){
    if (status == status.HIDE){  
      img = loadImage("./img/flag.PNG");
      status = Status.FLAG;      
    }
  }
  
  public void show(){
    this.visible = true;
    this.status = Status.VISIBLE;
  }


public void draw(){
  fill(0);
  switch (status){
   case FLAG:   
    img = loadImage("./img/flag.PNG");
    image (img, x, y, CELL_WIDTH, CELL_WIDTH);
     print("flagged status");
   break;
   
   case EXPLODED:
    img = loadImage("./img/explosion.PNG");
    image (img, x, y, CELL_WIDTH, CELL_WIDTH);
   break;
   
    
    
  }
  if (visible){
    if (mine){    
    //ellipseMode(CENTER);
      ellipse(x + CELL_WIDTH/2, y + CELL_WIDTH/2, 5, 5);
    }else{
      //print("drawing");
      textAlign(CENTER);
      text(""+this.value, x+ CELL_WIDTH/2, y + CELL_WIDTH/2);
    }
  }
  
}

  public void explode(){
    img = loadImage("./img/explosion.PNG");
    image (img, x, y, CELL_WIDTH, CELL_WIDTH);
    this.draw();
  }

}
