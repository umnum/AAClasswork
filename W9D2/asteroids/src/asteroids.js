const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');

const DEFAULTS = {
    COLOR: '#22FF22',
    RADIUS: 15,
    SPEED: 3
};

function Asteroid(pos) {
    let options = {pos: pos,
                   vel: Util.randomVec(DEFAULTS.SPEED),
                   radius: DEFAULTS.RADIUS,
                   color: DEFAULTS.COLOR
                };
    MovingObject.call(this,options) // this is like super(options)
                                    // where super refers to MovingObject's constructor
}

Util.inherits(Asteroid, MovingObject);

// define our Astroid methods
module.exports = Asteroid;