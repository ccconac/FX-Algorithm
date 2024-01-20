const input = require('fs').readFileSync(0).toString().split('-');

let answer = input.reduce((total, item, idx) => {
  let sum = item
    .split('+')
    .map((a) => +a)
    .reduce((total, cur) => total + cur);

  return idx === 0 ? total + sum : total - sum;
}, 0);

console.log(answer);
