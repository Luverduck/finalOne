<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<!-- 카카오로그인 cdm -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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
        	  console.log(response)
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




	<div>
		<h1>LOGIN</h1>
	</div>
	
	<div>
		<input type="text" name="userId" placeholder="아이디" required>
	</div>
	<div >
		<input  type="password" name="userPw" placeholder="비밀번호" required>
	</div>
	
	<div>
		<button type="submit">로그인</button>
	</div>

	<div class="row">
		<a href="checkId">
			<span>아이디 찾기</span>
		</a>
	</div>
	
		<div class="row">
		<a href="checkPw">
			<span>비밀번호 찾기</span>
		</a>
	</div>

	<c:if test="${param.error != null}">
		<div>
			<span style="color:darkred;">아이디 또는 비밀번호를 잘못 입력했습니다.</span>
		</div>
	</c:if>
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>