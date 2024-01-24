def solution(N, stages):
    reached, not_clear = [0 for _ in range(N + 1)], [0 for _ in range(N + 1)]

    for stage in stages:
        if stage == N + 1:
            for i in range(1, stage):
                reached[i] += 1
        else:
            for i in range(1, stage + 1):
                reached[i] += 1

            not_clear[stage] += 1

    failure_rate = [(not_clear[i] / reached[i], i) if reached[i] != 0 else (0, i) for i in range(1, N + 1)]
    failure_rate.sort(key=lambda x: x[0], reverse=True)
    answer = [failure_rate[i][1] for i in range(len(failure_rate))]

    return answer

print(solution(4, [4,4,4,4,4]))