<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">	
	<title>
		<c:choose>
			<%-- title이라는 변수의 값이 있다면(null이 아니면) title에 입력될 값은 해당 title 변수의 값으로  --%>
			<c:when test = "${param.title != null}">
				${param.title}
			</c:when>
			<c:otherwise>
				Ahzit
			</c:otherwise>
		</c:choose>
	</title>
	
	<style>
	
        a {
			text-decoration: none;
		}
		.ahzit-header-style {
			background-color : #E4E4E4;
		}
		.img-member-picture {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }

        .modal-i-member-grade-leader {
            width: 1em;
        }

        .modal-member-nick {
            font-size: 24px;
        }

        .div-modal-content-member-info{
            border-radius: 15px;
        }

        .div-modal-body-member-info{
            border  : 50px #3E4684 !important;
        }
        .member-profile {
        	cursor: pointer;
        }
    </style>
</head>
<body>

<c:set var="login" value="${loginId != null}"></c:set>
<%-- 
<div class = "container-fluid py-2" style="background-color:#FFA91C;">

	<div class = "row mt-1">
		<div class = "col-1 offset-2 d-flex justify-content-center">
			<a href="${pageContext.request.contextPath}/" class = "d-flex align-items-center" style="color:white;" >홈(로고)</a>
		</div>
		
		<div class = "col-2 d-flex bg-white rounded py-1">

			<div class = "col-11 me-1" style="color: white;">
				<input class = "w-100 border-0 bg-white ps-3 input-allsearch" placeholder = "아지트 검색">
			</div>
			<div class = "col-1 bg-white">
				<button class = "fa-solid fa-magnifying-glass w-100 border-0 bg-white btn-allsearch-submit" style="color: #75758B;"></button>

			</div>
		</div>
	
		<div class = "col-3 offset-2 d-flex">
			<div class = "col d-flex justify-content-center align-items-center">

				<a href = "${pageContext.request.contextPath}/search" class = "d-flex align-items-center" style="color:white;">찾기</a>

			</div>
			<c:choose>
			<c:when test="${login}">
				<div class = "col d-flex justify-content-center">
        
					<a href="${pageContext.request.contextPath}/ahzitUser/logout" class = "d-flex align-items-center logout" style="color:white;">로그아웃</a>

				</div>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/mypage" class = "d-flex align-items-center" style="color:white;">마이페이지</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/login" class = "d-flex align-items-center" style="color:white;">로그인</a>
				</div>
				<div class = "col d-flex justify-content-center">
					<a href="${pageContext.request.contextPath}/ahzitUser/join" class = "d-flex align-items-center" style="color:white;">회원가입</a>
				</div>
			</c:otherwise>
			</c:choose>
		</div>
	</div> --%>

<div class = "container-fluid">	
	<div class = "row mt-1 ahzit-header-style">
		<div class = "col-2 offset-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}" class = "p-2">게시글</a>
			<!-- <a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitDto.ahzitNo}">게시글</a> -->
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/calendar" class = "p-2">일정</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/attachment" class = "p-2">첨부</a>
		</div>
		<div class = "col-2 d-flex justify-content-center">
			<a href = "${pageContext.request.contextPath}/ahzit_in/${ahzitNo}/member" class = "p-2">멤버</a>
		</div>
	</div>
	
</div>

<!-- 회원 정보 모달 -->
<div class="modal fade" id="modal-member-info" tabindex="-1" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content div-modal-content-member-info">
           <!-- 모달 바디 -->
           <div class="modal-body"> <!-- 붙일 영역-->
               <div class="container-fluid px-1 py-0 div-modal-body-member-info">
                   <div class="row d-flex justify-content-end flex-fill">
                       <!-- X 버튼 -->
                       <button type="button" class="btn-close modal-member-info-close" aria-label="Close"></button>
                   </div>

                   <div class="row modal-member-info-attach">
                       
                   </div>
               </div>
           </div>
        </div>
    </div>
</div>



<script>

	$(function(){
		$(document).on("click", ".member-profile", function(){
			// 로그인 중인 회원의 회원 번호
			var memberNo = $(this).data("writerno");
			// 현재 접속중인 소모임 페이지의 소모임 번호
			var ahzitNo = $("#div-member-info").data("ahzitno");
			
			console.log(memberNo);
			
			var target = $(".modal-member-info-attach");
			
			target.empty();
			
			// 비동기 조회
			axios({
				url : "http://localhost:8888/rest/ahzitMember/member_info?memberNo=" + memberNo + "&ahzitNo=" + ahzitNo,
				method : "get"
			})
			.then(function(response){
				console.log(response);
				
				var div_img_outer_container = $("<div>").attr("class", "col-10 offset-1");
				
				var div_img_inner_container = $("<div>").attr("class", "d-flex align-itmes-center justify-content-center mt-3 div-member-pircutre");
				
				var img_member_picture = $("<img>").attr("class", "img-member-picture").attr("src", "${pageContext.request.contextPath}/attachment/download/ahzitMember?attachmentNo=" + response.data.memberAttachmentNo);
				var div_img_inner = div_img_inner_container.append(img_member_picture);
				// 1)
				var div_img = div_img_outer_container.append(div_img_inner);
				
				var div_member_nick_container = $("<div>").attr("class", "col-12 d-flex justify-content-center align-items-center mt-3 mb-1");
				var span_member_nick = $("<span>").attr("class", "modal-member-nick me-1").text(response.data.memberNick);
				// 2)
				var div_member_nick = div_member_nick_container.append(span_member_nick);
				
				var div_member_info = $("<div>").attr("class", "col-12 d-flex justify-content-center align-items-center mb-2");
				if(response.data.memberGrade == "개설자") {
					var img_member = $("<img>").attr("class", "modal-i-member-grade-leader me-2").attr("src", "${pageContext.request.contextPath}/images/crown.png");	
					div_member_info.append(img_member);
				}
				var span_member_grade = $("<span>").attr("class", "modal-member-grade").text(response.data.memberGrade);
				div_member_info.append(span_member_grade);
				
				
				var div_member_since_container = $("<div>").attr("class", "col-12 d-flex justify-content-center align-items-center mb-2");
				var span_member_since = $("<span>").attr("class", "modal-member-since").text(response.data.memberJoindate);
				// 4)
				var div_member_since = div_member_since_container.append(span_member_since);
				
				var div_img_outer = div_img_outer_container.append(div_img).append(div_member_nick).append(div_member_info).append(div_member_since);
				
				target.append(div_img_outer);
				
				$("#modal-member-info").modal("show"); 
				
			});
		});
	
		$(".modal-member-info-close").click(function(){
			$("#modal-member-info").modal("hide");
		});
	});
</script>