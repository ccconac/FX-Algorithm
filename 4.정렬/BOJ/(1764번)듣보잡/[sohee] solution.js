const input = require('fs').readFileSync(0).toString().trim().split('\n');

const [N, M] = input[0].split(' ');
const nArr = [];
const mArr = [];

const map = new Map();
const result = [];

for (let i = 1; i <= N; i++) nArr.push(input[i]);
for (let i = nArr.length + 1; i < input.length; i++) mArr.push(input[i]);

nArr.forEach((el) => {
  map.set(el);
});

mArr.forEach((el) => {
  if (map.has(el)) result.push(el);
});

result.sort();

console.log(`${result.length}\n${result.join('\n')}`);
