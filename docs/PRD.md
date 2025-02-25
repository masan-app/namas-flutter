# 휘트니스 커뮤니티 앱 PRD

## 목차
1. 상세 제품 설명
2. 참고 서비스 및 상세 근거
3. 핵심 기능 및 사양
4. 추가 제안 기능
5. 사용자 페르소나 및 시나리오
6. 기술 스택 추천

---

## 1. 상세 제품 설명
휘트니스 커뮤니티 앱은 산악 활동을 즐기는 사용자들을 위한 커뮤니티 플랫폼입니다. 초기 MVP에서는 등산을 중심으로 한 커뮤니티 기능과 모임 모집 기능을 제공합니다. 사용자는 앱을 통해 산행 정보를 공유하고, 함께 산을 오를 파트너를 모집할 수 있습니다.

**주요 목표:**
- 등산을 중심으로 한 커뮤니티 활성화
- 사용자 간 소통을 통한 건강한 모임 문화 조성

**핵심 가치:**
- 산악 애호가들을 위한 소셜 허브
- 간편한 모임 생성 및 참여

---

## 2. 참고 서비스 및 상세 근거

| 서비스명 | 특징 | 도입 이유 |
|-----------|------|-----------|
| **Instagram** | 사진 중심 커뮤니티, 해시태그 활용 | 등산 후기를 사진과 함께 공유할 수 있도록 영감을 제공 |
| **Meetup** | 모임 생성 및 참여 기능 | 모임 모집 기능을 설계할 때 참고, 사용자 친화적인 인터페이스 |
| **Strava** | 피트니스 기록 공유 및 커뮤니티 | 등산 기록을 공유하는 추가 기능 구상에 참고 |

**상세 근거:**
- **Instagram**의 이미지 기반 커뮤니티는 등산 후기를 공유하는 데 적합한 형식입니다.
- **Meetup**의 모임 생성 및 참가 프로세스는 사용자가 손쉽게 등산 모임을 생성하고 참여할 수 있는 UX를 설계하는 데 도움이 됩니다.
- **Strava**처럼 향후 등산 경로 기록 및 공유 기능을 추가할 가능성을 고려해 벤치마킹할 수 있습니다.

---

## 3. 핵심 기능 및 사양

### 필수 기능

1. **구글 회원가입/로그인**
   - 구글 계정을 통한 간편 회원가입/로그인
   - OAuth 2.0 프로토콜 사용

2. **커뮤니티 기능**
   - 게시글 작성, 수정, 삭제
   - 댓글 작성 및 좋아요 기능
   - 사진 업로드 및 해시태그 지원

3. **모임 모집 기능**
   - 커뮤니티 내에서 모임 게시글 작성 가능
   - 모임 일정, 장소, 인원 설정
   - 참가 신청 및 인원 관리 기능

### UI/UX 고려 사항
- 직관적인 네비게이션 바
- 게시판 및 모임 섹션 구분
- 사용자 친화적인 입력 폼

---

## 4. 추가 제안 기능

1. **등산 기록 공유 기능**
   - 등산 루트 및 소요 시간 기록
   - 지도 연동으로 경로 표시

2. **알림 기능**
   - 모임 일정 리마인더
   - 새로운 댓글 및 좋아요 알림

3. **랭킹 시스템**
   - 사용자별 활동 점수 집계
   - 등산 횟수 및 난이도에 따른 뱃지 지급

4. **안전 기능**
   - 긴급 상황 시 알림 기능 (긴급 연락처 연동)

---

## 5. 사용자 페르소나 및 시나리오

### 사용자 페르소나

1. **20대 대학생 - 김지훈**
   - 목표: 주말에 새로운 사람들과 산행
   - 앱 사용 시나리오: 커뮤니티 게시글 탐색 → 모임 모집 글 확인 → 참여 신청

2. **30대 직장인 - 박민지**
   - 목표: 건강 관리를 위한 정기 산행
   - 앱 사용 시나리오: 직접 모임 생성 → 참가자 모집 → 일정 관리

3. **60대 시니어 - 이순자**
   - 목표: 등산을 통한 건강 유지 및 커뮤니티 활동
   - 앱 사용 시나리오: 커뮤니티에 산행 후기 작성 → 사진 공유 → 모임 참여

---

## 6. 기술 스택 추천

| 구성 요소 | 기술 스택 |
|------------|------------|
| **프론트엔드** | Flutter (iOS 및 Android 동시 개발) |
| **백엔드** | Spring Framework (REST API) |
| **인증** | 구글 OAuth 2.0 |
| **데이터베이스** | 관계형 DB (예: PostgreSQL) |
| **호스팅** | AWS, GCP 등 클라우드 서비스 |

**기술 스택 선정 이유:**
- **Flutter**를 통해 안드로이드와 iOS 앱을 효율적으로 개발 가능
- **Spring Framework**는 확장성과 안정성이 뛰어나며, RESTful API 구현에 적합
- **구글 OAuth**로 간편하고 안전한 인증 시스템 구축

---

# 결론
휘트니스 커뮤니티 앱은 산악 활동을 중심으로 한 커뮤니티와 모임 기능을 통해 사용자 간 소통을 촉진하고, 건강한 등산 문화를 확산하는 것을 목표로 합니다. MVP 단계에서는 간단한 커뮤니티 및 모임 기능에 집중하며, 향후 사용자 피드백에 따라 기능을 확장할 계획입니다.

