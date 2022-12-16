<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원 가입 완료" name="title"/>
</jsp:include>

		<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded">
				<h2 class="text-center">회원가입을 축하드립니다.</h2>
			</div>
		</div>
	</div>
	
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col">
			<a href="join" class="btn btn-outline-warning w-100" role=button>로그인 하기</a>
		</div>
		<div class=" col" >
			<a href="/"  class="btn btn-outline-warning w-100" role=button>메인화면으로 이동</a>
		</div>
	</div>	

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>