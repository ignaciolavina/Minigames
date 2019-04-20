
import java.io.IOException;

int NUMBER_CELLS = 10;
int CELL_WIDTH; 
int NUMBER_MINES = 10;
int NUMBER_CELLS_UNEXPLORED = NUMBER_CELLS*NUMBER_CELLS;
boolean gameState = true;

Cell cells[][] = new Cell [NUMBER_CELLS][NUMBER_CELLS];



void setup (){

  size(500,500);
  fill(150);
  set_board();
  CELL_WIDTH = width/NUMBER_CELLS;
  print ("width" + width + " cell width" + CELL_WIDTH);
}


public void set_board(){
  int x = 0;
  int y = 0;
  for (int i = 0; i < NUMBER_CELLS; i++){
    for (int j = 0; j < NUMBER_CELLS; j++){
      cells [i][j] = new Cell(x , y);
      y = y +50;
      //print("\nNEW CELL: j:" + x + " y: " + y);
    }
    x = x + 50;
    y = 0;
  }
  
  setMines();
  
}

void setMines(){
  int mines_left = NUMBER_MINES;
  while (mines_left > 0){
    int x = (int) random(0, NUMBER_CELLS);
    int y = (int) random(0, NUMBER_CELLS);
    if (cells[x][y].mine){
      continue;
    }else{
      cells[x][y].mine = true;
      mines_left --;
      // Set other values of left side
      if (x > 0){
        cells[x-1][y].value ++;
        if (y > 0){
          cells[x-1][y -1].value ++;
        }
        if (y < NUMBER_CELLS -1){
          cells[x-1][y + 1].value ++;
        }
      }
      // Set mine on the right side
      if (x < NUMBER_CELLS -1){
        cells[x+1][y].value ++;
                if (y > 0){
          cells[x+1][y -1].value ++;
        }
        if (y < NUMBER_CELLS -1){
          cells[x+1][y + 1].value ++;
        }
      }
      if (y > 0){
        cells[x][y - 1].value ++;
      }
      if (y < NUMBER_CELLS - 1){
        cells[x][y + 1].value ++;
      }
    }
  }
}


void draw(){
  if (gameState){
      background(150);
      fill(255);
      stroke(0);
      
      // Draw lines
      for (int i = 0; i<= NUMBER_CELLS; i++){
         line(i * width/NUMBER_CELLS, 0, i * width/NUMBER_CELLS, height);     
      }   
      for (int i = 0; i<= NUMBER_CELLS; i++){
         line(0, i * width/NUMBER_CELLS, width, i * width/NUMBER_CELLS);
       
      }
    
      
      // Draw cells
        for (int i = 0; i < NUMBER_CELLS; i++){
        for (int j = 0; j< NUMBER_CELLS; j++){
          cells [i][j].draw();
        }
      }
       
      stroke(255);
      }
  else{
    
  }
  
}


void mousePressed(){    
  int x = mouseX/(CELL_WIDTH);
  int y = mouseY/(CELL_WIDTH);
  Cell cell = cells[x][y];
  
  if (mouseButton == LEFT){
    activate(cell, x, y);
  }
  else{
    cell.mark_flag();
  }
}

boolean activate(Cell cell, int x, int y){
  if (cell.mine){
    cell.show();
    cell.explode();
    gameOver();
  }
  if (cell.visible)
    return false;
  else{
    //println ("cell not visible");
    cell.show();
    NUMBER_CELLS_UNEXPLORED --; // TO Kknow when to win
    if (cell.value == 0){      
    // Recursion, explore all cells around
      for ( int i = x - 1; i <= x + 1; i++){
        for (int j = y -1; j <= y +1; j++){          
          try {
            activate(cells[i][j], i, j);   
          } catch (Exception e) {
            //print("Out of limits");
          } 
        }
      }
    }
    return true;
  }
}

public void gameOver(){
  textAlign(CENTER);
  textSize(50);
  fill(255);
  text("GAME OVER :(", width/2, height/2);
  gameState = false;  
}
