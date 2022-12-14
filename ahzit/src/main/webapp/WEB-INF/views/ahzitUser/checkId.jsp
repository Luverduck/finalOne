<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아이디 찾기" name="title"/>
</jsp:include>

<style>
.checkid-size{
font-size: 0.85rem;
}
</style>

<form action="checkId" method="post" autocomplete="off">

 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded">
				<h1 class="text-center">아이디 찾기</h1>
				<h6 class="text-center checkid-size">가입 시 입력한 본인정보를 입력해주세요</h6>
			</div>
		</div>
	</div>


	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating ">
				<input type="text" name="userEmail" class="form-control rounded" placeholder="이메일" required>
                	<label>
						Email
					</label>
			</div>
		</div>
	 </div>
	 
	 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg myId" type="submit">아이디찾기</button>
		 </div>
	</div>
		
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col">
			<a href="login" class="btn w-100" role=button>로그인 하기</a>
		</div>
		<div class=" col" >
			<a href="checkPw"  class="btn w-100" role=button>비밀번호 찾기</a>
		</div>
	</div>	
		
	<c:if test="${param.error != null}">
		<div class="row text-center mt-4">
			<span style="color:red;">가입된 이메일이 아닙니다.</span>
		</div>
	</c:if>
		
</form>

  <%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>