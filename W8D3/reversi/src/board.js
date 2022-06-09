// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let reversiBoard = new Array(8);

  for (let i = 0; i < reversiBoard.length; i++) {
    reversiBoard[i] = new Array(8);
  }
  reversiBoard[3][4] = new Piece("black");
  reversiBoard[4][3] = new Piece("black");
  reversiBoard[3][3] = new Piece("white");
  reversiBoard[4][4] = new Piece("white");
  return reversiBoard;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  const x = pos[0];
  const y = pos[1];

  if (x < 0 || x > 7 || y < 0 || y > 7) {
    return false;
  } else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  } else {
    return this.grid[pos[0]][pos[1]];
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if (this.grid[pos[0]][pos[1]] === undefined) {
    return false;
  }
  if (this.grid[pos[0]][pos[1]].color === color) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.grid[pos[0]][pos[1]] === undefined) {
    return false;
  } else {
    return true;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip = []){
  const nextPos = new Array(2)
  nextPos[0] = pos[0] + dir[0];
  nextPos[1] = pos[1] + dir[1];

  // piecesToFlip.push(pos);

  if (!this.isValidPos(nextPos)) {
    return [];
  }

  if (this.isValidPos(pos) === false) {
    return [];
  }

  if (!this.isOccupied(nextPos)) {
    return [];
  }
  
  if (this.grid[nextPos[0]][nextPos[1]].color === color) {
    return piecesToFlip;
  }

  if (this.isOccupied(nextPos) && this.grid[nextPos[0]][nextPos[1]].color !== color) {
    piecesToFlip.push(nextPos)
  }

  return this._positionsToFlip(nextPos, color, dir, piecesToFlip)
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (!this.isOccupied(pos)) {
    for (let i = 0; i < Board.DIRS.length; i++) {
      if (this._positionsToFlip(pos, color, Board.DIRS[i]).length > 0) {
        return true;
      }
    }
  }
  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('Invalid move!');
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);

  // for (let i = 0; i < Board.DIRS.length; i++) {
    Board.DIRS.forEach((dir) => {
    this._positionsToFlip(pos, color, dir).forEach((p) => {this.grid[p[0]][p[1]].flip()});
  }

  // for (let i = 0; i < piecesToFlip.length; i++) {
  //   const newPos = piecesToFlip[i];
  //   this.grid[newPos[0]][newPos[1]].flip;
  // }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {

};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {

};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      console.log(this.grid[i][j])
    }
  }
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE
