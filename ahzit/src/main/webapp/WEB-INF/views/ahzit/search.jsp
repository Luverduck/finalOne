<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- header.jsp 불러오기 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<style>
	* {
		border: 1px dotted gray;
	}
	.ahzit-img {
		width: 250px;
		height: 250px;
	}
	
</style>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2">

			<div class = "row">

				<div class = "col-1">
					<a>취미</a>
				</div>
			
				<div class = "col-1">
					<a>스터다</a>
				</div>
				
				<div class = "col-1">
					<a></a>
				</div>
				
				<div class = "col-1">
					4
				</div>
				
				<div class = "col-1">
					5
				</div>
				
				<div class = "col-1">
					6
				</div>
				
				<div class = "col-1">
					7
				</div>
				
				<div class = "col-1">
					8
				</div>
				
				<div class = "col-1">
					9
				</div>
				
			</div>
					
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>