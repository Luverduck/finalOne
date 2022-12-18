<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="카카오 입력" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


<form action="edit" method="post" autocomplete="off">

<input type="hidden" value="${userId.kakaoId}">  	
<input type="hidden" value="${userId.kakaoId}" name="userPw" >  		

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded  text-center">
				<h1 class="text-center">추가정보 입력</h1>
				<i class="fa-solid fa-circle-exclamation"></i>
				AHZIT 를 이용하기 전 간단한 추가정보를 입력해주세요.
			</div>
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="userNick" class="form-control rounded" placeholder="닉네임" required  value = "${ahzitUserDto.userNick}">
              		<label>
                    닉네임
                    </label>
                    <div class="valid-feedback">올바른 닉네임 형식입니다</div>
                    <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
			</div>
		</div>
 	</div>
			
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="userEmail" class="form-control rounded" placeholder="이메일" required  value = "${ahzitUserDto.userEmail}">
              		<label>
                    이메일 
                    </label>
					<div class="valid-feedback">올바른 이메일 형식입니다.</div>
					<div class="invalid-feedback">이메일 형식을 확인해주세요</div>		
			</div>
		</div>
 	</div>
		
 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg myId" type="submit">입력</button>
		 </div>
	</div>
		
              
</form>
  	
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
 <script>
        $(function(){
            //상태 객체
            var validChecker = {
                userNickValid : false, nicknameRegex : /^[가-힣0-9]{2,10}$/,
                userEmailValid : false, userEmailRegex : /^[A-Za-z0-9]{6,30}@[0-9a-z]{4,252}.[a-z]{2,3}$/,
                }
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
            
           });
        
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>