# 휘트니스 커뮤니티 앱 정보 구조서 (IA)

## 목차
1. 사이트 맵
2. 사용자 흐름
3. 내비게이션 구조
4. 페이지 계층 구조
5. 콘텐츠 구성
6. 상호작용 패턴
7. URL 구조
8. 컴포넌트 계층 구조

---

## 1. 사이트 맵

```
홈
├── 커뮤니티
│   ├── 게시판 목록
│   └── 게시글 상세
├── 모임
│   ├── 모임 목록
│   └── 모임 상세
├── 내 정보
│   ├── 프로필
│   └── 내 활동 내역
├── 로그인/회원가입
└── 설정
    └── 알림 설정
```

---

## 2. 사용자 흐름

### 비회원 사용자 흐름
1. 앱 접속 → 홈 화면
2. 커뮤니티/모임 열람 (읽기 전용)
3. 로그인/회원가입 유도 (글 작성 시도 시)

### 회원 사용자 흐름
1. 앱 접속 → 홈 화면 (로그인 상태 유지)
2. 커뮤니티 게시글 열람 및 작성
3. 모임 생성 및 참여
4. 내 정보 확인 및 수정
5. 설정에서 알림 및 계정 정보 관리

---

## 3. 내비게이션 구조

**하단 탭 내비게이션** (손가락과 가까운 위치에 배치하여 접근성 강화)

| 메뉴 항목    | 설명                                  |
|-------------|-------------------------------------|
| 홈          | 메인 피드로 이동                      |
| 커뮤니티    | 게시판 목록으로 이동                   |
| 모임        | 모임 모집 및 참여 페이지로 이동        |
| 내 정보     | 사용자 프로필 및 활동 내역 확인        |
| 설정        | 앱 설정 및 알림 관리                   |

- 하단 탭은 사용자가 손쉽게 접근할 수 있도록 앱 하단에 고정.
- 주요 기능에 빠르게 접근 가능하도록 설계.

---

## 4. 페이지 계층 구조

1. **홈**
   - 최신 커뮤니티 글
   - 추천 모임

2. **커뮤니티**
   - 게시판 목록
   - 게시글 작성/열람/댓글

3. **모임**
   - 모임 목록
   - 모임 생성/참여

4. **내 정보**
   - 프로필 정보
   - 내 게시글/모임 내역

5. **설정**
   - 알림 설정
   - 계정 관리

6. **로그인/회원가입**
   - 구글 로그인/회원가입

---

## 5. 콘텐츠 구성

| 페이지       | 주요 콘텐츠                          |
|-------------|-----------------------------------|
| 홈          | 최신 게시글, 추천 모임, 인기 해시태그 |
| 커뮤니티    | 게시판 목록, 게시글, 댓글             |
| 모임        | 모임 리스트, 모임 세부 정보, 참여 버튼 |
| 내 정보     | 프로필 사진, 사용자 정보, 내 활동 내역 |
| 설정        | 알림 설정, 계정 관리                 |

---

## 6. 상호작용 패턴

1. **하단 탭 내비게이션**
   - 하단 고정형 탭으로 사용자가 어디서든 주요 메뉴에 접근 가능

2. **게시글 및 모임 작성**
   - 비회원이 시도할 경우 로그인/회원가입 팝업 노출

3. **댓글 및 좋아요**
   - 실시간으로 반영되며, 알림으로 피드백 제공

4. **알림**
   - 모임 일정, 새로운 댓글 및 좋아요에 대한 푸시 알림

---

## 7. URL 구조

| 페이지            | URL 패턴                         |
|-----------------|----------------------------------|
| 홈              | `/`                              |
| 커뮤니티 목록      | `/community`                    |
| 게시글 상세        | `/community/:postId`            |
| 모임 목록         | `/groups`                        |
| 모임 상세         | `/groups/:groupId`              |
| 내 정보          | `/profile`                       |
| 설정             | `/settings`                      |
| 로그인/회원가입    | `/auth`                          |

---

## 8. 컴포넌트 계층 구조

### 공통 컴포넌트
- **하단 탭바**: 홈, 커뮤니티, 모임, 내 정보, 설정 링크
- **푸터**: 앱 정보, 이용약관, 개인정보처리방침

### 페이지별 주요 컴포넌트

1. **홈 페이지**
   - 게시글 리스트 컴포넌트
   - 추천 모임 카드

2. **커뮤니티 페이지**
   - 게시글 카드 리스트
   - 게시글 작성 폼
   - 댓글 섹션

3. **모임 페이지**
   - 모임 리스트
   - 모임 상세 정보
   - 모임 참여 버튼

4. **프로필 페이지**
   - 사용자 정보 카드
   - 내 활동 리스트

5. **설정 페이지**
   - 알림 설정 토글
   - 로그아웃 버튼

---

# 결론
휘트니스 커뮤니티 앱의 정보 구조는 사용자의 편의성과 접근성을 최우선으로 고려하여 설계되었습니다. 하단 탭 내비게이션을 통해 주요 기능에 손쉽게 접근할 수 있으며, 비회원도 콘텐츠 열람이 가능하지만 참여 기능을 위해 회원가입을 유도하는 구조입니다. 페이지와 콘텐츠는 직관적으로 구성되어 있으며, 사용자 경험을 극대화하기 위해 간단한 상호작용 패턴을 도입했습니다.

