<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="${ahzitVO.getAhzitName()}" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp"></jsp:include>

<style>
   body {
      background-color: #F5F5F5 !important;
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
   
   body {
      background-color: rgba(230, 230, 230, 100);
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
   .valid-feedback {
      color : green;
      font-size : 18px;
   }
   .invalid-feedback, #duplicate {
      color : red;
      font-size : 18px;
   }
</style>


<div class = "container-fluid mt-2 mb-2">
   <div class = "row">
      
      <div class = "col-8 offset-2">
         
         <div class = "row">

            <%-- ?????? ???????????? --%>
            <div class = "col-3">
               <jsp:include page="/WEB-INF/views/template/ahzit_left_side.jsp"></jsp:include>
            </div>

      <%-- ????????? ?????? --%>
        <div class = "col-6">
         <div class = "row">
            <div class = "col">
            
            <div class = "shadow div-member-info-list p-3 bg-white">
                  <p class="fs-3 mb-3">????????? ??? ?????? ??????</p>
                  <form id="ahzitJoin" action="${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/editMyInfo" method="post">

				<c:choose>
			      	<c:when test="${memberAttachmentList.isEmpty()}"><!-- ????????? ???????????? ???????????? ????????? ?????? -->
			      		<p class="fs-5">??????????????? ????????? ????????? ???????????? ????????? ?????????</p>
			      	</c:when>
			      	<c:otherwise>
			      		<p>????????? ???????????? ????????? ??? ????????????</p>
			      	</c:otherwise>
		      	</c:choose>
		      	
		      	<input type="file" name="attachment" id="input-file" class="thumbnail">
      			<c:choose>
      				<c:when test="${memberAttachmentList.isEmpty()}"><!-- ????????? ???????????? ???????????? ????????? ?????? -->
      					<img class="preview" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200"><br>
      				</c:when>
      			<c:otherwise><!-- ????????? ???????????? ???????????? ?????? -->
      				<c:forEach var = "memberAttachmentList" items = "${memberAttachmentList}">  <%--????????? ????????? --%>
			            <img class="preview" src = "${pageContext.request.contextPath}/attachment/download/ahzitMember?attachmentNo=${memberAttachmentList.attachmentNo}" width="200" height="200"> 					
			          </c:forEach>
      			</c:otherwise>
      			</c:choose>
      			
	      		 <div class="row img-btns mb-4">
                 	<label class="input-file-upload img-lab" for="input-file">????????????</label> 
	      		</div>

         <span class="fs-5 mb-3">????????? ??????</span><br>
            <input type="hidden" name="memberAhzitNo" value="${ahzitNo}">
               <input type="hidden" name="memberId" value="${loginId}">
               <input type="hidden" name="memberNo" value="${ahzitMemberDto.memberNo}">
               <input type="text" name="memberNick" value="${ahzitMemberDto.memberNick}" class="rounded">
               <div class="valid-feedback" >????????? ??? ?????? ??????????????????</div>
               <div class="invalid-feedback" >???????????? ?????? 3~10????????? ???????????????</div>
               <div id="duplicate" class="NNNNN">?????? ?????? ?????? ??????????????????</div><br>
               <button id="submitBtn" type="button" class="mt-2" onclick="submitChk();">?????? ??????</button>

            </form>
                  <div class="row">
                     <a href="${pageContext.request.contextPath}/ahzit_in/${ahzitMemberDto.memberNo}/deleteCommonMember" type="button"><i class="fa-solid fa-trash" style="color:red;"></i><span style="color:red">????????? ??????</span></a>
                  </div>
               </div>
            </div>
         </div>
   </div>
   
       <%-- ????????? ???????????? --%>
            <div class = "col-3">
               <div class = "row">
                  <div class = "div-right-side p-3 shadow bg-white">

                        <div style="height:43px;">
                        ???????????? ??????
                        <hr />
                     </div>
                     <div>
                        <c:forEach var="scheduleListRownum" items="${scheduleListRownum}">   
                           <div style="margin-bottom: 10px;">   
                              <span style="font-size:20px;">${scheduleListRownum.scheduleTitle}</span>
                              <br>
                              <span style="font-size:12px;">${fn:substring(scheduleListRownum.scheduleStart, 2, 4)}??? ${fn:substring(scheduleListRownum.scheduleStart, 5, 7)}??? ${fn:substring(scheduleListRownum.scheduleStart, 8, 10)}??? ${fn:substring(scheduleListRownum.scheduleStart, 11, 16)}</span>
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
    
     //?????? ??????
     var validChecker = {
         memberNickValid : false, 
         nicknameRegex : /^[???-???0-9]{2,10}$/
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
             //+???????????????(????????????)
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
             this.submit();//??????
         }
     });
     
 });
   
   //form??? ????????? ??? ????????????(judge)??? ????????? ????????? ??????
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
            alert("????????? ????????? ?????????????????????");
            window.location=("${pageContext.request.contextPath}/ahzit_in/"+memberAhzitNo);
         },
         error: function (e) { 
            // ?????? ??? ?????? ?????? ??? ?????? ??????
            console.log("ERROR : ", e); 
         }
      })
   }
   $(function(){
         $("[name=attachment]").change(function(e){
             //input[type=file] ???????????? files?????? ????????? ??????
             console.log(this.files);
             if(this.files.length > 0){
                 //?????? ??????
                 var reader = new FileReader();
                 //?????? ??? ????????? ??????
                 reader.onload = function(e){
                     //?????? ?????? ????????? e??? ?????? ??????
                     var preview = document.getElementById("preview")
                     $(".preview").attr("src", e.target.result);
                 };
                 reader.readAsDataURL(this.files[0]);//?????????
             }
         });     
     });
</script>