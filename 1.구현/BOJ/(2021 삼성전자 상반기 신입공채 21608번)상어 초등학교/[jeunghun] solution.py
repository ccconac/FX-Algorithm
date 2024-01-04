def rule1(p):
    result = []
    target = 0
    for r in range(n):
        for c in range(n):
            if pos[r][c] != 0:    # 비어 있는 자리에 대해서 확인
                continue

            cnt = 0
            for i in range(4):    # 인접한 칸에 대해서
                nr = r + dr[i]
                nc = c + dc[i]
                if nr < 0 or nc < 0 or nr >= n or nc >= n:
                    continue

                if pos[nr][nc] in like[p]:    # 인접한 칸에 좋아하는 친구가 있으면
                    cnt += 1

            if cnt > target:
                target = cnt
                result = [(r, c)]
            elif cnt == target:
                result.append((r, c))

    return result

def rule2(arr):
    result = []
    target = 0
    for r, c in arr:
        if pos[r][c] != 0:    # 비어 있는 자리에 대해서 확인
            continue

        cnt = 0
        for i in range(4):  # 인접한 칸에 대해서
            nr = r + dr[i]
            nc = c + dc[i]
            if nr < 0 or nc < 0 or nr >= n or nc >= n:
                continue

            if pos[nr][nc] == 0:    # 인접한 자리가 빈 자리인 경우
                cnt += 1

        if cnt > target:
            target = cnt
            result = [(r, c)]
        elif cnt == target:
            result.append((r, c))

    return result

n = int(input())
like = {}
sequence = []
pos = [[0 for _ in range(n)] for _ in range(n)]

for _ in range(n ** 2):
    students = list(map(int, input().split()))
    like[students[0]] = students[1:]
    sequence.append(students[0])

dr = [-1, 1, 0, 0]
dc = [0, 0, -1, 1]

for seq in sequence:
    rule1_result = rule1(seq)

    if len(rule1_result) == 1:
        pos[rule1_result[0][0]][rule1_result[0][1]] = seq
    else:
        rule2_result = sorted(rule2(rule1_result), key=lambda x: (x[0], x[1]))
        pos[rule2_result[0][0]][rule2_result[0][1]] = seq

satisfaction = 0
for r in range(n):
    for c in range(n):
        count = 0
        for i in range(4):
            nr = r + dr[i]
            nc = c + dc[i]

            if nr < 0 or nc < 0 or nr >= n or nc >= n:
                continue

            if pos[nr][nc] in like[pos[r][c]]:
                count += 1

        if count in (0, 1):
            satisfaction += count
        else:
            satisfaction += 10 ** (count - 1)

print(satisfaction)