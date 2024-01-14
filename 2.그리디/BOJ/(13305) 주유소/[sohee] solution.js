const input = require('fs').readFileSync(0).toString().trim().split('\n');

const N = Number(input.shift());
const distance = input[0].split(' ').map(BigInt);
const price = input[1].split(' ').map(BigInt);

let cost = 0n;
let currPrice = price[0];

for (let i = 0; i < N - 1; i++) {
  cost += currPrice * distance[i];
  if (currPrice > price[i + 1]) {
    currPrice = price[i + 1];
  }
}

console.log(String(cost));
