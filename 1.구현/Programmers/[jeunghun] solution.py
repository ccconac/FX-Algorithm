def solution(survey, choices):
    scores = {'R': 0, 'T': 0, 'C': 0, 'F': 0, 'J': 0, 'M': 0, 'A': 0, 'N': 0}
    for i, choice in enumerate(choices):
        score = abs(choice - 4)

        if choice > 4:
            scores[survey[i][1]] += score
        else:
            scores[survey[i][0]] += score

    answer = ''
    indexes = ['RT', 'CF', 'JM', 'AN']
    for idx in indexes:
        if scores[idx[0]] < scores[idx[1]]:
            answer += idx[1]
        else:
            answer += idx[0]

    return answer