# 구현 (Implementation)
1주차에는 단순 **구현**에 대해 학습합니다.

## 구현이란?
코딩 테스트에서 **구현**이란 머릿속에 있는 알고리즘을 소스코드로 바꾸는 과정을 말합니다.

어떠한 문제를 풀던 간에 생각해낸 알고리즘을 소스코드로 작성하는 과정은 필수적이므로 가장 기본이 되는 유형이라고 할 수 있습니다. 

이번 주차에는 **완전탐색(Brute Force)** 과 **시뮬레이션(Simulation)** 을 통해 해당 알고리즘 **구현**을 연습합니다.

**완전탐색(Brute Force)** 은 모든 경우의 수를 주저 없이 다 계산하는 알고리즘이며, **시뮬레이션(Simulation)** 은 문제에서 제시한 상황을 차례차례 구현하는 알고리즘을 말합니다.

## 구현 문제에 접근하는 방법
단순 **구현** 문제는 복잡한 사고 능력을 요구하기 보단 문제에서 요구하는 사항을 차례차례 해결하면 되기 때문에 문제에서 제시하는 **시간 제약**과 **메모리 제약**을 준수하는 것이 중요합니다.

예를 들어 문제에서 제시하는 **시간 제한**이 1초이고 입력 데이터가 1,000,000개 일때, **Python** 기준으로 $O(NlogN)$의 **시간 복잡도**를 가지는 알고리즘으로 문제를 해결해야 합니다. 

> Python 기준 초당 20,000,000 회 연산

## Example (상하좌우)
> 말이 N X N 크기의 정사각형 위에 존재하고 가장 왼쪽 위의 좌표는 (1, 1), 가장 오른쪽 아래의 좌표는 (N, N)이라고 하자. 시작 좌표는 항상 (1, 1)이고 말이 이동할 방향이 L, R, U, D 중 하나의 문자가 반복적으로 입력으로 들어올때 말이 최종적으로 위치하는 좌표를 출력하는 프로그램을 작성하시오.
>
> - L: 왼쪽으로 한 칸 이동
> - R: 오른쪽으로 한 칸 이동
> - U: 위로 한 칸 이동
> - D: 아래로 한 칸 이동
>
> 예를 들어 R, R, R, U, D, D가 입력으로 들어오면 말의 좌표는 (1, 2), (1, 3), (1, 4), (1, 4), (2, 4), (3, 4)로 이동 하므로 최종 말의 좌표는 (3, 4)가 된다.

### 입력 조건
- 첫번재 줄에 N이 주어진다. (1 <= N <= 100)
- 두번재 줄에 말이 이동할 방향이 주어진다.

### 출력 조건
- 첫째 줄에 말의 최종 좌표 (X, Y)를 공백으로 구분하여 출력한다.

### 입력 예시
```
5
R R R U D D
```

### 출력 예시
```
3 4
```

### solution.py
```python
n = int(input())
data = input().split()
x, y = 1, 1    # 시작 위치
# 이동 방향
dx = [-1, 1, 0, 0]    # 상, 하, 좌, 우
dy = [0, 0, -1, 1]    # 상, 하, 좌, 우
move = ['U', 'D', 'L', 'R']

for d in data:
    # 이동할 좌표 계산
    nx = x + dx[move.index(d)]
    ny = y + dy[move.index(d)]

    # 범위를 벗어나면 무시
    if nx < 1 or ny < 1 or nx > n or ny > n:
        continue
    
    # 이동
    x, y = nx, ny

print(x, y)
```

### solution.java
```java
import java.util.Scanner;
import java.util.Arrays;

public class Solution {
    public static void main(String[] args) {
Scanner scanner = new Scanner(System.in);

        int n = scanner.nextInt();
        scanner.nextLine(); // 버퍼 비우기

        String[] data = scanner.nextLine().split(" ");
        int x = 1, y = 1; // 시작 위치

        // 이동 방향
        int[] dx = {-1, 1, 0, 0}; // 상, 하, 좌, 우
        int[] dy = {0, 0, -1, 1}; // 상, 하, 좌, 우
        char[] move = {'U', 'D', 'L', 'R'};

        for (String d : data) {
            // 이동할 좌표 계산
            int idx = 0;

            for (int i = 0; i < move.length; i++) {
                if (d.charAt(0) == move[i]) {
                    idx = i;
                }
            }

            int nx = x + dx[idx];
            int ny = y + dy[idx];

            // 범위를 벗어나면 무시
            if (nx < 1 || ny < 1 || nx > n || ny > n) {
                continue;
            }

            // 이동
            x = nx;
            y = ny;
        }

        System.out.println(x + " " + y);
    }
}
```