const input = require('fs').readFileSync(0).toString().split('\n');

const N = input.shift();
const arr = input[0].split(' ').map(Number);

const set = Array.from(new Set([...arr].sort((a, b) => a - b)));
const obj = {};
const result = [];

set.forEach((v, i) => (obj[v] = i));

for (let i = 0; i < N; i++) {
  result.push(obj[arr[i]]);
}

console.log(result.join(' '));
