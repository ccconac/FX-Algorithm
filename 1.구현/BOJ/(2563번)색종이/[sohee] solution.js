const input = require('fs')
  .readFileSync(0)
  .toString()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const [N] = input.shift();
const arr = new Array(100).fill().map((v) => new Array(100).fill(false));

for (let i = 0; i < input.length; i++) {
  let x = input[i][0];
  let y = input[i][1];

  for (let j = 0; j < 10; j++) {
    for (let k = 0; k < 10; k++) {
      arr[x + j][y + k] = true;
    }
  }
}

const result = arr.reduce((acc, cur) => {
  for (let el of cur) {
    if (el) acc++;
  }
  return acc;
}, 0);

console.log(result);
