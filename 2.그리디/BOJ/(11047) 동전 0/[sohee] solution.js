const input = require('fs')
  .readFileSync(0)
  .toString()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

let [N, K] = input.shift();
let count = 0;

for (let i = N - 1; i >= 0; i--) {
  if (K >= input[i]) {
    count += Math.floor(K / input[i]);
    K %= input[i];
  }
}

console.log(count);
