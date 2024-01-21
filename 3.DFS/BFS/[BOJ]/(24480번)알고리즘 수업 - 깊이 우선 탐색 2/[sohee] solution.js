const input = require('fs')
  .readFileSync(0)
  .toString()
  .trim()
  .split('\n')
  .map((v) => v.split(' ').map(Number));

const [N, M, R] = input.shift();
const graph = [...Array(N + 1)].map(() => []);
const visited = Array(N).fill(0);

input.map(([from, to]) => {
  graph[from].push(to);
  graph[to].push(from);
});

graph.map((v) => v.sort((a, b) => b - a));

let count = 1;

const DFS = (node) => {
  if (!visited[node - 1]) {
    visited[node - 1] = count;
    count += 1;
    for (let next of graph[node]) {
      DFS(next);
    }
  }
};

DFS(R);
console.log(visited.join('\n'));
