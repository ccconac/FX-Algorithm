def solution(p):
    if len(p) == 0:
        return ""
    
    s = []
    i = 0
    while True:
        s.append(p[i])
        i += 1
        if s.count('(') == s.count(')'):    # 균형잡힌 괄호일때
            break
    
    u = "".join(s)
    v = p[i:]
    stack = []
    for i in range(len(u)):
        if len(stack) == 0:
            stack.append(u[i])
        else:
            if stack[-1] + u[i] == '()':
                stack.pop()
            else:
                stack.append(u[i])
    
    # u가 올바른 괄호인 경우
    if not stack:
        return u + solution(v)
    # u가 올바른 괄호가 아닌 경우
    tmp = ''
    for i in range(1, len(u) - 1):
        if u[i] == '(':
            tmp += ')'
        elif u[i] == ')':
            tmp += '('
    return '(' + solution(v) + ')' + tmp