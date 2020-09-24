class View {
  constructor(game, $el) {
    this.game = game
    this.setupBoard()
    this.bindEvents()
  }

  bindEvents() {
    // console.log(this)
    let $board = $("ul")
    let currentGame = this.game
    console.log(currentGame)
    // console.log(`GAME: ${this.game}`)
    $board.on("click", function(event){
      
      let $cell = $(event.target)
      if (!$cell.is("li")) {return}
      console.log(`this is: ${this}`)
      console.log(event.target)
      // console.log(event.target.parent())
      let rowIdx = $cell.parent().attr("id")
      let colIdx = $cell.attr("id")
      try {
        currentGame.playMove([rowIdx, colIdx])
        $cell.text(`${currentGame.currentPlayer}`)
        $cell.attr("id",`${currentGame.currentPlayer}`)
      }
      catch(err) {
        // debugger
        alert(err.msg)
      }

      console.log(currentGame.currentPlayer)
      if (currentGame.isOver()){
        $board.off()
        // alert("IS OVER")
          if (currentGame.winner()) {
            let $gameOver = $("<marquee></marquee>")
            $gameOver.text(`WINNER is ${currentGame.winner() === 'o' ? 'x' : 'o'}`)
          $board.after($gameOver)
        } else {
          let $draw = $("<marquee></marquee>")
          $draw.text(`THERE IS NO WINNER`)
          $board.after($draw)
        }
    }
    })
  }
  // placeMark(pos, mark) {
  //   if (!this.isEmptyPos(pos)) {
  //     throw new MoveError('Is not an empty position!');
  //   }   
  makeMove($square) {}

  setupBoard() {
    console.log("setup board method")
    let $container = $(".ttt");
    let $board = $("<ul></ul>")
    $container.append($board)
    for(let i = 0; i < 3; i++){
      let $row = $("<div></div>")
      $row.addClass("row")
      //$row.add(`id="${i}"`)
      $row.attr("id",i)
      $board.append($row)
    }
    
      let $div = $("div")
      $div.each((idx, row) => {
        let $row = $(row)
        for (let i = 0; i < 3; i++) {
          let $li = $("<li></li>");
          $li.addClass("cell");
          $li.attr("id", i)
          $row.append($li);
        }
    })
  }
}


module.exports = View;
