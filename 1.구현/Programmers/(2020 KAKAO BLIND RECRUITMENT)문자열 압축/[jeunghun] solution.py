from collections import deque

def solution(s):
    answer = 999999999
    for n in range(1, len(s) + 1):
        q, result = deque(), ''

        for i in range(0, len(s), n):
            sub = s[i: i + n]

            if len(q) == 0 or q[0] == sub:
                q.append(sub)
            else:
                if len(q) == 1:
                    result += q.popleft()
                else:
                    result += str(len(q)) + q.popleft()

                q = deque([sub])
        
        if len(q) == 1:
            result += q.popleft()
        elif len(q) > 1:
            result += str(len(q)) + q.popleft()

        if len(result) < answer:
            answer = len(result)

    return answer

s = input()
print(solution(s))