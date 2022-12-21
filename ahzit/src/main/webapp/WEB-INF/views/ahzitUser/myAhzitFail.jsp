<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%-- header --%>
<jsp:include page="/WEB-INF/views/template/ahzitUserHeader.jsp">
	<jsp:param value="my Ahzit" name="title"/>
</jsp:include>

<div class = "container-fluid mt-3">
	<div class = "row">
		<div class = "col-8 offset-2 main">
			<div class = "row">

				<div class="row mt-4">
					<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
						<div class="p-4 text-dark bg-Light rounded">
							<h1 class="text-center">My Ahzit</h1>	
						</div>
					</div>
				</div>
				
							<div class="p-4 text-dark bg-Light rounded">
								<h1 class="text-center">가입한 아지트가 없습니다.</h1>	
							</div>
				
	
				<div class="row mt-4 col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2 mb-4">
					<div class=" col" >
						<a href="mypage"  class="btn btn-outline-warning w-100" role=button>Mypage 이동</a>
					</div>
				</div>		
			</div>
		</div>
	</div>
</div>
<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
