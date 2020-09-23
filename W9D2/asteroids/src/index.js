const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroids.js");

window.MovingObject = MovingObject;
// window.canvas = document.getElementById('asteroids-canvas');
// window.ctx = canvas.getContext('2d');

document.addEventListener("DOMContentLoaded", function () {
    // Setting up your Canvas Element
    const canvas = document.getElementById('asteroids-canvas');
    const ctx = canvas.getContext('2d');
    ctx.fillStyle = 'black';
    // ctx.fillRect(300, 140, 150, 100);

    const mo = new MovingObject({
        pos: [300, 140],
        vel: [10, 10],
        radius: 5,
        color: "#00FF00"
    });

    mo.draw(ctx);
    mo.move();

    const aster = new Asteroid([250,100]);
    aster.draw(ctx);
    // ctx.beginPath();
    // ctx.arc(100, 100, 50, 0, 2 * Math.PI);
    // ctx.closePath();
    // ctx.strokeStyle = 'black';
    // ctx.lineWidth = 5;
    // ctx.fillStyle = this.color;
    // ctx.fill();
    // ctx.stroke();
    // mo.draw(ctx);

});