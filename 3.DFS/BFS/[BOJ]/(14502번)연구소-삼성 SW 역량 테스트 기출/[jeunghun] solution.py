from itertools import combinations
from collections import deque
import copy

n, m = map(int, input().split())
lab = []    # 연구소
empties = []    # 빈 공간
result = 0
dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]

for i in range(n):
    data = list(map(int, input().split()))
    lab.append(data)
    for j in range(m):
        if data[j] == 0:
            empties.append((i, j))

candidates = combinations(empties, 3)

for candidate in candidates:
    board = copy.deepcopy(lab)
    for i in range(len(candidate)):
        board[candidate[i][0]][candidate[i][1]] = 1

    for i in range(n):
        for j in range(m):
            if board[i][j] == 2:
                q = deque([(i, j)])
                while q:
                    y, x = q.popleft()

                    for k in range(4):
                        nx = x + dx[k]
                        ny = y + dy[k]
                        if nx < 0 or ny < 0 or nx >= m or ny >= n:
                            continue

                        if board[ny][nx] == 0:
                            board[ny][nx] = 2
                            q.append((ny, nx))

    tmp = 0
    for i in range(n):
        tmp += board[i].count(0)

    if tmp > result:
        result = tmp

print(result)