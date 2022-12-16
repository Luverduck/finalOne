<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 앨범" name="title"/>
</jsp:include>

<style>
	body {
		background-color: rgba(230, 230, 230, 100);
	}
</style>

<!-- jquery CDN -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 풀캘린더 -->
 <link href='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/main.min.css' rel='stylesheet' />
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/index.global.min.js"></script>
<!-- 풀캘린더 언어 cdn -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.0/locales-all.min.js'></script>


<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3" style="background-color: green;">
					<h1>왼쪽 사이드바</h1> 
				
					<br>
					
					<div class = "row">
						<%-- 아지트 정보 --%>
						아지트 이름 : ${ahzitVO.getAhzitName()} <br>
						아지트 소개 : ${ahzitVO.getAhzitInfo()}<br>
						아지트 멤버 : ${ahzitVO.getAhzitHead()} 명<br>
						아지트 종류 : ${ahzitVO.getAhzitSort()}<br>
						아지트 리더 : ${ahzitVO.getAhzitLeader()}<br>
						
		            	<%-- 아지트 가입 버튼 --%>
			            <c:choose>
						<c:when test="${ahzitMemberDto.getMemberId() == null}"><%-- 소모임 회원이 아니면 --%>
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert'">아지트 가입</button>
						</c:when>
						<c:otherwise>
						<button type="button"  disabled>아지트 가입</button><%-- 소모임 회원이라면 --%>
						</c:otherwise>
						</c:choose>
         
					</div>
					
					<div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
						로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
						회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
						로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
						로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberId}<br>
						로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
						로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
						소모임 가입일 : ${ahzitMemberDto.memberJoindate}
					</div>
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col col-6">
					
						<div class="row">
							<div id="calendar"></div>
						</div>
					
					
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3" style="background-color: green;">
					
					오른쪽
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
//calendar element 취득
var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
var calendar = new FullCalendar.Calendar(calendarEl, {
  height: '700px', // calendar 높이 설정
  expandRows: true, // 화면에 맞게 높이 재설정
  slotMinTime: '08:00', // Day 캘린더에서 시작 시간
  slotMaxTime: '23:00', // Day 캘린더에서 종료 시간
  // 해더에 표시할 툴바
  headerToolbar: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
  },
  initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
  navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
  editable: true, // 수정 가능?
  selectable: true, // 달력 일자 드래그 설정가능
  nowIndicator: true, // 현재 시간 마크
  dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
  locale: 'ko', // 한국어 설정
  eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
    console.log(obj);
  },
  eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
    console.log(obj);
  },
  eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
    console.log(obj);
  },
  select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
    var title = prompt('Event Title:');
    if (title) {
      calendar.addEvent({
        title: title,
        start: arg.start,
        end: arg.end,
        allDay: arg.allDay
      })
    }
    calendar.unselect()
  }
  
});
// 캘린더 랜더링
calendar.render();

});
</script>



<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>