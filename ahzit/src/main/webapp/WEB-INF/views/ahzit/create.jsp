<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="소모임 개설" name="title"/>
</jsp:include>

<h1>소모임 개설</h1>
<style>
<%-- 
 div,p,input, label
  {
 	border : 1px dotted gray;
 }
 --%>
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  <script type="text/javascript">
  //소모임이름 입력 제어 (javascript)
  function ahzitName(){
      //(주의) input 입력값을 value로 조회
      var tag = document.querySelector(".ahzitName-input");
      var text = tag.value;

      //글자수에 따라 다른 표시를 숫자로 구현
      var span = document.querySelector(".ahzitName-input-length");
      span.textContent = text.length;

      //10글자 초과시 빨간 글씨로 표현
      if(text.length > 15){
          span.style.color = "red";
      }
      else {
          span.style.color = "black";
      }

      //10글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
      var size = text.length;
      while(size > 15){
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
  });
</script>

<div class="container">
	<form action="create" method="post" enctype = "multipart/form-data">
	
		<div class = "row">
			<p>만들고 싶은 아지트종류를 선택하세요</p>
			<div>
				<input type="radio"  name="rd" id="ex_rd1" value="운동" checked><label id="ex_rd1">운동</label><br>
				<input type="radio"  name="rd" id="ex_rd2" value="스터디"><label id="ex_rd2">스터디</label><br>
				<input type="radio"  name="rd" id="ex_rd3" value="일상"><label  id="ex_rd3">일상</label><br>
				<input type="radio"  name="rd" id="ex_rd4" value="팬클럽"><label  id="ex_rd4">팬클럽</label><br>
				<input type="radio"  name="rd" id="ex_rd5" value="음악"><label  id="ex_rd5">음악</label><br>
				<input type="radio"  name="rd" id="ex_rd6" value="스포츠"><label  id="ex_rd6">스포츠</label><br>
				<input type="radio"  name="rd" id="ex_rd7" value="여행"><label  id="ex_rd7">여행</label><br>
				<input type="radio"  name="rd" id="ex_rd8" value="맛집"><label  id="ex_rd8">맛집</label><br><br>
			</div>
		</div>
			
			
			<div class="row">
				<p>아지트 이름</p>	
				
			<%--아지트 이름 입력창 --%>
				<div>
					<input name="AhzitName"  class="ahzitName-input"  oninput="ahzitName();"  type="text" placeholder="아지트 이름 입력">			
				</div>
			</div>
			
			<%--아지트 이름 입력창 글자수 표현--%>
			<div>
				<span class="ahzitName-input-length">0</span> / 15<br><br>
			</div>
			
			<%--아지트 이미지--%>
			<div class="row">
				<p>아지트 이미지를 등록해주세요</p>
					<div>
                       <input id="input-file" type="file" name="attachment" class="thumbnail">
                       <img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
                       <div class="row img-btns">
                           <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                            <label class="delete-file-upload img-btn" name="thumbnail-delete" type="button">삭제</label><br><br>
                       </div>
                   </div>
			</div>
			
			<%--아지트 공개--%>
			<div class="row">
				<p>아지트 공개</p>
				
				<div>
					<input type="radio" name="rd2" value="비공개 아지트" checked><label>비공개 아지트</label>
					<input type="radio" name="rd2" value="공개 아지트"><label>공개 아지트</label><br><br>
				</div>
			</div>
			
			<div>
				<button onclick="location.href='${pageContext.request.contextPath}/';" >취소</button>
                 <button type="submit" >개설하기</button>
			</div>
			
		</div>
	</form>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>