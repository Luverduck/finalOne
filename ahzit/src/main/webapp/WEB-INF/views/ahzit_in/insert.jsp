<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="소모임 가입" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
   <jsp:param value="소모임 가입" name="title"/>
</jsp:include>

<style>

   a {
      text-decoration: none;
   }
   
   body {
      background-color: rgba(230, 230, 230, 100);
   }

	.div-ahzit-info,
	.div-member-info-list,
	.div-right-side,
	.div-search-member-input {
		border-radius : 15px;
	}
	
	.ahzit-profile {
		width : 100px;
		height : 300px;
		border-radius : 15px;
	}
	#crown {
		width:20px;
	}
	.member-search {
		margin-right : 1.8em;
		background-color:transparent;
	}
	.btn-join {
		display : none;
	}
	.profile-img {
		width : 60px;
		border-radius : 50%;
	}
	
   .div-member-profile {
      width: 70px;
      height: 70px;
   }
   
   .img-member-profile {
      border-radius: 50%;
      width: 100%;
   }
   .div-editor-opener,
   .div-editor-input {
      border-radius: 10px;
      border-color : rgba(210, 210, 210);
      background-color: rgba(240, 240, 240, 50);
      padding-left: 2%;
      color: rgba(140, 140, 140, 140);
   }
   
   .div-board {
      background-color: white;
   }
   
   .div-board-top {
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
   }
   
   .div-board-bottom {
      border-bottom-left-radius: 10px;
      border-bottom-right-radius: 10px;
   }
   
   .p-writer-info {
      font-weight: 1000;
   }
   
   .div-icon-dropdown {
      width : 20px;
   }
   
   .button-board {
      cursor: pointer;
      align-content: center;
   }
   
   .icon-board, 
   .icon-editor-opener {
      color: black;
      font-size: 20px;
   }
   
   .ahzit-img {
      width : 400px;
      height : 400px;      
   }
   
   @keyframes heart-on {
        from {color:black;}
        to {color:#FF8681;}
        0% {transform: translate(0, 0%);}
        25% {transform: translate(0, 5%)}
        50% {transform: translate(0, -5%)}
        75% {transform: translate(0, 5%)}
        100% {transform: translate(0, 0%)}
    }
  
    .icon-board-like-on {
       animation-name: heart-on;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
   }
   
   @keyframes heart-off {
        from {color:#FF8681;}
        to {color:black;}
        0% {transform: translate(0, 0%);}
        25% {transform: translate(0, -5%)}
        50% {transform: translate(0, 5%)}
        75% {transform: translate(0, -5%)}
        100% {transform: translate(0, 0%)}
    }
  
    .icon-board-like-off {
       animation-name: heart-off;
        animation-fill-mode: forwards;
        animation-delay: 0s;
        animation-duration: 1s;
        animation-iteration-count: 1;
   }
</style>


<div class = "container-fluid mt-3">
	<div class = "row">
		
		<div class = "col-8 offset-2 main">
			
			<div class = "row">
         
      <%-- 왼쪽 사이드바 --%>
				<div class = "col-3">
          			<jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
				</div>
            
      <%-- 가운데 내용 --%>
      <div class = "col-6">
         <div class="row">
         	<div class = "col">
         
         <div class = "col col-6  shadow div-member-info-list w-100 p-3 bg-white">
         	<h3>아지트 가입하기</h3>
         	
         <div>
            <form id="ahzitJoin" action="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/insert" method="post" enctype ="multipart/form-data">
            
            <p class="fs-5">아지트에서 사용할 프로필 이미지를 등록해 주세요</p>
            <input type="file" name="attachment" id="input-file" class="thumbnail">
            <img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
                <div class="row img-btns">
                       <label class="input-file-upload img-lab" for="input-file">사진변경</label>        
                  <!--      <label class="delete-file-upload img-btn" name="thumbnail-delete" type="button">삭제</label><br><br> -->
                </div>
                
           <div class="fs-5 mt-4">아지트 닉네임 설정하기</div>
            <input type="hidden" name="memberAhzitNo" value="${ahzitNo}">
            <input type="hidden" name="memberId" value="${loginId}">
            <input type="text" name="memberNick">
            <div class="valid-feedback">사용할 수 있는 닉네임입니다</div>
            <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
            <div id="duplicate" class="NNNNN">이미 사용 중인 닉네임입니다</div>
            <button id="submitBtn" type="button" onclick="submitChk();">소모임 가입</button>
            </form>
         </div>
        </div>

      </div>
	</div>
</div>
 
     <%-- 오른쪽 사이드바 --%>
				<div class = "col-3">
					<div class = "row">
						<div class = "div-right-side p-3 shadow bg-white" >

						 	<div style="height:43px;">
								다가오는 일정
								<hr />
							</div>
							<div>
								<c:forEach var="scheduleListRownum" items="${scheduleListRownum}">	
									<div style="margin-bottom: 10px;">	
										<span style="font-size:20px;">${scheduleListRownum.scheduleTitle}</span>
										<br>
										<span style="font-size:12px;">${fn:substring(scheduleListRownum.scheduleStart, 2, 4)}년 ${fn:substring(scheduleListRownum.scheduleStart, 5, 7)}월 ${fn:substring(scheduleListRownum.scheduleStart, 8, 10)}일 ${fn:substring(scheduleListRownum.scheduleStart, 11, 16)}</span>
									</div>	
								</c:forEach>
							</div>

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
      
      //이미지
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
        });
   
    
      function submitChk(){
         var form = $("#ahzitJoin")[0];
         var data = new FormData(form);
         
         var memberAhzitNo=$("input[name='memberAhzitNo']").val();
         var memberId=$("input[name='memberId']").val();
         var memberNick=$("input[name='memberNick']").val();
         var attachment=$("input[name='attachment']").val();
                  
         $.ajax({
            url:'insert',
            type:'POST',
            data:data,
            contentType : false,
              processData : false,
            success:function(data){
               window.location=("${pageContext.request.contextPath}/ahzit_in/"+memberAhzitNo);
            },
            error: function (e) { 
               // 전송 후 에러 발생 시 실행 코드
               console.log("ERROR : ", e); 
            }
         })
      }
    
   
</script>