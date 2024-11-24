//especificar el tablero

int pixelsize = 8;
int cols = 10*pixelsize;
int rows = 10*pixelsize;
int[][] board = new int[cols][rows];

void randomIC(){
  int r = 0;
  for (int i = 0; i < cols; i++) {
  for (int j = 0; j < rows; j++){
      r = int(random(0,11));
      if (r <= 5){
      board[i][j] = 1;
      }else{
      board[i][j] = 0;
      }
    }
  }
}

{
randomIC();
}

//dibujar el tablero

void setup(){
  size(640,640); //size(pixelsize*cols, pixelsize*rows))
  frameRate(50);
}

//dibujar la pantalla 

void draw(){
  background(0); // 0 = negro
  //compute next board
  int[][] nextboard = new int[cols][rows];
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++){
        nextboard[i][j] = evolve(i,j);
    }
  }
  drawBoard();
  board = nextboard;
}


//funcion vecinos
int neighbors(int i, int j){ //Esta aplicando mal las reglas del juego 
  int neighborcount = 0;
     for(int x = -1; x <= 1; x++){
     for(int y = -1; y<= 1; y++){
        neighborcount += board[i+x][j+y]; 
        }
      }
    neighborcount = neighborcount - board[i][j];
    return (neighborcount);
}

//funcion evolucionar
int evolve(int i, int j){
  int result = 0;
  //Reglas del juego de la vida MODIFICADO
  
  if (board[i][j] == 1){
    if (neighbors(i,j) == 2 || neighbors(i,j) == 3 ){ 
      result = 1;
    }else{
      result = 0;
    }
  }else{
    if (neighbors(i,j) == 3){ 
    result = 1;
    }else{
      result = 0;
    }
  }
    return (result);
}

//dibujar el tablero actualizado 

void drawBoard(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++){
        if (board[i][j] == 1){
          fill(255,0,0); //color de celda viva
        }if (board[i][j] == 0){
        fill(0,0,0); //color de celda muerta
        }
        rect(i*pixelsize,j*pixelsize,pixelsize,pixelsize);
        
    }
  }
}

//Interaccion con el usuario

void keyPressed(){
  randomIC();
}

void mousePressed(){
  delay(3000);
}

//contar pixeles despues de n iteraciones y asinar puntos

//mostrar ganador 
