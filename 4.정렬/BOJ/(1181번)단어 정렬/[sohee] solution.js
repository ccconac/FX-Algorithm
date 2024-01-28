const input = require('fs').readFileSync(0).toString().trim().split('\n');

const N = input.shift();

const sortArr = input.sort((a, b) => {
  if (a.length !== b.length) return a.length - b.length;
  return a.localeCompare(b);
});

const result = new Set(sortArr);

console.log(Array.from(result).join('\n'));
