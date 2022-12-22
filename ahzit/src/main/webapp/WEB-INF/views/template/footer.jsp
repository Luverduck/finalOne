<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 하단 정보 --%>
<style>
	footer {
		background-color : #EDEEF0; 
		font-size : 12px;
		color : #9B9BA0;
	}
	a {
		color : #9B9BA0;
	}
/* 	* {
		border: 1px dotted gray;
	} */
</style>

 <footer>
      <!-- Grid container -->
      <div class="container-fluid p-0">
        <!-- Section: Links -->
        <section>
          <!--Grid row-->
          <div class="col-8 offset-2 d-flex">
            <!-- Grid column -->
            <div class="col-md-3 col-lg-3 col-xl-3 mt-3 mx-auto">
              <h6 class="text-uppercase mb-4 font-weight-bold">
                About Ahzit
              </h6>
              <br>
              <p>
                	<img src="/images/people.png" class="ms-3" width="70px;", height="70px;" >
              </p>
            </div>
            <!-- Grid column -->
  
            <hr class="w-100 clearfix d-md-none col-8 offset-2" />
  
            <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2  mt-3 mx-auto">
              <h6 class="text-uppercase mb-4 font-weight-bold">Enjoy</h6>
              <p>
                <a href="${pageContext.request.contextPath}/search"><i class="fa-solid fa-chevron-right"></i>Search</a>
              </p>
              <p>
                <a href="${pageContext.request.contextPath}/ahzitUser/join"><i class="fa-solid fa-chevron-right"></i>Join</a>
              </p>
              <p>
                <a href="${pageContext.request.contextPath}/ahzitUser/login"><i class="fa-solid fa-chevron-right"></i>Login</a>
              </p>
            </div>
            
             <!-- Grid column -->
            <div class="col-md-2 col-lg-2 col-xl-2  mt-3 mx-auto">
              <h6 class="text-uppercase mb-4 font-weight-bold">Service</h6>
              <p>
                <a href="${pageContext.request.contextPath}/notice/list"><i class="fa-solid fa-chevron-right"></i>Notice</a>
              </p>
              <p>
                <a href="${pageContext.request.contextPath}/faq/list"><i class="fa-solid fa-chevron-right"></i>FAQ</a>
              </p>
            </div>
         
  
            <!-- Grid column -->
            <hr class="w-100 clearfix d-md-none " />
  
            <!-- Grid column -->
            <div class="col-md-4 col-lg-3 col-xl-3 mt-3 mx-auto">
              <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
              <p><i class="fas fa-home mr-3"></i> 서울특별시 영등포구 선유동2로 57 이레빌딩</p>
              <p><i class="fas fa-envelope mr-3"></i> https://github.com/Luverduck/finalOne.git</p>
              <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
              <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
            </div>
            <!-- Grid column -->
          </div>
          <!--Grid row-->
        </section>
        <!-- Section: Links -->
  
        <hr class="my-3 col-8 offset-2">
  
        <!-- Section: Copyright -->
        <section class="pt-0 ">
          <div class="d-flex align-items-center">
            <!-- Grid column -->
            <div class="col-md-7 col-lg-8 text-center text-md-start col-8 offset-2">
              <!-- Copyright -->
              <div>
                © 2020 Copyright:
                <a href="https://mdbootstrap.com/">MDBootstrap.com</a>
              </div>
              <!-- Copyright -->
            </div>
            <!-- Grid column -->
  			</div>
          </div>
        </section>
        <!-- Section: Copyright -->
      <!-- Grid container -->
    </footer>
    <!-- Footer -->
    
<%--  <div class = "container-fluid mt-5">
	<div class = "row">
		<h2>Session에 대한 정보</h2>
	</div>
	<div class = "row">
		로그인 아이디 : ${sessionScope.loginId}<br>
	</div>
	<div class = "row">
		로그인 등급 : ${sessionScope.loginGrade}<br>
	</div>
	<div class = "row">
		로그인 여부 : ${sessionScope.loginId != null}<br>
	</div>
</div>  --%>

</body>
</html>