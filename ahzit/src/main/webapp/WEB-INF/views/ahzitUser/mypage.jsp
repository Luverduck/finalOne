<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="my page" name="title"/>
</jsp:include>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">My page</h1>
			</div>
		</div>
	</div>

<div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <table class="table table-hover">
                  
                    <tbody class="text-center">
                        <tr>
                           <th>아이디</th>
							<td>${ahzitUserDto.userId}</td>
                        </tr>
                        <tr>
                           	<th>닉네임</th>
							<td>${ahzitUserDto.userNick}</td>
                        </tr>
                        <tr>
                           <th>이메일</th>
							<td>${ahzitUserDto.userEmail}</td>
                        </tr>
                      <tr>
					  	<th>가입일시</th>
						<td>
							<fmt:formatDate value="${ahzitUserDto.userJoinDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
						</td>
					</tr>
                    <tr>
						<th>로그인일시</th>
						<td>
						<fmt:formatDate value="${ahzitUserDto.userLoginDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
						</td>
					</tr>
                    </tbody>
                </table>
            </div>
        </div>
        
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col" >
			<a href="edit?userId=${loginId}"  class="btn btn-outline-warning w-100" role=button>개인정보 수정</a>
		</div>
		<div class=" col" >
			<a href="password?userId=${loginId}"  class="btn btn-outline-warning w-100" role=button>비밀번호 변경</a>
		</div>
		<div class=" col" >
			<a href="goodbye?userId=${loginId}"  class="btn btn-outline-warning w-100" role=button>회원 탈퇴</a>
		</div>
		<div class=" col" >
			<a href="/inquire/list?inquireId=${loginId}"  class="btn btn-outline-warning w-100" role=button>1:1 문의</a>
		</div>
	</div>		

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
