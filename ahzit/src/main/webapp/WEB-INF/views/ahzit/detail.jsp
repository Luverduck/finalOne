<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzit_header.jsp">
	<jsp:param value="소모임 홈 - 비회원" name="title"/>
</jsp:include>

<style>
	.row, .col {
		border: gray dotted;
	}
	
	.input-group-text {
		background-color: #FED164;
		border-radius: 10px;
	}
	
	#ahzit-background {
		background-color: rgba(230, 230, 230, 100);
	}
	
	#ahzit-board-outer {
		background-color: rgba(230, 230, 230, 100);
		border-radius: 10px;
	}
	
	#ahzit-board-content {
		background-color: rgba(230, 230, 230, 100);
		border-radius: 10px;
	}
	
	#profile-member {
		border-radius: 50%;
	}
	.chal-img {
		width : 250px;
		height : 250px;		
	}
</style>

<%-- 아지트 가입을 위한 폼 --%>
<div class = "container">
	<div class = "row">
	
		<%-- 왼쪽 사이드바 --%>
		<div class = "col col-3" style="background-color: green;">
			<%-- 아지트 정보 --%>     	
      		<div class = "row">
        		아지트 이름 : ${ahzitVO.getAhzitName()} <br>
				아지트 소개 : ${ahzitVO.getAhzitInfo()}<br>
				아지트 멤버 : ${ahzitVO.getAhzitHead()} 명<br>
				아지트 종류 : ${ahzitVO.getAhzitSort()}<br>
				아지트 리더 : ${ahzitVO.getAhzitLeader()}<br>
      		</div>
		</div> 
		
		<%-- 가운데 내용 --%>
		<div class = "col-6">
			비회원용 소모임 정보 페이지ㄴ
		</div>
		
		<%-- 오른쪽 사이드바 --%>
		<div class = "col col-3" style="background-color: green;">
			dd
		</div>
		
	</div>
</div>