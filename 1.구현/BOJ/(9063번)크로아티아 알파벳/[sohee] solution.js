let input = require('fs').readFileSync(0).toString().trim();

let croatia = ['c=', 'c-', 'dz=', 'd-', 'lj', 'nj', 's=', 'z='];

for (let c of croatia) {
  input = input.split(c).join('c');
}

console.log(input.length);
