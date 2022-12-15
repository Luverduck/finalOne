<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의글 수정" name="title"/>
</jsp:include>

<script>
$(function(){
    $("[name=inquireContent]").summernote({
        height : 300, // 높이 지정
        minHeight : 300, // 최소 높이
        maxHeight : 300, // 최대 높이
        lang : "ko-KR" // 도움말 한글로 번역, 스크립트 추가해야함
    })
});
</script>

<div class="row mt-4">
	<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class="p-4 text-dark rounded  text-center">
			<h1 class="text-center">문의 글 수정</h1>
		</div>
	</div>
</div>

<div>
	<form action = "edit" method = "post" enctype="multipart/form-data">
		<input type = "hidden" name = "inquireNo" value = "${inquireDto.inquireNo}">
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="inquireTitle" class="form-control rounded" placeholder="제목" required value = "${inquireDto.inquireTitle}">
              		<label>
                    제목
                    </label>
			</div>
		</div>
 	</div>
 	
 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<textarea name="inquireContent"  required>${inquireDto.inquireContent}</textarea>
			</div>
		</div>
 	</div>
 	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<p>
            첨부파일 등록
            </p>
			<input type="file" name="inquireAttachment" multiple>
		</div>
 	</div>
 	
	<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<div class=" col">
			<a href="list?inquireId=${inquireDto.inquireId}" class="btn w-100 btn-outline-secondary" role=button>목록</a>
		</div>
		<div class=" col" >
		<button class="btn w-100 btn-outline-warning" type="submit">수정하기</button>
		</div>
	</div>
	
	</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>