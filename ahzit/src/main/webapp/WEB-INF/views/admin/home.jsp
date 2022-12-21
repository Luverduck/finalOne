<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 홈" name="title"/>
</jsp:include>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/rest/admin/ahzitUserCount",
		method : "get",
		dataType : "json", 
		success : function(resp) {
			// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
			var labels = [];
			var values = [];

			for (var i = 0; i < resp.length; i++) {
				labels.push(resp[i].userJoinDate);
				values.push(resp[i].userCnt);

			}
			// labels 와 values 를 사용해서 차트를 생성
			const ctx = document.querySelector('#ahzitUserCount');
			const myChart = new Chart(ctx, {
				type : 'line', 
				//         	'doughnut'(도넛모양) 차트 모양
				data : { // 차트에 들어갈 내용 
					labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
					datasets : [ {
						label : '회원 가입 수',
						data : values,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		},
	})
	
		$.ajax({
		url : "${pageContext.request.contextPath}/rest/admin/ahzitSortCount",
		method : "get",
		dataType : "json", 
		success : function(resp) {
			// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
			var labels = [];
			var values = [];

			for (var i = 0; i < resp.length; i++) {
				labels.push(resp[i].ahzitSort);
				values.push(resp[i].cnt);

			}
			// labels 와 values 를 사용해서 차트를 생성
			const ctx = document.querySelector('#ahzitSortCount');
			const myChart = new Chart(ctx, {
				type : 'doughnut', 
				//         	'doughnut'(도넛모양) 차트 모양
				data : { // 차트에 들어갈 내용 
					labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
					datasets : [ {
						label : '관심사',
						data : values,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		},
	})
	
	$.ajax({
		url : "${pageContext.request.contextPath}/rest/admin/ahzitHeadCount",
		method : "get",
		dataType : "json", 
		success : function(resp) {
			// 비어있는 배열 2개를 만들고 resp 의 데이터를 분산 저장
			var labels = [];
			var values = [];

			for (var i = 0; i < resp.length; i++) {
				labels.push(resp[i].ahzitName);
				values.push(resp[resp.length-1-i].rn);

			}
			// labels 와 values 를 사용해서 차트를 생성
			const ctx = document.querySelector('#ahzitHeadCount');
			const myChart = new Chart(ctx, {
				type : 'bar', 
				//         	'doughnut'(도넛모양) 차트 모양
				data : { // 차트에 들어갈 내용 
					labels : labels, // 우측 labels 은 배열을 임의로 지정한 이름
					datasets : [ {
						label : '아지트',
						data : values,
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1
					} ]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});
		},
	})
	
	
});
</script>

<div class = "container-fluid mt-3">
	<div class = "row text-center">
		<div class = "col-8 offset-2">
			<div class = "row mt-4">
				<div class = "col">
					<h3>일자 별 회원 가입 현황</h3>
					<canvas id="ahzitUserCount"></canvas>
				</div>
	
				<div class = "col">
					<h3>아지트 별 관심사 현황</h3>
					<canvas id="ahzitSortCount"></canvas>
				</div>

				<div class = "col">
					<h3>회원수 순 아지트</h3>
					<canvas id="ahzitHeadCount"></canvas>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<div class = "container-fluid mt-3 text-center">
		<div class = "row">
			<div class = "col-8 offset-2">
				<div class="row center">
				<h3>NOTICE</h3>
				<small><a class="btn"  href="${pageContext.request.contextPath}/notice/list">[더보기]</a></small>
				</div>
				<div class="row">
					<table class="table table-border">
						<thead>
							<tr>
								<th>공지번호</th>
								<th class="w-50">제목</th>
								<th>조회수</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach var="noticeList" items="${noticeList}">
								<tr>
									<td>${noticeList.noticeNo}</td>
									<td>
										<a href="${pageContext.request.contextPath}/notice/detail?noticeNo=${noticeList.noticeNo}">
											${noticeList.noticeTitle}
										</a>
									</td>		
									<td>${noticeList.noticeRead}</td>		
									<td>
										<c:set var="current">
											<fmt:formatDate value="${noticeList.noticeWritedate}" pattern="yyyy-MM-dd"/>
										</c:set>
										<c:choose>
											<c:when test="${today == current}">
												<fmt:formatDate value="${noticeList.noticeWritedate}" 
																		pattern="HH:mm"/>
											</c:when>
											<c:otherwise>
												<fmt:formatDate value="${noticeList.noticeWritedate}" 
																		pattern="yyyy-MM-dd"/>
											</c:otherwise>
										</c:choose>
									</td>	
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class = "container-fluid mt-3 mb-3 text-center">
		<div class = "row">
			<div class = "col-8 offset-2">
				<div class="row center">
				<h3>INQUIRE</h3>
				<small><a class="btn"  href="${pageContext.request.contextPath}/admin/inquire">[더보기]</a></small>
				</div>
				<div class="row">
					<table class="table table-border">
						<thead>
							<tr>
								<th>문의글번호</th>
								<th>제목</th>
								<th>문의자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="text-center" >
				       		<c:forEach var="inquireList" items="${inquireList}">
								<tr>
									<td>${inquireList.inquireNo}</td>
									<td>
	 									<a href="${pageContext.request.contextPath}/inquire/detail?inquireNo=${inquireList.inquireNo}">
											${inquireList.inquireTitle}
										</a>
									</td>
									<td>${inquireList.inquireId}</td>
									<td>${inquireList.inquireWritedate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>