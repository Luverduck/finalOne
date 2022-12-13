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
		
<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h3 class="text-center">관심사</h3>
			</div>	
		
	            <input class=" form-check-input" type="checkbox" name="userInterestSort" value="취미" id ="sort1" >
	            	<label class="form-check-label" for="sort1">
    				취미
  					</label>
	        
	            <input class="form-check-input"  type="checkbox" name="userInterestSort" value="스터디" id ="sort2" >
					<label class="form-check-label" for="sort2">
    				스터디
  					</label>

	            <input  class="form-check-input"   type="checkbox" name="userInterestSort" value="일상"  id ="sort3" >
					<label class="form-check-label" for="sort3">
	    			일상
	  				</label>

	            <input class="form-check-input"   type="checkbox" name="userInterestSort" value="팬클럽" id ="sort4" >
					<label class="form-check-label" for="sort4">
    				팬클럽
  					</label>

	            <input class="form-check-input"   type="checkbox" name="userInterestSort" value="음악" id ="sort5" >
					<label class="form-check-label" for="sort5">
    				음악
  					</label>

	            <input class="form-check-input"  type="checkbox" name="userInterestSort" value="스포츠" id ="sort6" >
					<label class="form-check-label" for="sort6">
    				스포츠
  					</label>
	
	            <input class="form-check-input"  type="checkbox" name="userInterestSort" value="여행" id ="sort7" >
     				<label class="form-check-label" for="sort7">
    				여행
  					</label>
	  
	            <input class="form-check-input"   type="checkbox" name="userInterestSort" value="맛집" id ="sort8" >
					<label class="form-check-label" for="sort8">
    				맛집
  					</label>
	        </div>
	    </div>
			<input class="btn btn-warning  btn-lg rounded text-light" type="button" value="변경하기"  onclick="submitChk();"/>
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
		    var userInterestId = $("input[name='userId']").val();
		    var userNick = $("input[name='userNick']").val();
		    var userEmail = $("input[name='userEmail']").val();
		   
		    
		    var allData = {"userInterestId":userInterestId, "userId": userId, "userNick": userNick, "userEmail":userEmail , "userInterestSort": userInterestSort };
		    
		    $.ajax({
		        url:"edit",
		        type:'POST',
		        data: allData,
		 
		 
		//데이터 전송이 완료되면 출력되는 메시지
		 
		        success:function(data){
		        	 alert("변경이 완료되었습니다.");
			            window.location = ("${pageContext.request.contextPath}/ahzitUser/mypage");
			        },
		    
		    }) 
		  }
	
</script>  
<script>
$(document).ready(function(){
	$("input[type='checkbox']").on("click", function(){
		let count = $("input:checked[type='checkbox']").length;
		if(count >3){
			$(this).prop("checked", false);
			alert("관심사는 3개까지만 선택할 수 있습니다")
		}
	});
});

</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>