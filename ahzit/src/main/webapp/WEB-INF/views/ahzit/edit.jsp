<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 정보 수정" name="title"/>
</jsp:include>


<h1>소모임 정보 수정</h1>
<%-- 소모임 수정(소모임이름, 소개, 최대멤버수, 공개여부, 프로필사진)--%>
<div class="container">
<form action="edit" method="post" enctype = "multipart/form-data">

	<div>
	 	소모임리더 : <p>${ahzitDto.ahzitLeader}</p>
	</div>
	
	<div>
	 소모임 종류: <p>${ahzitDto.ahzitSort}</p>
	</div>
	
	<%--아지트 이름 --%>
		<div class="row">
			<p>아지트 이름</p>	
			<div>
				<input name="ahzitName"  class="ahzitName-input"  oninput="ahzitName1();"  type="text"  value="${ahzitDto.ahzitName}" autocomplete="off" required><br>			
				<span class="ahzitName-input-length">0</span> / 15<br><br>
			</div>
		</div>
		
		<%--아지트 소개 --%>
			<div class="row">
				<p>아지트 소개</p>	
				<div>
					<input name="ahzitInfo"  class="ahzitInfo-input"  oninput="ahzitInfo1();"  type="text"  value="${ahzitDto.ahzitInfo}" autocomplete="off" required>	
					<span class="ahzitInfo-input-length">0</span> / 200<br><br>
				</div>
			</div>
			
		<%--아지트 최대멤버수 --%>
			<div class="row">
				<p>아지트 최대인원 설정</p>	
				<div>
					<input name="ahzitHeadMax" value="${ahzitDto.ahzitHeadMax}"><br>
					<p>아지트 인원은 최대 100명까지 가능합니다</p>
				</div>
			</div>
			
			<div class="row">
				<p>소모임 지역</p>
				<div>
					<span>${ahzitDto.ahzitRegionHigh}</span>&nbsp; <%--지역선택 시/도 --%>
					<span>${ahzitDto.ahzitRegionLow}</span><br>  <%--지역선택 군/구 --%>
				</div>
			</div>
			

	<div class="row">
		<p>아지트 공개</p>
		<p>현재 상태 : ${ahzitDto.ahzitIsPublic}</p>
		<div>
			<input type="radio" name="ahzitIsPublic" value="N" checked><label>비공개 아지트</label>
			<input type="radio" name="ahzitIsPublic" value="Y"><label>공개 아지트</label><br><br>
		</div>
	</div>

		<div class="row">
			<p>아지트 이미지를 등록해주세요</p>
				<div>
                     <input id="input-file" type="file" name="attachment" class="thumbnail">
		              <img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
                     <div class="row img-btns">
                         <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                     </div>
                 </div>
		</div>
		
	<div>
		<input type="hidden" name="ahzitNo" value="${ahzitDto.ahzitNo}">
	</div>
		
		<div>
			<a type="button"  class="btn-edit-cancel" >취소</a>
            <button type="submit" >수정하기</button>
		</div>	
		
		
	</form>
</div>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
//소모임이름 입력 제어 (javascript)
function ahzitName1(){
    //(주의) input 입력값을 value로 조회
    var tag = document.querySelector(".ahzitName-input");
    var text = tag.value;

    //글자수에 따라 다른 표시를 숫자로 구현
    var span = document.querySelector(".ahzitName-input-length");
    span.textContent = text.length;

    //15글자 초과시 빨간 글씨로 표현
    if(text.length > 15){
        span.style.color = "red";
    }
    else {
        span.style.color = "black";
    }

    //15글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
    var size = text.length;
    while(size > 15){
        tag.value = tag.value.substring(0, size-1);
        size--;
    }
    span.textContent = size;
}

//소모임소개 입력 제어 (javascript)
function ahzitInfo1(){
    //(주의) input 입력값을 value로 조회
    var tag = document.querySelector(".ahzitInfo-input");
    var text = tag.value;

    //글자수에 따라 다른 표시를 숫자로 구현
    var span = document.querySelector(".ahzitInfo-input-length");
    span.textContent = text.length;

    //200글자 초과시 빨간 글씨로 표현
    if(text.length > 200){
        span.style.color = "red";
    }
    else {
        span.style.color = "black";
    }

    //200글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
    var size = text.length;
    while(size > 200){
        tag.value = tag.value.substring(0, size-1);
        size--;
    }
    span.textContent = size;
}

//소모임이미지 (jquery)
$(function(){
    $("[name=attachment]").change(function(e){
        //input[type=file] 태그에는 files라는 속성이 존재
        console.log(this.files);
        if(this.files.length > 0){
            //읽는 도구
            var reader = new FileReader();
            //읽을 때 해야할 작업
            reader.onload = function(e){
                //읽은 내용 정보가 e에 들어 있음
                var preview = document.getElementById("preview")
                $(".preview").attr("src", e.target.result);
            };
            reader.readAsDataURL(this.files[0]);//읽어라
        }
    });
    $("button[name=thumbnail-delete]").click(function(){
        $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.png");
    });
	  //취소버튼 클릭 시, 이전 페이지로 이동(jquery)
	  $(".btn-edit-cancel").click(function(){
	     history.back();
	    });
	  
	//소모임프로필이 없으면 기본이미지로 대체
      $(".ahzit-img").on("error", function() {
         $(this).attr("src", "/images/bg_default.jpg");
      });

});
</script>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>