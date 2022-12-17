<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="카카오 입력" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


<form action="edit" method="post" autocomplete="off">

<input type="text" value="${kakaoId}">  	
<input type="text" value="${kakaoDto}">  	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">카카오 추가 입력</h1>
			</div>
		</div>
	</div>
	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
    			<input type="text" name="userNick" class="form-control rounded" placeholder="닉네임" required >
              		<label>
                    닉네임
                    <i class="fa-solid fa-asterisk text-danger"></i>
                    </label>
			</div>
		</div>
 	</div>
			
		<div class="row mt-4">
			<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			
				<div class="d-flex justify-content-center align-items-center flex-wrap mb-3">
				
					<div class=" d-flex justify-content-center align-items-center flex-fill mb-3 form-group">
						
						<div class="input-group form-floating">
						
							<input type="text" name="userEmail" class=" form-control rounded d-flex flex-fill" placeholder="이메일"  required>
							
							<label>
							이메일 
							<i class="fa-solid fa-asterisk text-danger"></i>
							</label>
						</div>
						
					</div>  
						
				</div>
				
			</div>
		</div>
		
		
 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<button class="btn btn-outline-warning rounded-pill w-100 btn-lg myId" type="submit">가입</button>
		 </div>
	</div>
		
              
</form>
  	

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>