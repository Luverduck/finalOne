<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 정보 수정" name="title"/>
</jsp:include>

<style>
/* * {
	border: 1px dotted gray;
	font-family: font-family : 'Gothic A1', sans-serif;
} */
</style>
	         
<%-- 소모임 수정(소모임이름, 소개, 최대멤버수, 공개여부, 프로필사진)--%>
<div class="container mt-5 mb-5">

<form action="edit" method="post" enctype = "multipart/form-data">
	<%-- <input type="text"  name = "ahzitNo" value="${ahzitDto.ahzitNo}"> --%>
	
	<div class="row mt-3">
		<p class="fs-3">이 아지트 리더는 ${ahzitDto.ahzitLeader} 입니다</p>
	</div>
	
	<div class="row">
	 	<span class="col-4">&#35;${ahzitDto.ahzitSort}</span>
	 	<span class="col-4"><i class="fa-solid fa-location-dot">
	 		${ahzitDto.ahzitRegionHigh}&nbsp; <%--지역선택 시/도 --%>
			${ahzitDto.ahzitRegionLow}<%--지역선택 군/구 --%>
				
	 	</i></span>
	</div>
	

	
	<%--아지트 이름 --%>
	<div class="row align-items-center mt-5">
		<p class="fs-3">아지트 이름을 입력해주세요</p>
		<div>
			<input name="ahzitName"  class="ahzitName-input d-inline-flex form-control form-control-lg rounded"  oninput="ahzitName1();"  type="text"  value="${ahzitDto.ahzitName}" autocomplete="off" required><br>			
			<span class="ahzitName-input-length">0</span> / 15<br><br>
		</div>
	</div>
		
	<%--아지트 소개 --%>
		<div class="row align-items-center mt-5">
			<p class="fs-3">아지트 소개글을 입력해주세요</p>
		<div>
			<input name="ahzitInfo"  class="ahzitInfo-input form-control rounded"  oninput="ahzitInfo1();"  type="text"  value="${ahzitDto.ahzitInfo}" autocomplete="off" required>	
			<span class="ahzitInfo-input-length">0</span> / 200<br><br>
		</div>
	</div>
			
	<%--아지트 최대멤버수 --%>
	<div class="row align-items-center mt-5">
		<p class="fs-3">아지트 인원을 입력해주세요</p>
			<div class="col">
				<input class="form-control rounded" name="ahzitHeadMax" value="${ahzitDto.ahzitHeadMax}"><br>
			</div>
		<p class="col">아지트 인원은 최대 100명까지 가능합니다</p>
	</div>
			

			

		<div class="row align-items-center mt-5">
			<p class="fs-3">아지트 공개 여부를 선택하세요</p>
<%-- 		<p>현재 상태 : ${ahzitDto.ahzitIsPublic}</p>

 --%>		
 		<div class="col">
			<input type="radio" name="ahzitIsPublic" value="N" checked><label>비공개 아지트</label>
		</div>
		<div class="col">
			<input type="radio" name="ahzitIsPublic" value="Y"><label>공개 아지트</label>
		</div>
	</div>


		<%--아지트 이미지--%>
		<div class="row justify-content-center mt-5">
			<p class="fs-3">아지트 이미지를 등록해주세요</p>
			
			<div class="row">
	            <input type="file"  name="ahzitAttachment"  id="input-file" class="thumbnail">
			</div>
			
			<div class="row">
	            <c:choose>
      				<c:when test="${ahzitAttachmentList.isEmpty()}"><!-- 프로필 이미지를 등록하지 않았을 경우 -->
      					<img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
      				</c:when>
      			<c:otherwise><!-- 프로필 이미지를 등록했을 경우 -->
      				<c:forEach var = "ahzitAttachmentList" items = "${memberAttachmentList}">  <%--설정한 프로필 --%>
			            <img class="preview" src = "/attachment/download/ahzitNo?attachmentNo=${ahzitAttachmentList.attachmentNo}" width="200" height="200"> 					
			         </c:forEach>
      			</c:otherwise>
      			</c:choose>
	           <!--  <img class="preview" src="/images/bg_default.jpg" width="250px" height="200px"> -->
	      </div>
	      
	      
	          <div class="row">
	            <label class="input-file-upload img-lab" for="input-file">사진변경</label>     
	          </div>
		</div>
	
		<div class="row justify-content-center mt-5">
			<button type="submit" class="col btn-edit-cancel btn btn-outline-secondary rounded" >취소</button>
            <button type="submit" class="col btn rounded" style="background-color : #E6E6E6; color:#3E4684;">수정하기</button>
			<button type="submit" class="btn rounded" href="/ahzit/delete?ahzitNo= ${ahzitDto.ahzitNo}" onclick="return checkout();">
				<i class="fa-solid fa-trash" style="color:red;"></i>
				<span style="color:red">아지트 삭제</span>
			</button>
		</div>	
	</form>
	
	<%--아지트 삭제 --%>
<%-- 		<a href="/ahzit/delete?ahzitNo= ${ahzitDto.ahzitNo}" onclick="return checkout();"><i class="fa-solid fa-trash" style="color:red;"></i><span style="color:red">아지트 삭제</span></a>	
 --%>
 
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
	//소모임 삭제 확인창(javascript)
	function checkout(){
	    var choice = confirm("정말 삭제하시겠습니까? 해당 아지트의 모든 정보가 삭제됩니다");
	    return choice;
	}
	
    // 이미지 (jquery)
    $(function(){
            $("[name=attachment]").change(function(e){
                //input[type=file] 태그에는 files라는 속성이 존재
               
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
        });
    
    $(function() {
        //선택된 챌린지 번호를 input type=hidden에 추가
    //    var ahzitNo = parseInt($(this).find("option:selected").attr("value"));
        $("input[name=ahzitNo]").val(ahzitNo);
        
        //인증샷이 없으면 기본 이미지 노출
        $(".preview").on("error", function(){
            $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.jpg");
        });
        
        //form submit 시 select disabled 속성 제거
        $(".confirm-form").submit(function(){
           $(this).removeAttr('disabled');
           });
        
        //취소버튼 클릭 시, 이전 페이지로 이동
        $(".btn-edit-cancel").click(function(){
           history.back();
          });
        
        //사진 삭제 버튼 클릭 시, 테이블 데이터/실제 파일 삭제
        $(".btn-delete-file").click(function(){
           $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.jpg");
           $.ajax({
                //삭제 메소드 호출
                url : "/attachment/download/ahzitMember?attachmentNo=${memberAttachmentList.attachmentNo}",
                method : "get",
                dataType : "json",
                async : false,
                success : function(resp) {
                   $(".preview").attr("src", "${pageContext.request.contextPath}/images/bg_default.jpg");
                }
            });
        });
  });
</script>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>