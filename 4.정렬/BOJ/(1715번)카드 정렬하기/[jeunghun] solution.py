import heapq

n = int(input())
data = []
result = 0

for _ in range(n):
    heapq.heappush(data, int(input()))

while len(data) > 1:
    a, b = heapq.heappop(data), heapq.heappop(data)
    result += a + b
    heapq.heappush(data, a + b)

print(result)