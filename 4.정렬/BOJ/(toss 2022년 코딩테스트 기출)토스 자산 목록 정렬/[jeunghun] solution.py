# https://toss.im/career/article/next-developer-2023-sample-questions
# 토스의 자산관리팀 김토스는 토스 창립 월인 13년도 4월부터 현재인 22년도 8월 까지 등록된 자산을 자산번호에 따라 오름차순으로 정렬하고 싶어 합니다.
# 토스의 자산번호 규칙은 반드시 아래의 9자리 문자열 순서로 구성되어 있으며,
# [등록 연도 2자리]-[취급 자산 코드][등록 월 2자리][등록 순서 번호 2자리]
# 1. 등록 연도 > 2. 취급 자산 코드 > 3. 등록 월 > 4. 등록 순서 번호 순서대로 정렬 우선순위를 가지고 있습니다.

def solution(assets):
    assets = list(set(assets))
    filtered_assets = []

    for asset in assets:
        if checkValidate(asset):
            filtered_assets.append(asset)

    return sorted(sorted(sorted(filtered_assets, key=lambda x: (x[7:], x[5:7])), key=lambda x: ['SP', 'KE', 'MO', 'CO', 'DE'].index(x[3:5])), key=lambda x: x[:2])


def checkValidate(asset_code):
    if len(asset_code) != 9:
        return False

    year, code, month, number = int(asset_code[:2]), asset_code[3:5], int(asset_code[5:7]), int(asset_code[7:])

    # 등록 연도 유효성 검사
    if year not in range(13, 23):
        return False

    # 취급 자산 코드 유효성 검사
    if code not in ['SP', 'KE', 'MO', 'CO', 'DE']:
        return False

    # 등록 월 유효성 검사
    if year == 13:
        if month not in range(4, 13):
            return False
    elif year in range(14, 22):
        if month not in range(1, 13):
            return False
    elif year == 22:
        if month not in range(1, 9):
            return False

    # 등록 순서 번호 유효성 검사
    if number not in range(1, 100):
        return False

    return True
