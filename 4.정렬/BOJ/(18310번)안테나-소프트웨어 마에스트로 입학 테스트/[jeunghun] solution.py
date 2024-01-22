n = int(input())
houses = sorted(list(map(int, input().split())))

print(houses[(n - 1) // 2])    # median(중간값)