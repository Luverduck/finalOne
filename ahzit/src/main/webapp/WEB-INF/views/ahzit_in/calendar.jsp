<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${ahzitVO.getAhzitName()}" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp"></jsp:include>

<style>
	body {
		background-color: #F5F5F5;	
	}
	
	
	.tippy-box[data-theme~='custom']{background-color:#FFFFFF;}
	
	#rightbar{max-height:70vh;}
	
	.fc-icon{color:#FFFFFF;}
	
</style>

<!-- jquery CDN -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- 풀캘린더 툴팁 -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js"></script>


<!-- moment CDN (format사용하기 위해)-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script type="text/javascript"></script>


<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 삭제--%>
				
				
				<%-- 가운데 내용 --%>
				<div class = "col col-9">
					
						<div class="row">
							<div id="calendar"></div>
							<input type="hidden" name="memberAhzitNo" value="${ahzitMemberDto.memberAhzitNo}">
							<input type="hidden" name="memberNo" value="${ahzitMemberDto.memberNo}">
						</div>
						
						
					
					
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3">
				
					<div class="row">
						
						<div class="col-10 offset-1">
							
							<div id="rightbar" class="row p-2 shadow" style="border-radius : 15px; overflow-y:scroll; background-color:white;">
								
								<div style="height:43px;">
								다가오는 일정
								<hr />
								</div>

							<div>
								<c:forEach var="scheduleListSysdate" items="${scheduleListSysdate}">		
									<div style="margin-bottom: 10px;">	
										<span style="font-size:20px;">${scheduleListSysdate.scheduleTitle}</span>
										<br>
										<span style="font-size:12px;">${fn:substring(scheduleListSysdate.scheduleStart, 2, 4)}년 ${fn:substring(scheduleListSysdate.scheduleStart, 5, 7)}월 ${fn:substring(scheduleListSysdate.scheduleStart, 8, 10)}일 ${fn:substring(scheduleListSysdate.scheduleStart, 11, 16)}</span>
									</div>
								</c:forEach>		
							</div>
							
							</div>
						</div>
					
					</div>
				
					
					
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

var currentTime=new Date();
console.log(currentTime);
var memberNo=$("[name=memberNo]").val();
var memberAhzitNo=$("[name=memberAhzitNo]").val();

document.addEventListener('DOMContentLoaded', function() {
	
	
    var calendarEl = document.getElementById('calendar');
	// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})
	
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
      select: function(arg) {
    	  console.log(arg);
    	
    	  var result=moment(arg.start).isAfter(currentTime);
    	  console.log(result);
    	  if(result==false){
    		  
    		  confirm("지나간 날짜에는 일정을 등록할 수 없습니다");
    		  return false;
    	  }
    	
        var title = prompt('입력할 일정:');
        var dto={
      		  "scheduleMemberNo": memberNo,
       		  "scheduleAhzitNo": memberAhzitNo,
       		  "scheduleTitle": title,
       		  "scheduleStart": moment(arg.start).format('YYYY-MM-DD HH:mm:ss'),
       		  "scheduleEnd": moment(arg.end).format('YYYY-MM-DD HH:mm:ss'),
       		  "scheduleAllday": arg.allDay
    	  };
        console.log(dto);
    
    // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            extendedProps: {
            	"scheduleMemberNo": memberNo
              }
          }),
       	
          //화면에 addEvent 추가후 통신
         axios({
        	 url:"${pageContext.request.contextPath}/rest/ahzitSchedule/scheduleInsert",
        	 method:"post",
        	 data:JSON.stringify(dto),
        	 headers: { 'Content-Type': 'application/json' }
         }).then(function(response){
				console.log(response);
				alert("일정이 입력되었습니다");
				location.reload();
         });
          
          
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
    	  // 있는 일정 클릭시,
    	  console.log("#등록된 일정 클릭#");
    	  console.log(arg.event);
    	  var check=arg.event.extendedProps.scheduleMemberNo;
    	  console.log(check);
    	  var scheduleNo=arg.event.id;
    		console.log(scheduleNo);
    	  if(memberNo==check){
	        if (confirm('일정을 삭제하시겠습니까?')) {
	          arg.event.remove();
	          axios({
	        	  url:"${pageContext.request.contextPath}/rest/ahzitSchedule/scheduleDelete",
	        	  method:"post",
	        	  data:scheduleNo,
	        	  headers: { 'Content-Type': 'application/json' }
	          }).then(function(response){
	        	  console.log(response);
	        	  alert("일정이 삭제되었습니다");
	        	  location.reload();
	          }).catch(function (error) {
	        	    console.log(error);
	          });
	        }
    	  }
    	  else{
    		  alert("자신이 등록한 일정만 삭제할 수 있습니다");
    		  return false;
    	  }
      },
      editable: false,
      dayMaxEvents: true,
      locale:"ko",
      eventDidMount: function(info) {
          tippy(info.el, {
              content:  info.event.title,
              placement:'top',
              theme:'custom'//이벤트 타이틀
          });
      },
      //================ ajax데이터 불러올 부분 =====================//
      events: [
    	  $.ajax({
    		  url:"${pageContext.request.contextPath}/rest/ahzitMember/scheduleList/",
    		  method:"get",
    		  data:{"memberAhzitNo":memberAhzitNo},
    		  success:function(resp){
    			  console.log(resp);
    			  if(resp.length!=0){
    				  for(var i=0;i<resp.length;i++){
    					  calendar.addEvent({
    						  title: resp[i]['scheduleTitle'],
    						  start: resp[i]['scheduleStart'],
    						  end: resp[i]['scheduleEnd'],
    						  id: resp[i]['scheduleNo'],
    						  extendedProps: {
    				            	"scheduleMemberNo": resp[i]['scheduleMemberNo']
    				              }
    					  })
    				  }
    			  }
    		  }
    	  })
      ]
     
  });

    calendar.render();
  });


</script>

