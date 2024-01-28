# 이진 탐색(Binary Search)
5주차에는 **이진 탐색(Binary Search)** 알고리즘에 대해 학습합니다.

## 이진 탐색이란?
**이진 탐색(Binary Search)** 알고리즘은 데이터가 **정렬**되어 있다는 가정 하에 원하는 데이터를 아주 빠르게 탐색할 수 있는 알고리즘입니다. **이진 탐색** 알고리즘은 탐색 범위를 절반씩 좁혀가면서 데이터를 탐색한다는 특징이 있습니다.

**이진 탐색**을 구현하기 위해 위치를 나타내는 세가지 변수인 **시작점**, **끝점**, **중간점**을 사용하여 구현하게 되는데, 이때 찾으려는 데이터(target)와 **중간점(middle)** 의 데이터를 반복적으로 비교하여 데이터를 찾아내는 방법을 사용합니다.

아래의 그림과 같이 정렬되어 있는 리스트에서 데이터 `5`를 찾는 과정을 살펴 보겠습니다.

![](https://velog.velcdn.com/images/jeunghun2/post/494061c9-633a-4358-8719-4d75c05b7c92/image.jpeg)

- step 1: 정렬되어 있는 리스트의 시작점 인덱스를 `0`번, 끝점 인덱스를 `8`번, 중간점 인덱스를 `4`번 인덱스로 설정한다. (중간점 인덱스가 실수인 경우에는 소수점 이하는 버린다.)

![](https://velog.velcdn.com/images/jeunghun2/post/e3a5c07d-f5ed-4191-96d5-c55e2a4c01d1/image.jpeg)

- step 2: **중간점**과 찾고자 하는 데이터(target)을 비교하여 찾고자 하는 데이터가 더 작으므로 탐색 범위를 **시작점**부터 **중간점** - 1번까지로 줄인다.

![](https://velog.velcdn.com/images/jeunghun2/post/f89f2279-9190-41bb-9575-b552232fe283/image.jpeg)

- step 3: **중간점**과 찾고자 하는 데이터(target)을 비교하여 찾고자 하는 데이터가 더 크므로 탐색 범위를 **중간점** + 1부터 **끝점**까지로 줄인다.
- step 4: **중간점**과 찾고자 하는 데이터가 일치하므로 탐색을 중단한다.

## 이진 탐색의 시간 복잡도
**이진 탐색**의 경우 한번 확인할 때마다 데이터의 개수가 절반씩 줄어들기 때문에 **이진 탐색**의 시간 복잡도는 $O(logN)$의 시간 복잡도를 가집니다.

## 이진 탐색 구현
### 재귀를 이용한 방법
```python
def binary_search(array, target, start, end):
    if start > end:    # 데이터가 존재하지 않음
        return None
    
    mid = (start + end) // 2    # 중간점
    # 데이터를 찾은 경우 중간점 인덱스 반환
    if array[mid] == target:
        return mid
    # 찾고자 하는 데이터가 더 작다면 탐색 범위를 start ~ mid - 1까지 줄임
    elif array[mid] > target:
        return binary_search(array, target, start, mid - 1)
    # 찾고자 하는 데이터가 더 크다면 탐색 범위를 mid + 1 ~ end까지 줄임
    else:
        return binary_search(array, target, mid + 1, end)
```

### 반복문을 이용한 방법
```python
def binary_search(array, target, start, end):
    mid = (start + end) // 2  # 중간점
    
    while start <= end:
        # 데이터를 찾은 경우 중간점 인덱스 반환
        if array[mid] == target:
            return mid
        # 찾고자 하는 데이터가 더 작다면 탐색 범위를 start ~ mid - 1까지 줄임
        elif array[mid] > target:
            end =  mid - 1
        # 찾고자 하는 데이터가 더 크다면 탐색 범위를 mid + 1 ~ end까지 줄임
        else:
            start = mid + 1 
```