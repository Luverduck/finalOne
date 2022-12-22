<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="소모임 회원수정" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 회원수정" name="title"/>
</jsp:include>

<style>
	body {
		background-color: #F5F5F5;	
	}
	.ahzit-profile {
		width : 100px;
		height : 300px;
		border-radius : 15px;
	}
	#crown {
		width:20px;
	}
	.btn-join {
		display : none;
	}
   .ahzit-img {
      width : 400px;
      height : 400px;      
   }
</style>


<div class = "container-fluid mt-2 mb-2">
	<div class = "row">
		
		<div class = "col-8 offset-2">
			
			<div class = "row">
			
				<%-- 왼쪽 사이드바 --%>
				<div class = "col-3">
					<jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
				</div>
				
				<%-- <div class = "row" id = "div-member-info" data-memberno = "${ahzitMemberDto.memberNo}" data-ahzitno = "${ahzitMemberDto.memberAhzitNo}" data-membergrade="${ahzitMemberDto.memberGrade}">
							로그인 중인 회원 번호 : ${ahzitMemberDto.memberNo}<br>
							회원이 가입한 아지트 번호 : ${ahzitMemberDto.memberAhzitNo}<br>
							로그인 중인 회원 아이디 : ${ahzitMemberDto.memberId}<br>
							로그인 중인 회원 닉네임 : ${ahzitMemberDto.memberNick}<br>
							로그인 중인 회원 등급 : ${ahzitMemberDto.memberGrade}<br>
							로그인 중인 회원 활동 점수 : ${ahzitMemberDto.memberGrade}<br>
							소모임 가입일 : ${ahzitMemberDto.memberJoindate}
						</div> --%>
            	
		      	<%-- 가운데 내용 --%>
		     	<div class = "col-6">
		     		<div class = "col p-2 div-info-editor">
		     		<form id="ahzitJoin" action="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/editMyInfo" method="post">
		     			<div class = "row">
		     				<input type="hidden" name="memberAhzitNo" value="${ahzitNo}">
				      		<input type="hidden" name="memberId" value="${loginId}">
				      		<input type="hidden" name="memberNo" value="${ahzitMemberDto.memberNo}">
				      		<div class = "col">
				      			<p>닉네임</p>	
				      			<input type="text" name="memberNick" value="${ahzitMemberDto.memberNick}" class="rounded me-3">
					      		<span class="valid-feedback">사용할 수 있는 닉네임입니다</span>
					            <span class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</span>
					      		<span id="duplicate" class="NNNNN">이미 사용 중인 닉네임입니다</span><br>
				      		</div>
		     			</div>
		     			<div class = "row mt-2">
		     				<div class = "col">	
		     					<div class = "row">
		     						<p>프로필 이미지</p>
			     					<c:choose>
							      	<c:when test="${memberAttachmentList.isEmpty()}"><!-- 프로필 이미지를 등록하지 않았을 경우 -->
						      			<span>아지트에서 사용할 프로필 이미지를 등록해 주세요</span>
							      	</c:when>
							      	<c:otherwise>
						      			<span>프로필 이미지를 수정할 수 있습니다</span>
							      	</c:otherwise>
							      	</c:choose>
		     					</div>
		     					<div class = "row">		     					
				     				<c:choose>
				      				<c:when test="${memberAttachmentList.isEmpty()}"><!-- 프로필 이미지를 등록하지 않았을 경우 -->
				      					<img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
				      				</c:when>
					      			<c:otherwise><!-- 프로필 이미지를 등록했을 경우 -->
					   				<c:forEach var = "memberAttachmentList" items = "${memberAttachmentList}">  <%--설정한 프로필 --%>
						            	<img class="preview" src = "/attachment/download/ahzitMember?attachmentNo=${memberAttachmentList.attachmentNo}" width="200" height="200"> 					
						          	</c:forEach>
					      			</c:otherwise>
					      			</c:choose>
		     					</div>	     				
		     				</div>
		     				<div class = "col">
		     					<div class = "row">
		     						<label class="input-file-upload img-lab mb-2" for="input-file">사진변경</label> 
		     						<input type="file" name="attachment" id="input-file" class="thumbnail">
		     					</div>
		     				</div>
		     			</div>
		     			<div class = "row">
		     				<div class = "col">
		     					<button id="submitBtn" type="button" class="mt-2" onclick="submitChk();">변경 완료</button>
		     				</div>
		     				<div class = "col">
		     					<i class="fa-solid fa-trash" style="color:red;"></i>
					      		<span style="color:red">아지트 탈퇴</span>
		     				</div>
		     			</div>
		     		</form>
		     		</div>
				</div>
	
    			<%-- 오른쪽 사이드바 --%>
				<div class = "col-3">
					<div class = "row">
						<div class = "div-right-side p-3 shadow bg-white">

						</div>
					</div>
				</div>
				
  		 	</div>
		</div>
	</div>
</div>



<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
 <script>
 $(function(){
 	
 	$(".NNNNN").hide();
 	
     //상태 객체
     var validChecker = {
         memberNickValid : false, 
         nicknameRegex : /^[가-힣0-9]{2,10}$/
     };
     
     $("#ahzitJoin").submit(function(){
	        if(!validChecker.memberNickValid()){
	            return false;
	        }
	        return true;
	    });

		    $("[name=memberNick]").blur(function(){
             
		    var name = $(this).attr("name");
         var value = $(this).val();
         var regex = validChecker.nicknameRegex;
         var judge = regex.test(value);
         
         var memberAhzitNo = $("[name=memberAhzitNo]").val();

         var ahzitMemberDto={"memberAhzitNo":memberAhzitNo, "memberNick":value};
   
         
      //   $(this).removeClass("is-valid is-invalid");
         if(judge) {
             //+비동기통신(중복검사)
             validChecker.memberNickValid = true;
             $(this).removeClass("is-valid is-invalid").addClass("is-valid");
             var that = this;
             $.ajax({
	                url: "${pageContext.request.contextPath}/rest/ahzitMember/nicknameCheck",
	                method: "post",
	                data: ahzitMemberDto,
	                success:function(resp){
	                    if(resp == "NNNNY"){
	                        validChecker.memberNickValid = true;
	                        $(".NNNNN").hide();
	                        $("#submitBtn").attr('disabled',false);
	                    }
	                    else{
	                        validChecker.memberNickValid = false;
	                        $(that).removeClass("is-valid is-invalid");
	                        $(".NNNNN").show();
	                        $("#submitBtn").attr('disabled',true);
	                    }
	                }
	            });
         }
         
         else {
             validChecker.memberNickValid = false;
             $(this).removeClass("is-valid is-invalid").addClass("is-invalid");
             $("#submitBtn").attr('disabled',true);
         }
     });
  

     

     $("#ahzitJoin").submit(function(e){
         e.preventDefault();

         $(this).find("#memberNick").blur();

         //console.log(validChecker.isAllValid());
         if(validChecker.memberNickValid()){
             this.submit();//전송
         }
     });
     
 });

	
	//form이 전송될 때 판정객체(judge)의 상태가 어떤지 출력
	$("#ahzitJoin").submit(function(){
		console.log(judge);
		return false;
	});


	function submitChk(){
		var form = $("#ahzitJoin")[0];
		var data = new FormData(form);
		
		var memberAhzitNo=$("input[name='memberAhzitNo']").val();
		var memberId=$("input[name='memberId']").val();
		var memberNick=$("input[name='memberNick']").val();
		
		var attachment=$("input[name='attachment']").val();
		
					
		$.ajax({
			url:'editMyInfo',
			type:'POST',
			data:data,
			contentType : false,
	        processData : false,
			success:function(data){
				alert("프로필 변경이 완료되었습니다");
				window.location=("${pageContext.request.contextPath}/ahzit_in/"+memberAhzitNo);
			},
			error: function (e) { 
				// 전송 후 에러 발생 시 실행 코드
				console.log("ERROR : ", e); 
			}
		})
	}
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
	  });
</script>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>