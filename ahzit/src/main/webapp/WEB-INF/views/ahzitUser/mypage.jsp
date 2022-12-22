<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="my page" name="title"/>
</jsp:include>
  
  <div class="container-fluid mt-3">

    <div class="row">
    
	<div class=" rounded mt-5">
		<h1 class="text-center">My page</h1>	
	</div>

	<div class = "col-8 offset-2">
          <div class = "row">
              <div class="col-3" >
				 	<a href = "${pageContext.request.contextPath}/ahzitUser/edit?userId=${loginId}" class = "btn w-100 mybtn"   role=button style="font-size: 23px"> [ 개인정보 수정 ]</a><br>
				    <a href = "${pageContext.request.contextPath}/ahzitUser/password?userId=${loginId}" class = "btn w-100 mybtn" role=button style="font-size: 23px">[ 비밀번호 변경 ]</a><br>
				    <a href = "${pageContext.request.contextPath}/ahzitUser/goodbye?userId=${loginId}" class = "btn w-100 mybtn"  role=button style="font-size: 23px">[ 회원탈퇴 ]</a><br>
				    <a href = "${pageContext.request.contextPath}/inquire/list?inquireId=${loginId}" class = "btn w-100 mybtn" role=button style="font-size: 23px">[ 1:1 문의 ]</a><br>
				    <a href = "${pageContext.request.contextPath}/ahzitUser/myAhzit" class = "btn w-100 mybtn " role=button style="font-size: 23px">[ 내 아지트 ]</a><br>
              </div>
      
          <div class="col-6 mb-5">
			<div class="mt-4">
				<div class="mt-4">
		            <div class="col-md-10 offset-md-2">
		                <table class="table table-hover ">
		                  
		                    <tbody class="text-center" >
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
		  </div>
      </div>
      </div>
    </div>
</div>
</div>
           
           
        
<!--                 <div class="col-3" > -->
                  
<!--                 </div> -->

    
  
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
