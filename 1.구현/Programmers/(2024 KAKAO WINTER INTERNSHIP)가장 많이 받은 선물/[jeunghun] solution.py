def solution(friends, gifts):
    gift_cnt = [0 for _ in range(len(friends))]    # 받게될 선물의 수
    result = [[0 if i != j else None for j in range(len(friends))] for i in range(len(friends))]    # 선물 결과
    for gift in gifts:
        sender, receiver = gift.split()
        i, j = friends.index(sender), friends.index(receiver)
        result[i][j] += 1

    gift_index = []    # 선물 지수
    for i in range(len(friends)):
        send, receive = 0, 0
        for cnt in result[i]:
            if cnt is not None:
                send += cnt
        
        for cnt in list(zip(*result))[i]:
            if cnt is not None:
                receive += cnt

        gift_index.append(send - receive)

    for i in range(len(friends)):
        for j in range(len(friends)):
            if result[i][j] is None:
                continue

            # 선물을 더 많이 보낸 사람이 다음달에 선물 받음
            if result[i][j] > result[j][i]:
                gift_cnt[i] += 1
            elif result[i][j] < result[j][i]:
                gift_cnt[j] += 1
            else:
                # 선물을 주고 받은 수가 같거나 없는 경우 경우
                # 선물 지수가 더 높은 사람이 다음달에 선물 받음
                if gift_index[i] > gift_index[j]:
                    gift_cnt[i] += 1
                elif gift_index[i] < gift_index[j]:
                    gift_cnt[j] += 1

    answer = max(gift_cnt)
    return answer // 2

solution(["muzi", "ryan", "frodo", "neo"], ["muzi frodo", "muzi frodo", "ryan muzi", "ryan muzi", "ryan muzi", "frodo muzi", "frodo ryan", "neo muzi"])