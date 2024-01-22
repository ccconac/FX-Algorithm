let n = Int(readLine()!)!
let houses = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

print(houses[(n - 1) / 2])    // median(중간값)