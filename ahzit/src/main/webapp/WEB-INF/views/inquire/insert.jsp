<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="1:1 문의 등록" name="title"/>
</jsp:include>


<script>
$(function(){
    $("[name=inquireContent]").summernote({
        height : 300, // 높이 지정
        minHeight : 300, // 최소 높이
        maxHeight : 300, // 최대 높이
        placeholder : "내용을 작성하세요", // 도움말
        lang : "ko-KR" // 도움말 한글로 번역, 스크립트 추가해야함
    })
});
</script>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark rounded  text-center">
				<h1 class="text-center">문의 글 작성</h1>
				<i class="fa-solid fa-circle-exclamation"></i>
				순차적으로 답변예정입니다.
			</div>
		</div>
	</div>

<div>
	<form action = "insert" method = "post" enctype = "multipart/form-data">
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="inquireTitle" class="form-control rounded" placeholder="제목" required >
              		<label>
                    제목
                    </label>
			</div>
		</div>
 	</div>
 	
 	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<textarea name="inquireContent"  required></textarea>
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
 	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg" type="submit">작성</button>
		 </div>
	</div>
	
	</form>
</div>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

