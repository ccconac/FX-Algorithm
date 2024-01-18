import Foundation

func solution(_ p:String) -> String {
    guard !p.isEmpty else {
        return ""
    }
    
    var s = [String]()
    var i = 0
    
    for chr in p {
        s.append(String(chr))
        i += 1
        //균형 잡힌 문자열인 경우
        if s.filter({ $0 == "(" }).count == s.filter({ $0 == ")" }).count {
            break
        }
    }
    
    let u = s.joined()
    var v = ""
    if i < p.count - 1 {
        let firstIndex = p.index(p.startIndex, offsetBy: i), lastIndex = p.index(before: p.endIndex)
        v = String(p[firstIndex...lastIndex])
    }
    
    var stack = [String]()
    for chr in u {
        if stack.isEmpty {
            stack.append(String(chr))
        } else {
            if let last = stack.last, last + String(chr) == "()" {
                stack.popLast()
            } else {
                stack.append(String(chr))
            }
        }
    }
    
    //올바른 문자열인 경우
    if stack.isEmpty {
        return u + solution(v)
    } else {
        var tmp = ""
        if u.count > 2 {
            let start = u.index(u.startIndex, offsetBy: 1)
            let end = u.index(u.startIndex, offsetBy: u.count - 2)
            
            for chr in u[start...end] {
                if String(chr) == "(" {
                    tmp += ")"
                } else if String(chr) == ")" {
                    tmp += "("
                }
            }
        }
        
        return "(" + solution(v) + ")" + tmp
    }
}

print(solution("(()())()"))
