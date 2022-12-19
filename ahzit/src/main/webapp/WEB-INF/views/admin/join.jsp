<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="관리자 생성" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<form action="join" method="post" >
  	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">관리자 생성</h1>
			</div>
		</div>
	</div>
  	
  	
  	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userId" class="form-control rounded" placeholder="아이디" required>
                	<label>
						아이디
					</label>
			</div>
		</div>
	 </div>
            
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
					<label>
					비밀번호
					</label>
				</div>
			</div>
		</div>
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg" type="submit">생성</button>
		 </div>
	</div>
              
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>