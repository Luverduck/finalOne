<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		var judge = {
			emailValid : false,
		};
		
		//목표 : 확인 버튼을 누르면 이메일 발송 컨트롤러로 비동기 요청
		$(".send-btn").click(function(){
			var email = $("[name=userEmail]").val();
			if(email.length == 0) return;
			
			var btn = $(this);
			btn.prop("disabled", true);
			
			$.ajax({
				url:"${pageContext.request.contextPath}/async2",
				method:"post",
				data:{certificationId:email},
				success:function() {
					//성공했다면 메일은 전송되었다고 볼 수 있다
					console.log("메일 전송 완료");
					btn.prop("disabled", false);
					
					//인증번호 입력창을 사용자에게 보여줘야 한다
					//(1) 만들든가 (2) 숨겨놨다 보여주든가
					
					var div = $("<div>");
					var input = $("<input>");
					var button = $("<button>").attr("type", "button").text("인증하기");
					
					//button을 클릭하면 input에 있는 인증번호와 이메일을 사용해서 검사요청
					button.click(function(){
						var serial = input.val();
						var email = $("[name=userEmail]").val();
						if(serial.length != 6) return;
						
					//	alert(serial);
						$.ajax({
							url:"${pageContext.request.contextPath}/async3",
							method:"post",
							data:{
								certificationId:email,
								certificationKey:serial
							},
							success:function(resp){
							console.log(resp);
							if(resp == false){
								alert("인증번호를 다시 확인해주세요");
							}
								//resp가 true면 이메일 인증이 성공한 것
								//결과를 외부에 저장하고 더이상 인증버튼을 못누르게 해야한다
							
								else{
								judge.emailValid = resp;
								btn.prop("disabled", true);
								alert("인증이 완료되었습니다.");
								}
							}
						});
					});
					
					div.append(input).append(button);
					$(".cert").html(div);
				}
			});
		});
		
		//form이 전송될 때 판정객체(judge)의 상태가 어떤지 출력
		$(".join").submit(function(){
			console.log(judge);
			return false;
		});
	});

	  function submitChk() {
		    
		    var userInterestSort = [];
		    $("input[name='userInterestSort']:checked").each(function(i) {
		    	userInterestSort.push($(this).val());
		    });
		    
		    var userId = $("input[name='userId']").val();
		    var userPw = $("input[name='userPw']").val();
		    var userEmail = $("input[name='userEmail']").val();
		    var userNick = $("input[name='userNick']").val();
		    
		    var allData = { "userId": userId, "userPw":userPw , "userEmail": userEmail , "userNick":userNick , "userInterestSort": userInterestSort };
		    
		    $.ajax({
		        url:"join",
		        type:'POST',
		        data: allData,
		 
		 
		//데이터 전송이 완료되면 출력되는 메시지
		 
		        success:function(data){
		            alert("가입이 완료되었습니다.");
		            window.location = ("${pageContext.request.contextPath}/ahzitUser/login");
		        },
		    
		    }) 
		  }
	
</script>  
<h1>회원가입</h1>


<form action="join" method="post" >
  	
		<div>
			아이디 : <input name="userId" placeholder="아이디" type="text" required>
		</div>
		
		<div>
			비밀번호 : <input name="userPw" placeholder="비밀번호"  type="password" required>
		</div>
		
		<div>
			닉네임 : <input name="userNick" placeholder="닉네임" type="text" required>
		</div>
		<input type="hidden" name="certificationId" value="${certificationId}">	
		<div>
			이메일 : <input type="text" name="userEmail" placeholder="이메일" >
			<button class="send-btn" type="button" >인증하기</button> 
			<div class="cert"></div>
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
	        
	    </div>
		
	<input type="button" value="button"  onclick="submitChk();"/>
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
