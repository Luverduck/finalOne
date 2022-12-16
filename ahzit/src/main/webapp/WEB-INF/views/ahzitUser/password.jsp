<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="마이페이지 비밀번호 변경" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
 <script>
 $(function(){
	 var validChecker = {
             userPwValid : false, passwordRegex : /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
             userPwReValid : false
         };
         
	 
	 $("[name=afterPw]").blur(function(){
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
	 
	 $("[name=afterPwCheck]").blur(function(){
         var value1 = $(this).val();
         var value2 = $("[name=afterPw]").val();

         if(value1 == value2){
             validChecker.userPwReValid = true;
             $(this).removeClass("is-valid is-invalid ").addClass("is-valid");
         }
         else {
             validChecker.userPwReValid = false;
             $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
         }
     });
 })
 </script>
 
 <form action="password" method="post">
 
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded  text-center">
				<h1 class="text-center">비밀번호 변경</h1>
			</div>
		</div>
	</div>
		
	<input type = "hidden" name = "userId" value = "${userId}">
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="password" name="beforePw" class="form-control rounded" placeholder="기존 비밀번호" required >
              		<label>
                    기존 비밀번호
                    </label>
			</div>
		</div>
 	</div>
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="password" name="afterPw" class="form-control rounded" placeholder="변경 비밀번호" required>
              		<label>
                    변경 비밀번호
                    </label>
                    <div class="valid-feedback">올바른 비밀번호 형식입니다</div>
					<div class="invalid-feedback">비밀번호는 특수문자, 숫자, 영문 대소문자가 반드시 1개 이상 포함된 8~16자로 작성하세요</div>
			</div>
		</div>
 	</div>
 	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="password" name="afterPwCheck" class="form-control rounded" placeholder="변경 비밀번호" required>
              		<label>
                   비밀번호 확인
                    </label>
					<div class="valid-feedback">비밀번호가 일치합니다</div>
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
			</div>
		</div>
 	</div>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg" type="submit">변경</button>
		 </div>
	</div>
		
	
	<c:if test="${param.error != null}">
		<div class="row text-center mt-4">
			<span style="color:red;">기존 비밀번호를 다시 확인해주세요</span>
		</div>
	</c:if>
       
</form>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>