from collections import deque

n, k = map(int, input().split())
board = []
viruses = []

for i in range(n):
    data = list(map(int, input().split()))

    for j in range(n):
        if data[j] != 0:
            viruses.append((data[j], i, j, 0))

    board.append(data)

s, x, y = map(int, input().split())
di = [-1, 1, 0, 0]
dj = [0, 0, -1, 1]
q = deque(sorted(viruses, key=lambda x : x[0]))

while q:
    v, i, j, t = q.popleft()

    for k in range(4):
        ni = i + di[k]
        nj = j + dj[k]

        if ni < 0 or nj < 0 or ni >= n or nj >= n or t == s:
            continue

        if board[ni][nj] == 0:
            board[ni][nj] = v
            q.append((v, ni, nj, t + 1))

print(board[x - 1][y - 1])