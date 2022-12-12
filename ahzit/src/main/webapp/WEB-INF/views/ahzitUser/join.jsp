<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입" name="title"/>
</jsp:include>
<style>
.NNNNN{
        border: 1px;
         color: red;
    }
</style>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
 <script>
        $(function(){
        	$("[name=userId]").next().next().next().next().hide();
        	
            //상태 객체
            var validChecker = {
                userIdValid : false, idRegex : /^[a-z][a-z0-9]{7,19}$/,
                userPwValid : false, passwordRegex : /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
                userPwReValid : false,
                userInterestSort : false,
                userNickValid : false, nicknameRegex : /^[가-힣0-9]{2,10}$/,
                userEmailValid : false, userEmailRegex : /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/,
                isAllValid : function(){
                    return this.userIdValid 
                                && this.userPwValid 
                                && this.userPwReValid 
                                && this.userNickValid
                                && this.userInterestSort
                                && this.userEmailValid;
                }
            };
            
            $(".join").submit(function(){
    	        if(!validChecker.isAllValid()){
    	            return false;
    	        }
    	        return true;
    	    });

			    $("[name=userId]").blur(function(){
	                
			    var name = $(this).attr("name");
                var value = $(this).val();
                var regex = validChecker.idRegex;
                var judge = regex.test(value);
          
                
             //   $(this).removeClass("is-valid is-invalid");
                if(judge) {
                    //+비동기통신(중복검사)
                    validChecker.idValid = true;
                    $(this).removeClass("is-valid is-invalid").addClass("is-valid");
                    var that = this;
                    $.ajax({
    	                url: "${pageContext.request.contextPath}/rest/ahzitUser/userId",
    	                method: "post",
    	                data: {
    	                	value : value
    	                },
    	                success:function(resp){
    	                    if(resp == "NNNNY"){
    	                        validChecker.userIdValid = true;
    	                        $(".NNNNN").hide();
    	                    }
    	                    else{
    	                        validChecker.userIdValid = false;
    	                        $(that).removeClass("is-valid is-invalid");
    	                        $(".NNNNN").show();
    	                    }
    	                }
    	            });
                }
                else {
                    validChecker.userIdValid = false;
                    $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
                }
            });
         

            $("[name=userPw]").blur(function(){
                var value = $(this).val();
                var regex = validChecker.passwordRegex;
                if(regex.test(value)) {
                    validChecker.userPwValid = true;
                    $(this).removeClass("is-valid is-invalid").addClass("is-valid");
                }
                else {
                    validChecker.userPwValid = false;
                    $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
                }
            });
            $("[name=userNick]").blur(function(){
                var value = $(this).val();
                var regex = validChecker.nicknameRegex;
                if(regex.test(value)) {
                    validChecker.userNickValid = true;
                    $(this).removeClass("is-valid is-invalid").addClass("is-valid");
                }
                else {
                    validChecker.userNickValid = false;
                    $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
                }
            });
            $("[name=userEmail]").blur(function(){
                var value = $(this).val();
                var regex = validChecker.userEmailRegex;
                if(regex.test(value)) {
                    validChecker.userEmailValid = true;
                    $(this).removeClass("is-valid is-invalid").addClass("is-valid");
                }
                else {
                    validChecker.userEmailValid = false;
                    $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
                }
            });
            
            $("#userPw-re").blur(function(){
                var value1 = $(this).val();
                var value2 = $("[name=userPw]").val();

                if(value1 == value2){
                    validChecker.userPwReValid = true;
                    $(this).removeClass("is-valid is-invalid ").addClass("is-valid");
                }
                else {
                    validChecker.userPwReValid = false;
                    $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
                }
            });

            $(".join").submit(function(e){
                e.preventDefault();

                $(this).find("input, textarea, select, checkbox").blur();//모든 입력창
                //$(this).find("[name]").blur();//name을 가진 입력창

                //console.log(validChecker.isAllValid());
                if(validChecker.isAllValid()){
                    this.submit();//전송
                }
            });
            
        });
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
					var input = $("<input>").attr("class" , "form-control rounded");
					var button = $("<button>").attr("type", "button").attr("class", "btn btn-warning btn-lg rounded text-light").text("확인");
					
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



<form action="join" method="post" >
  	
  	 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">회원 가입</h1>
			</div>
		</div>
	</div>
  	
  	
  	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userId" class="form-control rounded" placeholder="아이디" >
                	<label>
						아이디
						<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
				<div class="valid-feedback">올바른 아이디 형식입니다</div>
				<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				<div class="NNNNN">이미 사용 중인 아이디입니다.</div>
			</div>
		</div>
	 </div>
            
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userPw" class="form-control rounded" placeholder="비밀번호" >
					<label>
					비밀번호
 					<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
					<div class="valid-feedback">올바른 비밀번호 형식입니다</div>
					<div class="invalid-feedback">비밀번호는 특수문자, 숫자, 영문 대소문자가 반드시 1개 이상 포함된 8~16자로 작성하세요</div>
				</div>
			</div>
		</div>
		

	 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" id="userPw-re" class="form-control rounded" placeholder="비밀번호 확인" >
					<label>
 					비밀번호 확인
					<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
					<div class="valid-feedback">비밀번호가 일치합니다</div>
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
			</div>
		</div>
	</div>
    
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="userNick" class="form-control rounded" placeholder="닉네임" >
              		<label>
                    닉네임
                    <i class="fa-solid fa-asterisk text-danger"></i>
                    </label>
                    <div class="valid-feedback">멋진 닉네임입니다!</div>
                    <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
			</div>
		</div>
 	</div>
		
	<input type="hidden" name="certificationId" value="${certificationId}">	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userEmail" class="form-control rounded" placeholder="이메일" >
				<label>
				이메일 
				<i class="fa-solid fa-asterisk text-danger"></i>
				</label>
				
				</div>
				<button class="send-btn btn btn-warning btn-lg rounded text-light " type="button" >인증번호 발송</button> 
		
				<div class="valid-feedback">올바른 이메일 형식입니다.</div>
				<div class="invalid-feedback">이메일 형식을 확인해주세요</div>
				<div class="cert"></div>
			</div>
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
	    
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<input class="btn btn-warning w-100 btn-lg rounded text-light" type="button" value="가입하기"  onclick="submitChk();"/>
		 </div>
	</div>
              
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
