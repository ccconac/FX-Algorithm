const input = require('fs').readFileSync(0).toString().trim();

const N = input.split('').map(Number);

if (!N.includes(0)) {
  console.log(-1);
}

if (N.includes(0)) {
  const sum = N.reduce((acc, cur) => acc + Number(cur), 0);

  if (sum % 3 === 0) {
    const result = N.sort((a, b) => b - a).join('');
    console.log(result);
  } else {
    console.log(-1);
  }
}
