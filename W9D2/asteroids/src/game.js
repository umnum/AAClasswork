

const DEFAULTS = {
    DIM_X: 500,
    DIM_Y: 400, 
    NUM_ASTEROIDS: 5

};

Game.prototype.addAsteroids = function () {
    // NUM_ASTEROID times: new Asteroid
}

Game.prototype.randomPosition = function () {
    // for loop: NUM_ASTEROIDS times: randomize pos
    // pos[i]: [(0..500), (0..400)]
    // random function: Math.random
    // turn a float to integer: Math.floor(floatVariable)

}

Game.prototype.draw = function (ctx) {
    // clearRect(ctx)
    // NUM_ASTEROID times: asteroid[i].draw(ctx)
}

Game.prototype.moveObjects = function () {
    // NUM_ASTEROID times: asteroid[i].move(ctx)
}