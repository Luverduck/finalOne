<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 정보 수정" name="title"/>
</jsp:include>

<div>
	<form action = "edit" method = "post">
		<input type = "hidden" name = "userId" value = "${ahzitUserDto.userId}">
		<div>
			닉네임 : <input type = "text" name = "userNick" value = "${ahzitUserDto.userNick}">
		</div>
		<div>
			이메일 : <input type = "text" name = "userEmail" value = "${ahzitUserDto.userEmail}">
		</div>
		
		<div class="row">
	        <label>
	            <input type="checkbox" name="userInterestSort" value="취미">취미
	        </label>
	        <label>
	            <input type="checkbox" name="userInterestSort" value="스터디">스터디
	        </label>
	        <label>
	            <input type="checkbox" name="userInterestSort" value="일상">일상
	        </label>
	        <label>
	            <input type="checkbox" name="userInterestSort" value="팬클럽">팬클럽
	        </label>
	        <label>
	            <input type="checkbox" name="userInterestSort" value="음악">음악
	        </label>
	        <label>
	            <input type="checkbox" name="userInterestSort" value="스포츠">스포츠
	        </label>
	          <label>
	            <input type="checkbox" name="userInterestSort" value="여행">여행
	        </label>
	          <label>
	            <input type="checkbox" name="userInterestSort" value="맛집">맛집
	        </label>
	        
		<div>
			<input type="button" value="button"  onclick="submitChk();"/>
		</div>
	</form>
	
	<div class = "row">
		<a href = "mypage">My page</a>		
	</div>
</div>

<script>
	  function submitChk() {
		    
		    var userInterestSort = [];
		    $("input[name='userInterestSort']:checked").each(function(i) {
		    	userInterestSort.push($(this).val());
		    });
		    var userId = $("input[name='userId']").val();
		    var userNick = $("input[name='userNick']").val();
		    var userEmail = $("input[name='userEmail']").val();
		   
		    
		    var allData = { "userId": userId, "userNick": userNick, "userEmail":userEmail , "userInterestSort": userInterestSort };
		    
		    $.ajax({
		        url:"edit",
		        type:'POST',
		        data: allData,
		 
		 
		//데이터 전송이 완료되면 출력되는 메시지
		 
		        success:function(data){
		            alert("완료!");
		        },
		    
		    }) 
		  }
	
</script>  

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>