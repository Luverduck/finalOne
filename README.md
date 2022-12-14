<img src="./logo-ahzit.png" width="40%"/>

:information_desk_person: 아지트(Ahzit) 소개
------------------------------
#### :bulb: 개발 목적   
* 코로나 19의 확산으로 인한 언텍트 시대에 같은 취미, 같은 관심사의 사람들이 모여 함께 친목을 다질 수 있는 사이트를 개발하고자 함   

#### :moneybag: 시장 조사   
* 코로나 19와 같은 상황에서 온라인 기반의 언텍트 소비가 높은 성장세를 보였음
* 코로나 19로 언택트 문화가 시작되면서 비대면 서비스에 대한 연령별 만족도 또한 가파르게 증가하고 있는 추세   
  - 출처 1) https://www.sedaily.com/NewsView/lZHTT7IWY
  - 출처 2) https://inews.ewha.ac.kr/news/articleView.html?idxno=32451   

#### :calendar: 개발 일정   
* 기간 : 22.11.11 ~ 22.12.23 (약 6주)   

#### :computer: 개발 환경   
* Windows 10, 11
* MacOS Ventura
* Oracle 11g XE / SQL Developer 22
* HTML5 / CSS3 / JavaScript ES5 / jQuery 3 / Bootstrap 5
* STS 4.15.3 / VS Code 1.68   

:clap: Contributor
---------------
#### 엄현용 https://github.com/Luverduck
* ERD 설계 및 수정 
* 찾기 페이지 전체 조회/검색 조회 기능 구현
* 찾기 페이지 무한 스크롤 기능 구현
* 아지트 게시판 비동기 CRUD 구현 
  - 등록 및 수정에 Summer Note 에디터 적용
* 아지트 게시판 무한 스크롤 구현
* 아지트 게시판 좋아요 비동기 처리 구현
* 아지트 댓글 비동기 CRUD 구현
* 아지트 댓글 더보기 기능 구현
* 아지트 멤버 목록 및 검색 기능 구현
* 아지트 내 회원 사진 클릭시 비동기 조회를 이용한 회원 정보 Modal 구현
* 프로젝트 발표(시연)   

#### 송의중 https://github.com/sjtees
* ERD 설계 및 수정
* 회원 가입 기능 구현
  - 회원 가입 시 비동기 아이디 중복 검사 구현
  - 회원 가입 시 비밀번호 암호화 구현
  - 회원 가입 시 이메일 인증 구현
  - 카카오 계정을 이용한 회원가입 및 로그인 구현
* 마이 페이지 구현 
  - 회원 정보 수정 및 아이디, 비밀번호 찾기 구현
  - 1:1 문의 CRUD 구현
  - 내 아지트 목록 조회 구현
* 홈 화면 header의 검색창 구현
* 관리자 페이지 구현
  - 통계 차트 출력 구현(일자별 회원 가입 현황, 아지트별 관심사 현황, 회원수별로 아지트 정렬)
  - 회원관리 구현(회원 목록 및 상세보기, 관리자 생성, 양도 구현)
  - 1:1문의 관리에서 관리자 문의 CRUD 기능 및 페이지) 구현
  - 아지트 관리(전체 아지트 목록 및 상세) 구현
* 프로젝트 발표(시연)   

#### 방소정 https://github.com/soo231
* 홈 화면 내가 가입한 소모임 리스트를 최신순으로 출력
* 아지트 생성, 삭제 기능 구현
  - 아지트 생성시 라디오 버튼으로 카테고리 선택, 아지트명 및 설명 입력창에 입력 제한 글자수 표시 및 입력 제한 기능 구현
  - 아지트 생성시 지역 선택 jQuery 구현
  - 아지트 생성 페이지에서 취소 버튼 클릭시 이전 페이지로 이동
* 아지트 정보 및 프로필 사진 수정 구현
* 아지트 첨부파일 업로드, 다운로드, 삭제 기능 구현
* UI 구현
  - 헤더, 푸터
  - 홈 화면 및 찾기 페이지
    - 이미지 슬라이더 적용
    - 홈 화면 및 찾기 페이지에서 부트스트랩 card를 이용한 UI 구현
  - 소모임 페이지
    - 소모임 상세 페이지, 소모임 게시글, 일정, 첨부, 멤버 페이지
  - 로그인, 회원가입, 마이페이지, 아이디찾기, 비밀번호찾기, 비밀번호 변경, 비밀번호 변경확인   

#### 최지안 https://github.com/public1992
* 아지트 가입, 탈퇴 기능 구현
  - 가입시 닉네임 형식 검사 기능 구현
  - 가입시 비동기 닉네임 중복 검사 기능 구현
  - 가입시 회원 프로필 이미지 첨부파일 CRUD 구현
* 아지트 내 회원 정보 및 회원 프로필 사진 수정 구현
* 아지트 일정 기능 구현 (Fullcalendar API 사용)
  - 일정 등록 및 삭제 구현
  - 캘린더 내 일정이 표시되도록 구현
  - 캘린더 내 일정의 제목이 길 경우 마우스 호버 이벤트로 전체 제목이 표시되도록 툴팁 구현
  - 일정 페이지 우측에 해당 아지트에 등록된 일정 목록 표시 
* 프로젝트 발표   

#### 최승리 https://github.com/seungrii
* 공지사항 게시판 구현
  - 공지사항 게시글 CRUD 및 페이징 구현
  - 공지사항 첨부파일 CRUD 구현
  - 공지사항 상세 조회시 조회수 중복 증가 방지 구현
  - 공지사항 첨부파일
* FAQ 게시판 구현
  - FAQ CRUD 및 페이징 구현
* UI 구현
  - 메인 페이지
  - 검색 결과 페이지
  - 아지트 개설 및 수정 페이지
  - 공지사항 페이지
  - FAQ 페이지
* 발표 자료 준비
