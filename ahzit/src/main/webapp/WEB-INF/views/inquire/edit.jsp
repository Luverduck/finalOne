<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 수정" name="title"/>
</jsp:include>

<h1>1:1 문의 수정</h1>

<div>
	<form action = "edit" method = "post" enctype="multipart/form-data">
		<input type = "hidden" name = "inquireNo" value = "${inquireDto.inquireNo}">
		<div>
			제목 : <input type = "text" name = "inquireTitle" value = "${inquireDto.inquireTitle}">
		</div>
		<div>
			내용 : <input type = "text" name = "inquireContent" value = "${inquireDto.inquireContent}">
		</div>
		<div>
			첨부파일 : <input type = "file" name = "inquireAttachment" multiple>
		</div>
		<div>
			<button type = "submit">수정</button>
		</div>
	</form>
	<div>
		<a href = "list?inquireId=${inquireDto.inquireId}">목록</a>		
	</div>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>