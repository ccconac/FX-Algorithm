import heapq

def solution(food_times, k):
    if sum(food_times) <= k:
        return -1
    
    length = len(food_times)
    arr = []    # 우선순위 큐를 저장하기 한한 리스트
    for i in range(n):
        heapq.heappush(arr, (food_times[i], i + 1))
    
    previous = 0    # 이전 음식을 먹는데 걸린 시간
    sum_times = 0    # 총 걸린 시간
    while sum_times + (arr[0][0] - previous) * length <= k:
        target = heapq.heappop(arr)[0]    # 가장 시간이 적게 걸리는 것부터 처리
        sum_times += (target - previous) * length
        length -= 1
        previous = target

    arr = sorted(arr, key=lambda x: x[1])
    return arr[(k - sum_times) % length][1]