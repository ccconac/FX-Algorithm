const input = require('fs').readFileSync(0).toString().trim().split('\n');

const [N, nCard, M, mCard] = input.map((value) => value.split(' ').map((v) => Number(v)));
const answer = [];

nCard.sort((a, b) => a - b);

const binarySearchLeft = (arr, target, start, end) => {
  while (start < end) {
    const mid = Math.floor((start + end) / 2);
    if (arr[mid] < target) {
      start = mid + 1;
    } else {
      end = mid;
    }
  }

  return start;
};

const binarySearchRight = (arr, target, start, end) => {
  while (start < end) {
    const mid = Math.floor((start + end) / 2);
    if (arr[mid] <= target) {
      start = mid + 1;
    } else {
      end = mid;
    }
  }

  return start;
};

mCard.forEach((num) => {
  const left = binarySearchLeft(nCard, num, 0, N);
  const right = binarySearchRight(nCard, num, 0, N);

  answer.push(right - left);
});

console.log(answer.join(' '));
