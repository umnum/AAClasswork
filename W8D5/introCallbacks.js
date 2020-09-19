// Timing is Everything

class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime
    // 4. Schedule the tick at 1 second intervals.
    const date = new Date();
    // this.date = date
    //this.hour = date.getHours();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    setInterval(this._tick.bind(this), 1000);
    // setInterval(this._tick, 1000)

  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let dateNow = `${this.hours}:${this.minutes}:${this.seconds}`;
    //dateNow = {let hh = this.getHours(),
               //let mm = this.getMinutes(),
               //let ss = this.getSeconds()
              //}
    console.log(dateNow)
  }

  _tick() {
    //00:00:00
    // 1. Increment the time by one second.
    // 2. Call printTime.
      // debugger
      this.printTime();
      // console.log("hit");  
      this.seconds += 1; 
      this.minutes += Math.floor(this.seconds / 60);
      this.hours += Math.floor(this.minutes / 60);
      this.seconds %= 60;
      this.minutes %= 60;
      this.hours %= 24;

  }
}

// const clock = new Clock();
//___________________________
// addNumbers

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsleft, completionCallback){

  if (numsleft > 0) {
    reader.question("Give me number: ", function (num){
      const number = parseInt(num)
    addNumbers(sum + number, numsleft - 1, completionCallback);
  })}
  else {
    completionCallback(sum);
    reader.close();
  }
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

//-------------------------------
// absurdBubbleSort


// askIfGreaterThan(el1, el2, callback)

// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// });

function absurdBubbleSort(arr, sortCompletionCallback) {
    let sorted = false;
    while (!sorted) {
      sorted = true
      for (let i = 0; i < arr.length; i++) {
         if (arr[i] > arr[i + 1]){
           let temp = arr[i];
           arr[i] = arr[i + 1];
           arr[i + 1] = temp;
           sorted = false 
         }
      }
    }
}
let arr = [1, 5, 3, 7, 2];
absurdBubbleSort(arr)
console.log(arr)
