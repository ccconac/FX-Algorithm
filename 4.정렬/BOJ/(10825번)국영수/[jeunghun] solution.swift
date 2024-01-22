let n = Int(readLine()!)!
var scores = [(kor: Int, eng: Int, math: Int, name: String)]()

for _ in 0..<n {
    let data = readLine()!.split(separator: " ")
    scores.append((Int(data[1])!, Int(data[2])!, Int(data[3])!, String(data[0])))
}

let sortedScores = scores.sorted {
    if $0.kor != $1.kor {
        return $0.kor > $1.kor
    } else {
        if $0.eng != $1.eng {
            return $0.eng < $1.eng
        } else {
            if $0.math != $1.math {
                return $0.math > $1.math
            } else {
                return $0.name < $1.name
            }
        }
    }
}

for i in 0..<n {
    print(sortedScores[i].3)
}
