<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 회원" name="title"/>
</jsp:include>

<style>
	.main {
		background-color: gray;
	}
</style>

<div class = "container-fluid">
	<div class = "row">
		
		<div class = "col-10 offset-1 main">
			
			<div class = "row">
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3" style="background-color: green;">
				사이드1
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col col-6">
				
					<h1>회원</h1>
				
					<%-- 검색창 --%>
					<input type = "text" >
					
					<%-- 게시글 작성창 --%>
					
					<%-- 게시글 목록 --%>
				
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3" style="background-color: green;">
				사이드2
				</div>
			</div>
		</div>
		
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>