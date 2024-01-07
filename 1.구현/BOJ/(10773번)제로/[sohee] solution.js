const input = require('fs').readFileSync(0).toString().split('\n').map(Number);

const K = input.shift();
const stack = [];
let sum = 0;

for (let i = 0; i < K; i++) {
  if (input[i] === 0) stack.pop();
  else stack.push(input[i]);
}

for (let i = 0; i < stack.length; i++) {
  sum += stack[i];
}

console.log(sum);
