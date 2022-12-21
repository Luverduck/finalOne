<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

<style>
.checkpw-size{
font-size: 0.85rem;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
 <script>
 $(function(){
	 var validChecker = {
             userPwValid : false, passwordRegex : /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,16}$/,
             userPwReValid : false
         };
         
	 
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
 })
 </script>

 <form action="checkPwSuccess" method="post">
	
 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 rounded text-center">
				<h1 class="text-center">비밀번호 변경</h1>	
				<i class="fa-solid fa-circle-exclamation"></i>
				비밀번호 재설정을 위한 본인 확인이 완료되었습니다
				<h6 class="text-center checkpw-size">새로운 비밀번호를 등록 후 사용해주세요</h6>
			</div>
		</div>
	</div>
	
	<input type="hidden" name="userId" value="${userId}" >
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
					<label>
					변경할 비밀번호
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
					</label>
					<div class="valid-feedback">비밀번호가 일치합니다</div>
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
			</div>
		</div>
	</div>
	
	 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mb-4">
			<button class="btn rounded w-100 btn-lg" style="background-color : #E6E6E6; color:#3E4684;" type="submit">변경</button>
		 </div>
	</div>
		
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>