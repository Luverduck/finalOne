<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의 등록" name="title"/>
</jsp:include>

<h1>1:1 문의 등록</h1>

<div>
	<form action = "insert" method = "post" enctype = "multipart/form-data">
		<div>
			제목 : <input type = "text" name = "inquireTitle">
		</div>
		<div >
			내용 : <input type = "text" name = "inquireContent">
		</div>
		<div >
			첨부파일 등록 : <input type = "file" name = "inquireAttachment" multiple>
		</div>
		<button type = "submit">작성</button>
	</form>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>