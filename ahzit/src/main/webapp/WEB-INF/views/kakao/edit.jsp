<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="카카오 입력" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>


<form action="insert" method="post" >
  	
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="p-4 text-dark bg-Light rounded">
				<h1 class="text-center">카카오</h1>
			</div>
		</div>
	</div>
  	
  	
  	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="text" name="userId" class="form-control rounded" placeholder="아이디" required>
                	<label>
						아이디
						<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
				<div class="valid-feedback">올바른 아이디 형식입니다</div>
				<div class="invalid-feedback">영문 소문자로 시작하고 숫자가 포함된 8~20자로 작성하세요</div>
				<div class="NNNNN">이미 사용 중인 아이디입니다.</div>
			</div>
		</div>
	 </div>
            
		
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" name="userPw" class="form-control rounded" placeholder="비밀번호" required>
					<label>
					비밀번호
 					<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
					<div class="valid-feedback">올바른 비밀번호 형식입니다</div>
					<div class="invalid-feedback">비밀번호는 특수문자, 숫자, 영문 대소문자가 반드시 1개 이상 포함된 8~16자로 작성하세요</div>
				</div>
			</div>
		</div>
		

	 <div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
			<div class="form-floating">
				<input type="password" id="userPw-re" class="form-control rounded" placeholder="비밀번호 확인" required>
					<label>
 					비밀번호 확인
					<i class="fa-solid fa-asterisk text-danger"></i>
					</label>
					<div class="valid-feedback">비밀번호가 일치합니다</div>
					<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
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
                    <div class="valid-feedback">올바른 닉네임 형식입니다</div>
                    <div class="invalid-feedback">닉네임은 한글 3~10글자로 작성하세요</div>
			</div>
		</div>
 	</div>
		
		<input type="hidden" name="certificationId" value="${certificationId}">
			
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
							
							<button class="send-btn btn btn-warning rounded text-light btn-m" disabled type="button" >인증번호 발송</button>
							<div class="valid-feedback">올바른 이메일 형식입니다.</div>
							<div class="invalid-feedback">이메일 형식을 확인해주세요</div>		
						</div>
						
					</div>  
						
				</div>
				
				<div class="cert"></div>
				
			</div>
		</div>
            
		
	 <div class="container mt-4">
		<div class="col-md-8 offset-md-2 mb-5 mt-3">
			<div class="text-center mb-3">
				<i class="fa-solid fa-tag"></i>&nbsp; 
				관심사 3가지를 설정하세요!
			</div>

			<div class="row row-cols-1 row-cols-md-3 g-10 my-2 text-center">
				<div class="col">
					<div class="my-2 myinterest">
						<label for="sort1">
               				<input  type="checkbox" name="userInterestSort" value="취미" id ="sort1" >
							<span>
							<img src="/images/sns.jpg">
							</span>
						</label>
					</div>
					<strong>
					취미
					</strong>
				</div>
				
				<div class="col">
					<div class="my-2">
						<label for="sort2">
                				<input  type="checkbox" name="userInterestSort" value="스터디" id ="sort2" >
								<span>
								<img src="/images/sns.jpg" class="image image-hover">
								</span>
						</label>
					</div>
					<strong>
					스터디
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort3">
                				<input  type="checkbox" name="userInterestSort" value="일상"  id ="sort3" style="display: none;">
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					일상
					</strong>
				</div>
		
				<div class="col">
					<div class="my-2">
						<label for="sort4">
                				<input type="checkbox" name="userInterestSort" value="팬클럽" id ="sort4"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					팬클럽
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort5">
                				<input type="checkbox" name="userInterestSort" value="음악" id ="sort5"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					음악
					</strong>
				</div>
	
				<div class="col">
					<div class="my-2">
						<label for="sort6">
                				<input type="checkbox" name="userInterestSort" value="스포츠" id ="sort6"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					스포츠
					</strong>
				</div>
	
				<div class="col">
					<div class="my-2">
						<label for="sort7">
                				<input type="checkbox" name="userInterestSort" value="여행" id ="sort7"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					여행
					</strong>
				</div>
			
				<div class="col">
					<div class="my-2">
						<label for="sort8">
                				<input type="checkbox" name="userInterestSort" value="맛집" id ="sort8"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					맛집
					</strong>
				</div>
				
				<div class="col">
					<div class="my-2">
						<label for="sort9">
                				<input type="checkbox" name="userInterestSort" value="영화" id ="sort9"  >
								<span>
								<img src="/images/sns.jpg">
								</span>
						</label>
					</div>
					<strong>
					영화
					</strong>
				</div>
			</div>
		</div>
	</div>
	    
	<div class="row mt-4">
		<div class="col-lg-4 offset-lg-4 col-md-6 offset-md-3 col-sm-8 offset-sm-2">
		<input class="btn btn-warning w-100 btn-lg rounded text-light join-btn" type="button" value="가입하기" onclick="submitChk();"/>
		 </div>
	</div>
              
</form>

<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>