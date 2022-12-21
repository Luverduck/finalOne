<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <style>
        * {
        	 /* border : 1px dotted gray;   */
           /*  font-family: 'Noto Sans KR', sans-serif;  */
            font-family: 'EsaManru';
            color :#3E4684;
            /* font-size : 16px !important; */
        }
        a {
			text-decoration: none;
		}
		a:link { color: #3E4684; }
		a:visited { color: #3E4684; }
		a:hover { color:  #3E4684; }
		a:active { color: #3E4684; } 
		.logo-img {
			width : 100%;
		}
		.header-style {
			 color :#3E4684;
		}
 		input::placeholder {
			color:#3E4684;
		}
		input:focus {
		    outline: 1px solid #3E4684;
		    border-radius : 2em;
		} 
		.search-bar {
			display: flex;
			flex-direction: row;
			position: relative;
		}
		.search-box {
			position : relative;
			border:2px solid #3E4684;
			border-radius: 2em; 
			width: 100%;
			height: 30px;
 			font-size: 16px;
			padding: 15px; 
		}
		.search-box > select > input{
			display: flex;
			flex-direction: row;
			flex-grow: 1;
			color :#3E4684;
		}
		.header-btn {
			position: absolute;
			margin:0.5em;
			padding:0;
			right: 0;     
			border : 0;
			background-color : white; 
		}
		.header-style {
		 	background-color : #EDEEF0; 
		}
		 .fixed {
            position: fixed;
            bottom:40px;
            right:40px;
        }
         .btn-create {
            width: 80px;
            height: 80px;
            border-radius : 50%;
            background-color: #3E4684;
            z-index : 99999;
        }
        .create-img {
        	 width:40px;
        	 margin : 0.9em 0.7em;
        }
		.create {
			color : white;
			font-size : 12px;
			margin:-1em;
			padding:0;
		}
    </style>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="${param.title}" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3 ">
	<div class = "btn-group">
		 <button class="btn dropdown-toggle" type="button" id="defaultDropdown" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false" style="background-color : #E6E6E6; color:#3E4684;">
	   	MYPAGE MENU
	  	</button>
	  	
	  	<ul class="dropdown-menu" aria-labelledby="defaultDropdown">
		    <li><a href = "${pageContext.request.contextPath}/ahzitUser/edit?userId=${loginId}" class = "btn w-100"  style="background-color : #E6E6E6; color:#3E4684;" role=button>개인정보 수정</a></li>
		    <li><a href = "${pageContext.request.contextPath}/ahzitUser/password?userId=${loginId}" class = "btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>비밀번호 변경</a></li>
		    <li><a href = "${pageContext.request.contextPath}/ahzitUser/goodbye?userId=${loginId}" class = "btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>회원탈퇴</a></li>
		    <li><a href = "${pageContext.request.contextPath}/inquire/list?inquireId=${loginId}" class = "btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>1:1 문의</a></li>
		    <li><a href = "${pageContext.request.contextPath}/ahzitUser/myAhzit" class = "btn w-100" style="background-color : #E6E6E6; color:#3E4684;"  role=button>내 아지트</a></li>
		</ul>
		
	</div>
</div>


<!-- 			<div class = "row mt-3"> -->
<!-- 				<div class = "col-2 offset-1 d-flex justify-content-center"> -->
<%-- 					<a href = "${pageContext.request.contextPath}/ahzitUser/edit?userId=${loginId}" class = "p-2 btn w-100"  style="background-color : #E6E6E6; color:#3E4684;" role=button>개인정보 수정</a> --%>
<!-- 				</div> -->
<!-- 				<div class = "col-2 d-flex justify-content-center"> -->
<%-- 					<a href = "${pageContext.request.contextPath}/ahzitUser/password?userId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>비밀번호 변경</a> --%>
<!-- 				</div> -->
<!-- 				<div class = "col-2 d-flex justify-content-center"> -->
<%-- 					<a href = "${pageContext.request.contextPath}/ahzitUser/goodbye?userId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>회원탈퇴</a> --%>
<!-- 				</div> -->
<!-- 				<div class = "col-2 d-flex justify-content-center"> -->
<%-- 					<a href = "${pageContext.request.contextPath}/inquire/list?inquireId=${loginId}" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;" role=button>1:1 문의</a> --%>
<!-- 				</div> -->
<!-- 				<div class = "col-2 d-flex justify-content-center"> -->
<%-- 					<a href = "${pageContext.request.contextPath}/ahzitUser/myAhzit" class = "p-2 btn w-100" style="background-color : #E6E6E6; color:#3E4684;"  role=button>내 아지트</a> --%>
<!-- 				</div> -->
<!-- 			</div> -->