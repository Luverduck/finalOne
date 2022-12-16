<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="회원 관리" name="title"/>
</jsp:include>


<style>
.pagination{
justify-content : center
}
</style>

				<div class="row mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 text-dark bg-Light rounded">
							<h1 class="text-center">회원 관리</h1>	
						</div>
					</div>
				</div>
				        
				<div class="text-center mt-3 mb-4">
			
				 <div class="row mt-4">
			            <div class="col-md-10 offset-md-1">
			                <table class="table table-hover">
			                    <thead class="text-center">
			                        <tr class="bg-dark text-light">
										<th>아이디</th>
										<th>닉네임</th>
										<th>이메일</th>
										<th>가입일자</th>	
										<th>로그인일자</th>
										<th>회원관리</th>
			                        </tr>
			                    </thead>
			                    <tbody class="text-center" >
			                        <c:forEach var="ahzitUser" items="${ahzitUser}">
										<tr>
											<td>${ahzitUser.userId}</td>
											<td>${ahzitUser.userNick}</td>
											<td>${ahzitUser.userEmail}</td>
											<td>
												<fmt:formatDate value="${ahzitUser.userJoinDate}" pattern="yyyy-MM-dd"/>
											</td>
											<c:choose>
												<c:when test="${ahzitUser.userLoginDate != null}">
													<td>
														<fmt:formatDate value="${ahzitUser.userLoginDate}" pattern="yyyy-MM-dd"/>
													</td>
												</c:when>
												<c:otherwise>
													<td>
														[미 로그인]
													</td>	
												</c:otherwise>
											</c:choose>
											<td>
												<a class="btn btn-outline-warning"  href="${pageContext.request.contextPath}/ahzitUser/edit?userId=${ahzitUser.userId}">수정</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
			                </table>
			            </div>
			        </div>
			      </div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>