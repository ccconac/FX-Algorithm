const input = require('fs').readFileSync(0).toString().trim().split('\n');

const N = input.shift();
const [P] = input.map((v) => v.split(' ').map(Number));

P.sort((a, b) => a - b);
let answer = 0;

for (let i = 0; i < N; i++) {
  let temp = 0;
  for (let j = 0; j <= i; j++) {
    temp += P[j];
  }
  answer += temp;
}

console.log(answer);
