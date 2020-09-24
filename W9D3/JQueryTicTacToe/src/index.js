const View = require("./ttt-view.js")
const Game = require("./game")

  $(() => {
    const game = new Game()
    const view = new View(game)
  });
