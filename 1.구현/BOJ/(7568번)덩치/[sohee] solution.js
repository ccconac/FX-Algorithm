const input = require('fs')
  .readFileSync(0)
  .toString()
  .trim()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const N = input.shift();
const rank = [];

for (let i = 0; i < N; i++) {
  let count = 0;
  for (let j = 0; j < N; j++) {
    if (i !== j) {
      if (input[i][0] < input[j][0] && input[i][1] < input[j][1]) {
        count++;
      }
    }
  }
  rank.push(count + 1);
}

console.log(rank.join(' '));
