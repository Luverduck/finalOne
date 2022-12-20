<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입" name="title"/>
</jsp:include>

<style>

	.NNNNN {
	    border: 1px;
		color: red;
	}
	
	.btn-m {
		padding: 0.26rem 0.75rem;
	}
	
/* 	 span img {
		width: 130px;
		height: 130px;
		border-radius: 50%; 
	} */
	.join-img-sort {
		width: 110px;
		height: 110px;
		border-radius: 50%; 
	}
	
	[type=checkbox] {
		display:none !important;
	}
		
	.interest-selected {
		border : 5px solid #3E4684;
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
                    $(".send-btn").prop("disabled", false);
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
			
			$.ajax({
				url:"${pageContext.request.contextPath}/async2",
				method:"post",
				data:{certificationId:email},
				success:function() {
					//성공했다면 메일은 전송되었다고 볼 수 있다
					console.log("메일 전송 완료");
					$(".send-btn").prop("disabled", true);
					
					//인증번호 입력창을 사용자에게 보여줘야 한다
					//(1) 만들든가 (2) 숨겨놨다 보여주든가
					
					
					var div = $("<div>").attr("class", "d-flex justify-content-center align-items-center flex-fill mb-3");
					var input = $("<input>").attr("class" , "form-control rounded").attr("placeholder" , "인증번호")
					var button = $("<button>").attr("type", "button").attr("class", "btn btn-sm btn-warning rounded text-light btn-m emailSend-btn").text("확인");
					
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
								$(".emailSend-btn").prop("disabled", true);
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
				<input type="text" name="userId" class="form-control rounded" placeholder="아이디" required>
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
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
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
				<input type="password" id="userPw-re" class="form-control rounded" placeholder="비밀번호 확인" required>
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
    			<input type="text" name="userNick" class="form-control rounded" placeholder="닉네임" required >
              		<label>
                    닉네임
                    <i class="fa-solid fa-asterisk text-danger"></i>
                    </label>
                    <div class="valid-feedback">올바른 닉네임 형식입니다</div>
                    <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
			</div>
		</div>
 	</div>
		
		<input type="hidden" name="certificationId" value="${certificationId}">
			
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			
				<div class="d-flex justify-content-center align-items-center flex-wrap mb-3">
				
					<div class=" d-flex justify-content-center align-items-center flex-fill mb-3 form-group">
						
						<div class="input-group form-floating">
						
							<input type="text" name="userEmail" class=" form-control rounded me-1"  placeholder="이메일"  required>
							
							<label>
							이메일 
							<i class="fa-solid fa-asterisk text-danger"></i>
							</label>
							
							<button class="send-btn btn  rounded btn-m" style="background-color : #E6E6E6; color:#3E4684;" disabled type="button" >인증번호 발송</button>
							<div class="valid-feedback">올바른 이메일 형식입니다.</div>
							<div class="invalid-feedback">이메일 형식을 확인해주세요</div>		
						</div>
						
					</div>  
						
				</div>
				
				<div class="cert"></div>
				
			</div>
		</div>
            
		
	 <div class="container mt-4">
		<div class="col-md-8 offset-md-2 mb-5 mt-3">
			<div class="text-center mb-3">
				<i class="fa-solid fa-tag"></i>&nbsp; 
				관심사 3가지를 설정하세요!
			</div>

			<div class="row row-cols-1 row-cols-md-3 g-10 my-2 text-center">
				<div class="col">
					<div class="my-2 myinterest">
						<label for="sort1">
               				<input  type="checkbox" name="userInterestSort" value="취미" id ="sort1" >
							<span>
							<img src="/images/hobbies.png" class="join-img-sort">
							</span>
						</label>
					</div>
					<strong>
					취미
					</strong>
				</div>
				
				<div class="col">
					<div class="my-2">
						<label for="sort2">
                				<input  type="checkbox" name="userInterestSort" value="스터디" id ="sort2" >
								<span>
								<img src="/images/study.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					스터디
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort3">
                				<input  type="checkbox" name="userInterestSort" value="일상"  id ="sort3" style="display: none;">
								<span>
								<img src="/images/life-smile.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					일상
					</strong>
				</div>
		
				<div class="col">
					<div class="my-2">
						<label for="sort4">
                				<input type="checkbox" name="userInterestSort" value="팬클럽" id ="sort4"  >
								<span>
								<img src="/images/fanclub.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					팬클럽
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort5">
                				<input type="checkbox" name="userInterestSort" value="음악" id ="sort5"  >
								<span>
								<img src="/images/music.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					음악
					</strong>
				</div>
	
				<div class="col">
					<div class="my-2">
						<label for="sort6">
                				<input type="checkbox" name="userInterestSort" value="스포츠" id ="sort6"  >
								<span>
								<img src="/images/sports.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					스포츠
					</strong>
				</div>
	
				<div class="col">
					<div class="my-2">
						<label for="sort7">
                				<input type="checkbox" name="userInterestSort" value="여행" id ="sort7"  >
								<span>
								<img src="/images/travel.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					여행
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort8">
                				<input type="checkbox" name="userInterestSort" value="맛집" id ="sort8"  >
								<span>
								<img src="/images/eat.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					맛집
					</strong>
				</div>
				
				<div class="col">
					<div class="my-2">
						<label for="sort9">
                				<input type="checkbox" name="userInterestSort" value="영화" id ="sort9"  >
								<span>
								<img src="/images/movie.png" class="join-img-sort">
								</span>
						</label>
					</div>
					<strong>
					영화
					</strong>
				</div>
			</div>
		</div>
	</div>
	    
	<div class="row mt-4">
	<div class="col-8 offset-2 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class="mb-5">
		<input class="btn btn-lg rounded w-100 join-btn" style="background-color : #E6E6E6; color:#3E4684;" type="button" value="가입하기" onclick="submitChk();"/>
		 </div>
	</div> 
	</div>
              
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

<script>

$(function(){
	
	var thisBtnCheck;
	
	$("[name=userInterestSort]").click(function(){
		thisBtnCheck = $(this);
			
		var target = $(this).next().children();
		var count = $("input:checked[type='checkbox']").length;
		
		if(count > 3) {
			alert("관심사는 3개까지만 선택할 수 있습니다")
			return;
		}
		
		if($(this).is(":checked")) {
			target.addClass("interest-selected");
		} else {
			target.removeClass("interest-selected");
		}
	});
});	
</script>