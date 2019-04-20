class Cell{
 int value = 0;
 int x;
 int y;
 PImage img;
 boolean visible = false;
 boolean mine = false;
  public Cell(int x, int y){
    this.mine = mine;
    this.x = x;
    this.y = y;
    
  }
  
  public void mark_flag(){
    img = loadImage("./img/flag.PNG");
  }
  
  public void calculate_value(){
    
  }


public void draw(){
  fill(0);
  if (visible){
    if (mine){    
    //ellipseMode(CENTER);
      ellipse(x + CELL_WIDTH/2, y + CELL_WIDTH/2, 5, 5);
    }else{
      //print("drawing");
      textAlign(CENTER);
      text(""+this.value, x+ CELL_WIDTH/2, y + CELL_WIDTH/2);
    }
  }else{
    if (img != null){
      
    }
  }
}

  public void explode(){
    img = loadImage("./img/explosion.PNG");
    image (img, x, y, CELL_WIDTH, CELL_WIDTH);
    this.draw();
  }

}
