/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroids.js":
/*!**************************!*\
  !*** ./src/asteroids.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nconst DEFAULTS = {\n    COLOR: '#22FF22',\n    RADIUS: 15,\n    SPEED: 3\n};\n\nfunction Asteroid(pos) {\n    let options = {pos: pos,\n                   vel: Util.randomVec(DEFAULTS.SPEED),\n                   radius: DEFAULTS.RADIUS,\n                   color: DEFAULTS.COLOR\n                };\n    MovingObject.call(this,options) // this is like super(options)\n                                    // where super refers to MovingObject's constructor\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\n// define our Astroid methods\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroids.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroids.js */ \"./src/asteroids.js\");\n\nwindow.MovingObject = MovingObject;\n// window.canvas = document.getElementById('asteroids-canvas');\n// window.ctx = canvas.getContext('2d');\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n    // Setting up your Canvas Element\n    const canvas = document.getElementById('asteroids-canvas');\n    const ctx = canvas.getContext('2d');\n    ctx.fillStyle = 'black';\n    // ctx.fillRect(300, 140, 150, 100);\n\n    const mo = new MovingObject({\n        pos: [300, 140],\n        vel: [10, 10],\n        radius: 5,\n        color: \"#00FF00\"\n    });\n\n    mo.draw(ctx);\n    mo.move();\n\n    const aster = new Asteroid([250,100]);\n    aster.draw(ctx);\n    // ctx.beginPath();\n    // ctx.arc(100, 100, 50, 0, 2 * Math.PI);\n    // ctx.closePath();\n    // ctx.strokeStyle = 'black';\n    // ctx.lineWidth = 5;\n    // ctx.fillStyle = this.color;\n    // ctx.fill();\n    // ctx.stroke();\n    // mo.draw(ctx);\n\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n    MovingObject.prototype.draw = function (ctx) {\n        //ctx.fillStyle = 'red';\n        //ctx.fillRect(300, 140, 150, 100);\n        // Draw a Circle\n        ctx.beginPath();\n        ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);\n        ctx.closePath();\n        ctx.strokeStyle = 'black';\n        ctx.lineWidth = 5;\n        ctx.fillStyle = this.color;\n        ctx.fill();\n        ctx.stroke();\n        \n    }\n    \n    MovingObject.prototype.move = function () {\n        this.pos[0] += this.vel[0];\n        this.pos[1] += this.vel[1];\n    }\n// MovingObject.prototype.isCollidedWith(otherMovingObject) = function () {}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("//function Util() { }\n\n//Util.inherits = function (childClass, parentClass) { \n        //Util.prototype = parentClass.prototype;\n\n//}\n\nconst Util = { \n    inherits(childClass, parentClass) {\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });