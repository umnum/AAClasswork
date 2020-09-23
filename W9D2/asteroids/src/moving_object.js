function MovingObject(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}
    MovingObject.prototype.draw = function (ctx) {
        //ctx.fillStyle = 'red';
        //ctx.fillRect(300, 140, 150, 100);
        // Draw a Circle
        ctx.beginPath();
        ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
        ctx.closePath();
        ctx.strokeStyle = 'black';
        ctx.lineWidth = 5;
        ctx.fillStyle = this.color;
        ctx.fill();
        ctx.stroke();
        
    }
    
    MovingObject.prototype.move = function () {
        this.pos[0] += this.vel[0];
        this.pos[1] += this.vel[1];
    }
// MovingObject.prototype.isCollidedWith(otherMovingObject) = function () {}

module.exports = MovingObject;