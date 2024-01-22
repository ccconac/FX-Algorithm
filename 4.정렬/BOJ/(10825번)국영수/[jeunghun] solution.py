n = int(input())
scores = []

for _ in range(n):
    name, kor, eng, math = input().split()
    scores.append((int(kor), int(eng), int(math), name))

scores.sort(key=lambda x: (-x[0], x[1], -x[2], x[3]))

for i in range(n):
    print(scores[i][3])