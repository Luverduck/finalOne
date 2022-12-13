<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>



<form action="checkPw" method="post" autocomplete="off">

	<div>
		<div>
			<h1>비밀번호 찾기</h1>
		</div>
		<div>
			<label>아이디 : 
				<input name="userId" type="text" required placeholder="아이디">
			</label>
		</div>
		<div >
			Email : <input name="userEmail" type="text" required placeholder="이메일">
			<button class="send-btn" type="submit">인증하기</button>
			<div class="cert"></div>
		</div>
	
	</div>
		
</form>

<c:if test="${param.error != null}">
	<div class="row center mt-30">
		<span style="color: darkred;">아이디와 이메일을 확인해주세요.</span>
	</div>
</c:if>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		var judge = {
			emailValid : false,
		};
		
		//목표 : 확인 버튼을 누르면 이메일 발송 컨트롤러로 비동기 요청
		$(".send-btn").click(function(){
			var email = $("[name=userEmail]").val();
			var userId = $("[name=userId]").val();
			
			
			if(email.length == 0) return;
			var btn = $(this);
			btn.prop("disabled", true);

			$.ajax({
				url:"/ahzitUser/checkPw",
				method:"POST",
				data:{
					userEmail:email,
					userId:userId
					},
				success:function(map) {
					
					if(map.message == "아이디 또는 이메일을 다시 확인해주세요"){
						alert(map.message);
						btn.prop("disabled", false);
						return false;
					}
					
				
					
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
					
						var userId =  $("[name=userId]").val();
						var email = $("[name=userEmail]").val();
						var email = $("[name=userEmail]").val();
						
						if(serial.length != 6) return;
					//	alert(serial);
						$.ajax({
							url:"${pageContext.request.contextPath}/async3",
							method:"POST",
							data:{
								certificationId:email,
								certificationKey:serial
							},
							success:function(resp){
								console.log(resp);
								if(resp == false){
									alert("인증번호를 다시 확인해주세요");
								}
								else{
								//resp가 true면 이메일 인증이 성공한 것
								//결과를 외부에 저장하고 더이상 인증버튼을 못누르게 해야한다
								alert("인증이 완료되었습니다.");
							   window.location = ("${pageContext.request.contextPath}/ahzitUser/checkPwSuccess?userId=" + userId);
							judge.emailValid = resp;
							btn.prop("disabled", true);
							}
							}
						});
					});
					
					div.append(input).append(button);
					$(".cert").html(div);
				},
			});
		});
		
		//form이 전송될 때 판정객체(judge)의 상태가 어떤지 출력
		$(".join").submit(function(){
			console.log(judge);
			return false;
		});
	});

</script>  

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>