const input = require('fs')
  .readFileSync(0)
  .toString()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const [N] = input.shift();
const A = input[0].sort((a, b) => a - b);
const B = input[1].sort((a, b) => b - a);

const result = A.reduce((acc, cur, index) => {
  return acc + cur * B[index];
}, 0);

console.log(result);
