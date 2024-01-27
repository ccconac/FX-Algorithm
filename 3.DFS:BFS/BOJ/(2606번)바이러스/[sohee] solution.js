const input = require('fs').readFileSync(0).toString().trim().split('\n');

const N = Number(input.shift());
const computers = input.map((v) => v.split(' ').map(Number));

let answer = 0;

let visited = Array(N + 1).fill(false);
let graph = [...Array(N + 1)].map(() => []);

computers.map(([from, to]) => {
  graph[from].push(to);
  graph[to].push(from);
});

const DFS = (start) => {
  let stack = [start];
  visited[start] = true;

  while (stack.length !== 0) {
    let node = stack.pop();

    for (let nextNode of graph[node]) {
      if (!visited[nextNode]) {
        visited[nextNode] = true;
        answer++;
        stack.push(nextNode);
      }
    }
  }
};

DFS(1);
console.log(answer);
