# BaseballGame

## Introduce

간단한 숫자야구 MacOS CLI App입니다.

## Directory Structure

```bash
seokhwan
├── BaseballGame
│   ├── BaseballGame.xcodeproj
│   ├── BaseballGame
│   │   ├── main.swift
│   │   ├── BaseballGame.swift
│   │   ├── BaseballGameMenuOption.swift
│   │   ├── BaseballGameStrikeBallEvaluator.swift
│   │   ├── BaseballGameText.swift
│   │   └── Int+Extensions.swift
│   └── BaseballGameTests
│       └── BaseballGameTests.swift
└── Readme.md
```

## Usage

```bash
git clone https://github.com/nbcamp-week2-team2/baseball-project.git
cd baseball-project/seokhwan/BaseballGame
open BaseballGame.xcodeproj
```

프로젝트 실행 후 Run(`⌘ + R`)

## Features

### 필수 구현기능(Lv.1 ~ Lv.2)

- [x] 1에서 9까지 임의의 수 3개를 랜덤으로 정하고 맞추는 기능
- [x] 정답을 입력했을 때, 스트라이크 및 볼 판정해서 힌트 제공
- [x] 올바르지 않은 입력값에 대해 오류 문구 출력
- [x] 정답을 맞추면 게임 종료

### 도전 구현기능(Lv.3 ~ Lv.6)

- [x] 수의 범위를 0부터 9까지로 확장(맨 앞자리가 0이되는 것은 허용하지 않음)
- [x] 프로그램을 시작할 때 안내 문구 제공
- [x] 정답을 맞춰 게임이 종료된 경우 안내 문구 다시 제공
- [x] 게임 기록(시도 횟수)을 확인하는 기능 제공
- [x] 프로그램 종료 기능 제공
- [x] 메뉴 선택 시 올바르지 않은 입력값에 대해 오류 문구 출력

### 기타사항

- [x] TIL에 트러블 슈팅 과정 기록
- [x] 코드리뷰 진행(PR #2)
- [x] 디렉터리 및 파일 분리
- [x] 네이밍 직관적이고 이해하기 쉽게 작성
- [x] 주석 활용해 코드 설명
- [x] Readme.md 작성
- [x] 2가지 이상의 예외처리 구현
- [x] 컨벤션을 준수한 커밋 10회 이상

## Trouble Shooting

- [SPM은 왜 xcodeproj 파일을 ignore할까?](https://youseokhwan.me/blog/spm-ignore-xcodeproj/)
