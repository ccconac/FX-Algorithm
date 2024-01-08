import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var scores: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    
    for (i, choice) in choices.enumerated() {
        let score: Int = abs(choice - 4)
        
        if choices[i] < 4 {
            scores[survey[i].first!]? += score
        } else {
            scores[survey[i].last!]? += score
        }
    }
    
    var answer: String = ""
    let indicators: [String] = ["RT", "CF", "JM", "AN"]
    
    for indicator in indicators {
        let firstChar: Character = indicator.first!
        let lastChar: Character = indicator.last!
        
        if let firstScore = scores[firstChar], let lastScore = scores[lastChar] {
            if firstScore < lastScore {
                answer += String(lastChar)
            } else {
                answer += String(firstChar)
            }
        }
    }
    
    return answer
}