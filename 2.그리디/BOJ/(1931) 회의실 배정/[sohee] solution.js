const input = require('fs')
  .readFileSync(0)
  .toString()
  .trim()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const N = input.shift();

const lectureRoom = input.sort((a, b) => {
  if (a[1] !== b[1]) return a[1] - b[1];
  else return a[0] - b[0];
});

let end = lectureRoom[0][1];
let count = 1;

for (let i = 1; i < N; i++) {
  if (end <= lectureRoom[i][0]) {
    end = lectureRoom[i][1];
    count += 1;
  }
}

console.log(count);
