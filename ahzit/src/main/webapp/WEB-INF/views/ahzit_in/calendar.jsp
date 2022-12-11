<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 앨범" name="title"/>
</jsp:include>

<style>
	body {
		background-color: rgba(230, 230, 230, 100);
	}
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col col-3" style="background-color: green;">
					왼쪽
				</div>
				
				<%-- 가운데 내용 --%>
				<div class = "col col-6">
					일정관리
				</div>
				
				<%-- 오른쪽 사이드바 --%>
				<div class = "col-3" style="background-color: green;">
					
					오른쪽
				</div>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>