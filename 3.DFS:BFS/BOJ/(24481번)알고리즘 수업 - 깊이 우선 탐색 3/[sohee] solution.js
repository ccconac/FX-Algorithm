const input = require('fs')
  .readFileSync(0)
  .toString()
  .trim()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const [N, M, R] = input.shift();
const graph = [...Array(N + 1)].map(() => []);
const visited = Array(N).fill(-1);

input.map(([from, to]) => {
  graph[from].push(to);
  graph[to].push(from);
});

graph.map((v) => v.sort((a, b) => a - b));

let count = 0;

const DFS = (node, depth) => {
  if (visited[node - 1] === -1) {
    visited[node - 1] = depth;
    for (let next of graph[node]) {
      DFS(next, depth + 1);
    }
  }
};

DFS(R, count);
console.log(visited.join('\n'));
