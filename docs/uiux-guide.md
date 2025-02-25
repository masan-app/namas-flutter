# 휘트니스 커뮤니티 앱 UI/UX 디자인 가이드

## 목차
1. 디자인 시스템 개요
2. TailwindCSS 색상 팔레트
3. 페이지 구현 가이드
4. 레이아웃 컴포넌트
5. 인터랙션 패턴
6. 반응형 디자인 브레이크포인트

---

## 1. 디자인 시스템 개요

**스타일:** 현대적이고 깔끔한 UI

**무드 키워드:** 녹색 계열의 신뢰감과 자연 친화적인 분위기

**참고 사례:**
- **토스:** 간결한 레이아웃과 직관적인 네비게이션
- **당근마켓:** 친근한 색상 조합과 사용자 중심 디자인

**컬러 스키마:** 보색 조합을 활용하여 주요 녹색과 보완 색상을 사용, 가독성과 명확한 시각적 계층을 강조.

---

## 2. TailwindCSS 색상 팔레트

| 색상 유형        | 색상 코드   | 설명                                       |
|-----------------|------------|------------------------------------------|
| **Primary 500** | #1f7a42    | 주요 녹색, 버튼 및 주요 인터랙션 요소에 사용       |
| **Primary 700** | #145530    | Hover 및 액티브 상태                       |
| **Secondary 500** | #ff914d  | 보완 색상으로 콜 투 액션 버튼, 하이라이트 등에 사용 |
| **Secondary 700** | #cc733d  | 보완 색상 Hover 상태                       |
| **Accent**     | #f4c542    | 포인트 강조용 색상 (배지, 알림 등)               |
| **Neutral 100**| #f9f9f9    | 배경 색상                                   |
| **Neutral 500**| #9e9e9e    | 중간 톤 텍스트 및 보조 요소                   |
| **Neutral 900**| #212121    | 주요 텍스트                                 |
| **Error**      | #e53935    | 오류 및 경고 메시지용 색상                   |
| **Success**    | #43a047    | 성공 메시지용 색상                          |

---

## 3. 페이지 구현 가이드

### 3.1 홈 페이지
- **핵심 목적:** 사용자가 최신 커뮤니티 글과 추천 모임을 쉽게 탐색할 수 있도록 함

- **주요 컴포넌트:**
  - 상단 배너 (최근 업데이트, 공지사항)
  - 최신 커뮤니티 글 리스트
  - 추천 모임 카드

- **레이아웃 구조:**
  - **그리드 시스템:** 12열 그리드 (모바일: 1열, 태블릿 이상: 2~3열)
  - 상단에 배너 → 커뮤니티 글 리스트 → 추천 모임 카드 순서

### 3.2 커뮤니티 페이지
- **핵심 목적:** 사용자들이 등산 관련 글을 작성하고 소통할 수 있도록 함

- **주요 컴포넌트:**
  - 게시글 리스트 (카드 형태)
  - 글 작성 버튼 (Floating Action Button)

- **레이아웃 구조:**
  - 리스트 형태 (모바일: 1열, 데스크탑: 2열)
  - 상단에 필터/정렬 옵션 제공

### 3.3 모임 페이지
- **핵심 목적:** 사용자가 등산 모임을 만들거나 참여할 수 있도록 함

- **주요 컴포넌트:**
  - 모임 리스트
  - 모임 상세 정보
  - 모임 생성 버튼

- **레이아웃 구조:**
  - 카드형 리스트 (모바일: 1열, 데스크탑: 2~3열)
  - 모임 상세 페이지는 주요 정보와 지도 포함

### 3.4 내 정보 페이지
- **핵심 목적:** 사용자의 프로필 정보와 활동 내역을 제공

- **주요 컴포넌트:**
  - 프로필 카드 (이미지, 이름, 소개)
  - 내 활동 리스트 (작성글, 참여한 모임)

- **레이아웃 구조:**
  - 상단에 프로필 정보
  - 하단에 활동 내역 리스트

### 3.5 로그인/회원가입 페이지
- **핵심 목적:** 사용자가 쉽게 구글 로그인/회원가입 할 수 있도록 함

- **주요 컴포넌트:**
  - 구글 로그인 버튼
  - 간단한 앱 소개

- **레이아웃 구조:**
  - 중앙 정렬된 폼
  - 큰 CTA 버튼 강조

---

## 4. 레이아웃 컴포넌트

| 컴포넌트   | 적용 경로                | 설명                                  |
|------------|-----------------------|-------------------------------------|
| **헤더**   | 전체 페이지            | 로고, 검색, 알림 아이콘 포함            |
| **하단 탭바** | 전체 페이지            | 홈, 커뮤니티, 모임, 내 정보, 설정으로 이동  |
| **사이드바** | 데스크탑 이상 해상도만 적용 | 추가 네비게이션 및 필터 옵션 제공       |

**반응형 동작:**
- **모바일:** 하단 탭바 중심의 네비게이션
- **태블릿/데스크탑:** 상단 헤더 + 사이드바 추가

---

## 5. 인터랙션 패턴

- **버튼:**
  - Primary 버튼 (#1f7a42) → Hover 시 #145530
  - Secondary 버튼 (#ff914d) → Hover 시 #cc733d

- **카드 호버:**
  - 그림자 강조 및 살짝 확대 효과

- **알림/배지:**
  - Accent 색상 (#f4c542) 사용

- **에러/성공 메시지:**
  - 에러: #e53935 배경 + 흰색 텍스트
  - 성공: #43a047 배경 + 흰색 텍스트

---

## 6. 반응형 디자인 브레이크포인트

```scss
$breakpoints: (
  'mobile': 320px,
  'tablet': 768px,
  'desktop': 1024px,
  'wide': 1440px
);
```

| 뷰포트      | 설명                                           |
|-----------|----------------------------------------------|
| **모바일**  | 320px ~ 767px, 단일 열 레이아웃, 하단 탭바 중심 네비게이션  |
| **태블릿**  | 768px ~ 1023px, 2열 레이아웃, 상단 헤더 + 하단 탭바       |
| **데스크탑**| 1024px ~ 1439px, 3열 레이아웃, 상단 헤더 + 사이드바       |
| **와이드**  | 1440px 이상, 최대 가로폭 1200px으로 고정                |

---

# 결론
휘트니스 커뮤니티 앱의 UI/UX 디자인은 현대적이면서도 직관적인 사용자 경험을 목표로 설계되었습니다. 녹색 계열의 주요 색상과 보색 조합을 통해 친환경적이면서 신뢰감을 주는 분위기를 조성하며, 토스와 당근마켓의 장점을 참고하여 사용자 친화적인 인터페이스를 구현했습니다. 반응형 디자인을 적용하여 다양한 디바이스에서도 일관된 경험을 제공합니다.

