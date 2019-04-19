class Cell{
 int value = 0;
 int x;
 int y;
 boolean mine = false;
  public Cell(int x, int y){
    this.mine = mine;
    this.x = x;
    this.y = y;
    
    //print("x: " + x + " y:" + y);
  }
  
  public void calculate_value(){
    
  }


public void draw(){
  fill(0);
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
