let n = Int(readLine()!)
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }
var (add, sub, mul, div) = (input[0], input[1], input[2], input[3])
var maxValue = -9999999999, minValue = 9999999999

func dfs(_ i: Int, _ now: Int) {
    if i == n {
        maxValue = max(maxValue, now)
        minValue = min(minValue, now)
    } else {
        if add > 0 {
            add -= 1
            dfs(i + 1, now + numbers[i])
            add += 1
        }
        
        if sub > 0 {
            sub -= 1
            dfs(i + 1, now - numbers[i])
            sub += 1
        }
        
        if mul > 0 {
            mul -= 1
            dfs(i + 1, now * numbers[i])
            mul += 1
        }
        
        if div > 0 {
            div -= 1
            dfs(i + 1, now / numbers[i])
            div += 1
        }
    }
}

dfs(1, numbers[0])

print(maxValue)
print(minValue)