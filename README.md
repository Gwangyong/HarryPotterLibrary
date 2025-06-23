# HarryPotterLibrary 📚

해리포터 시리즈의 각 권 정보를 시리즈별로 확인할 수 있는 iOS 앱입니다.  
책 제목, 저자, 출간일, 요약, 목차 등을 볼 수 있으며, 시리즈 간 이동 및 상태 유지 기능도 지원합니다.

---

## 🛠 기술 스택

- **Swift**
- **UIKit + SnapKit**
- **MVC 패턴**
- **UserDefaults** (상태 저장용)
- **JSON** (로컬 데이터 파싱)
- **iOS 16.0 이상 지원**

---

## 🍏 주요 기능

### ✅ Level 1: 기본 뷰 구성
- `data.json` 파싱하여 데이터 로딩
- 책 제목 커스텀 뷰(BookTitleView) 생성
- 시리즈 버튼 UI(BookTopTabView) 구현

### ✅ Level 2: 책 정보 UI
- 책 표지, 제목, 저자, 출간일, 페이지 수 UI 구성(BookInfoView)
- SnapKit으로 레이아웃 설정 및 비율 지정
- JSON 날짜 포맷 가공

### ✅ Level 3: 헌정사 및 요약
- 헌정사(BookDedicationView), 요약(BookSummaryView) 뷰 구현
- 시리즈 버튼 최종 마무리

### ✅ Level 4: ScrollView 및 목차 구성
- `scrollView` → `contentView` -> `stackView` 구조 구성
- 책 제목/시리즈 버튼 고정, 나머지 스크롤 가능
- 목차(BookChaptersView) 뷰 동적 생성
- 공통 섹션 제목 상수화(BookSectionTitle)

### ✅ Level 5: 요약 더보기/접기
- 450자 이상일 경우만 더보기 버튼 노출
- 버튼 클릭 시 상태 토글 및 텍스트 변경
- 상태는 `UserDefaults`에 저장

### ✅ Level 6~7: 시리즈 버튼 및 상태 저장 복원
- 시리즈 버튼 1~7 생성 및 클릭 시 해당 책 정보 표시
- 각 시리즈별 요약 뷰 상태 저장/복원
- `JSON` 파싱 실패 및 `UserDefaults` 누락 시 예외 처리
- 다양한 기기(iPhone SE2, 16 Pro Max) 및 방향(Portrait/Landscape) 대응
- 회전 시 레이아웃 무너짐 없고, 콘솔에 `AutoLayout` 경고 없음

---

## 🎥 시연 GIF & Image

<table>
  <tr>
    <td align="center">
      <strong>아이폰 16 Pro Max 시연</strong><br>
      <img src="https://github.com/user-attachments/assets/c0bfa008-0b07-44c2-9fc8-f2fb6620053a" width="300"/>
    </td>
    <td align="center">
      <strong>아이폰 SE2 시연</strong><br>
      <img src="https://github.com/user-attachments/assets/aace96e5-2887-4f9e-bdc1-3e9c2dc01d17" width="300"/>
    </td>
  </tr>
</table>

---

<table>
  <tr>
    <td align="center">
      <strong>JSON 파싱 실패</strong><br>
      <img src="https://github.com/user-attachments/assets/16f7ab5a-9ac4-4b62-b313-41b7ab0edc30" width="300"/>
    </td>
    <td align="center">
      <strong>파일 누락</strong><br>
      <img src="https://github.com/user-attachments/assets/bd9d986e-05c7-42f8-b530-99aacd1cb70c" width="300"/>
    </td>
  </tr>
</table>

---

## 📁 프로젝트 구조

```swift
HarryPotterLibrary/
├── Controller/
│   ├── BookDetailViewController.swift       // VC 본체 (데이터 로딩, configure 호출)
│   └── BookDetailViewController+Alert.swift // Alert

├── Model/
│   ├── Book.swift                            // Codable 모델 구조
│   └── BookLeader.swift                      // JSON 데이터 파싱 로직

├── Resources/
│   ├── Assets.xcassets
│   ├── data.json                             // JSON 데이터
│   └── Info.plist

├── View/
│   ├── BookDetailView.swift                  // 전체 View 컨테이너 (scrollView + contentView + stackView)
│   ├── BookTitleView.swift                   // 책 제목
│   ├── BookTopTabView.swift                  // 시리즈 탭 (1~7)
│   ├── BookInfoView.swift                    // 책 표지, 저자, 출간일, 페이지 수
│   ├── BookDedicationView.swift              // 헌정사
│   ├── BookSummaryView.swift                 // 요약 + 더보기/접기
│   ├── BookChaptersView.swift                // 목차
│   └── BookSectionTitle.swift                // 공통 섹션 타이틀 (Dedication, Summary, Chapters)

├── AppDelegate.swift
├── SceneDelegate.swift
└── SnapKit                                   // SnapKit 사용
```