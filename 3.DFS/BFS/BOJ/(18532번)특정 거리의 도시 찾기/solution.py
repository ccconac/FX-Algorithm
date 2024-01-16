from collections import deque
import sys

n, m, k, x = map(int, input().split())
graph = [[] for _ in range(n + 1)]
minimum_distance = [0 for _ in range(n + 1)]
visited = [False] * (n + 1)

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    graph[a].append(b)

q = deque([x])
visited[x] = True
while q:
    v = q.popleft()

    for i in graph[v]:
        if not visited[i]:
            visited[i] = True
            q.append(i)
            minimum_distance[i] = minimum_distance[v] + 1

if k not in minimum_distance:
    print(-1)
else:
    for i in range(n + 1):
        if minimum_distance[i] == k:
            print(i)