<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="아지트 관리" name="title"/>
</jsp:include>

<style>
.pagination{
justify-content : center
}
</style>

	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">아지트 관리</h1>	
			</div>
		</div>
	</div>
	
<div class="text-center mt-3 mb-4">

 <div class="row mt-4">
	 	<div class="col-md-10 offset-md-1">
			<table class="table table-hover">
				<tbody class="text-center" >
					<tr>
						<th>번호</th>
						<td>${ahzitSelect.ahzitNo}</td>
					</tr>
					<tr>
						<th>아지트명</th>
						<td>${ahzitSelect.ahzitName}</td>
					</tr>
					<tr>
						<th>개설자</th>
						<td>${ahzitSelect.ahzitLeader}</td>
					</tr>
					<tr>
						<th>관심사</th>
						<td>${ahzitSelect.ahzitSort}</td>
					</tr>
					<tr  height="200" valign="top">
						<th>소개</th>
						<td>${ahzitSelect.ahzitInfo}</td>
					</tr>
					<tr>
						<th>인원수</th>
						<td>${ahzitSelect.ahzitHead}</td>
					</tr>
					<tr>
						<th>지역</th>
						<td>
							${ahzitSelect.ahzitRegionHigh}
							${ahzitSelect.ahzitRegionLow}
						</td>
					</tr>
					<tr>
						<th>좋아요수</th>
						<td>${ahzitSelect.ahzitLike}</td>
					</tr>
					<tr>
						<th>등급</th>
						<td>${ahzitSelect.ahzitGrade}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
 </div>
			      
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>