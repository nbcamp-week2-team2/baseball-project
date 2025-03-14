# Baseball Game

## 소개
Baseball Game은 사용자가 3자리 숫자를 맞추는 게임입니다. 각 숫자는 중복되지 않으며, 백의 자리는 0이 될 수 없습니다. 사용자는 입력한 숫자가 정답과 얼마나 일치하는지에 대한 힌트를 받으며, 이를 통해 정답을 찾아내야 합니다.

## 사용법
1. **게임 시작하기**: 메인 메뉴에서 "1. 게임 시작하기"를 선택합니다.
2. **숫자 입력**: 3자리 숫자를 입력합니다.
3. **힌트 확인**: 입력한 숫자가 정답과 얼마나 일치하는지에 대한 힌트를 받습니다.
4. **게임 기록 보기**: 메인 메뉴에서 "2. 게임 기록 보기"를 선택하여 이전 게임 기록을 확인합니다.


## 코드 구조
  - `startProgram()`: 메인 메뉴를 실행합니다.
  - `startBaseballGame()`: 게임을 시작하고 사용자 입력을 처리합니다.
  - `makeAnswer()`: 3자리 난수를 생성합니다.
  - `validation()`: 입력값이 제약조건을 충족하는지 확인합니다.
  - `compare()`: 입력값과 정답을 비교하여 힌트를 제공합니다.
  - `printAttemptRecord()`: 게임 기록을 출력합니다.

## Trouble Shooting
- readLine()으로 입력 받을 때 EOF(End Of File) 예외처리
- - readLine() 메서드는 표준 입력에서만 데이터를 읽기 때문에 EOF 신호에 대해서는 추가 대응이 필요합니다.

- for문 사용시 `indices` 를 사용하여 배열에 크기가 달라져도 유연하게 대응
- https://developer.apple.com/documentation/swift/string/indices-swift.property 

