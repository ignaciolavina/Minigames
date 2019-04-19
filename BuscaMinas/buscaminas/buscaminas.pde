int NUMBER_CELLS = 10;
int CELL_WIDTH; 
int NUMBER_MINES = 10;

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
