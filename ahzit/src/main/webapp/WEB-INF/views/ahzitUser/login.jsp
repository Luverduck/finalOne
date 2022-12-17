<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<style>
.checklogin-size{
font-size: 1.2rem;
color: red;
}
</style>

<ul>
	<li onclick="kakaoLogin();">
      <a href="javascript:void(0)">
          <span>카카오 로그인</span>
      </a>
	</li>
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('207228f74df0e9faa267683a60a341b7'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response);
        	  //	 alert("111");
        	  //	  alert(response.id);
        	  	 const kakaoId = response.id
        	  $.ajax({
					url:"${pageContext.request.contextPath}/kakao/insert",
					/* 카카오 아이디 받아서 회원 테이블에 아이디로 저장 
						추가 회원 정보를 입력받아서 회원테이블에 인서트
						인서트가 되면 세션에 로그인 아이디 저장
						기존 추가정보 입력했던 회원이면 홈화면으로 이동
						*/
					method:"post",
					data:{
						kakaoId
					},
					success : function(a){
						alert("dd");
						alert(a);
						let url1 = '${pageContext.request.contextPath}/kakao/edit';
						if( a == "Y"){
						location.href = url1;
						}
						else{
							location.href = url1;
						}
					}
					
				});
        		
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<form action="login" method="post">

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">로그인</h1>
			</div>
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userId" class="form-control rounded" placeholder="아이디" required>
                	<label>
						아이디
					</label>
			</div>
		</div>
	 </div>
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
				<label>
				비밀번호
				</label>
			</div>
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg" type="submit">로그인</button>
		 </div>
	</div>
	
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col">
			<a href="checkId" class="btn w-100" role=button>아이디 찾기</a>
		</div>
		<div class=" col" >
			<a href="checkPw"  class="btn w-100" role=button>비밀번호 찾기</a>
		</div>
	</div>
	
	<div class="row mb-2 mt-1">
		<a href="join" class="btn" role=button>아직 AHZIT의 회원이 아니신가요?</a>
	</div>
	
	<c:if test="${param.error != null}">
		<div class="row text-center">
			<h6 class="text-center checklogin-size">가입 시 입력한 본인정보를 입력해주세요.</h6>
		</div>
	</c:if>
</form>

<!-- <ul> -->
<!-- 	<li onclick="kakaoLogin();"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>카카오 로그인</span> -->
<!--       </a> -->
<!-- 	</li> -->
<!-- 	<li onclick="kakaoLogout();"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>카카오 로그아웃</span> -->
<!--       </a> -->
<!-- 	</li> -->
<!-- </ul> -->

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>