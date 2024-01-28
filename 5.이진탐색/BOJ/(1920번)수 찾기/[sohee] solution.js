const input = require('fs').readFileSync(0).toString().trim().split('\n');

const [N, A, M, mArr] = input.map((value) => value.split(' ').map((v) => Number(v)));
A.sort((a, b) => a - b);

const binarySearch = (arr, target, left, right, mid) => {
  if (right < left) {
    return 0;
  }

  mid = Math.floor((left + right) / 2);

  if (arr[mid] === target) {
    return 1;
  } else if (arr[mid] < target) {
    return binarySearch(arr, target, mid + 1, right);
  } else {
    return binarySearch(arr, target, left, mid - 1);
  }
};

const result = mArr.map((target) => binarySearch(A, target, 0, N - 1, 0));

console.log(result.join('\n'));
