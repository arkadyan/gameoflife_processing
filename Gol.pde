class Gol {

  int cellSize = 8;
  int cols, rows;

  int[][] board;


  Gol() {
    cols = width / cellSize;
    rows = height / cellSize;

    board = boardWithRandomValues();
  }

  /**
   * Generate the next board
   */
  void generate() {
    int[][] next = new int[cols][rows];

    for (int x = 1; x < cols - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {

        // Add up all the neighbor states
        int neighbors = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j];
          }
        }
        // Subtract the current cell from the neighbors
        neighbors -= board[x][y];

        // Rules of Life
        // Loneliness
        if ((board[x][y] == 1) && (neighbors < 2)) next[x][y] = 0;
        // Overpopulation
        else if ((board[x][y] == 1) && (neighbors > 3)) next[x][y] = 0;
        // Reproduction
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        // Stasis
        else next[x][y] = board[x][y];
      }
    }

    board = next;
  }

  /**
   * Draw the board
   */
  void draw() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if (board[i][j] == 1) fill(0);
        else fill(255);
        stroke(225);
        rect(i * cellSize, j * cellSize, cellSize, cellSize);
      }
    }
  }


  private int[][] boardWithRandomValues() {
    int[][] _board = new int[cols][rows];
    for (int i = 1; i < cols - 1; i++) {
      for (int j = 1; j < rows - 1; j++) {
        _board[i][j] = int(random(2));
      }
    }
    return _board;
  }

}
