<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- header --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="아지트 개설" name="title" />
</jsp:include>


<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
  //시군구 selectbox(javascript)
  $('document').ready(function() {
	  var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  var area3 = ["대덕구","동구","서구","유성구","중구"];
	  var area4 = ["광산구","남구","동구",     "북구","서구"];
	  var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	  var area6 = ["남구","동구","북구","중구","울주군"];
	  var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	  var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	  var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	  var area16 = ["서귀포시","제주시","남제주군","북제주군"];
	  // 시/도 선택 박스 초기화
	  $("select[name^=ahzitRegionHigh]").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	  $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.next().append("<option value=''>구/군 선택</option>");
	 });
	 // 시/도 선택시 구/군 설정
	 $("select[name^=ahzitRegionHigh]").change(function() {
	 	var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	 	var $gugun = $(this).next(); // 선택영역 구군 객체
	 $("option",$gugun).remove(); // 구군 초기화
	  if(area == "area0")
	  	$gugun.append("<option value=''>구/군 선택</option>");
	  else {
	  	$.each(eval(area), function() {
	  	$gugun.append("<option value='"+this+"'>"+this+"</option>");
	 });
	}
  });
});

	//소모임이름 입력 제어 (javascript)
	function ahzitName1() {
		//(주의) input 입력값을 value로 조회
		var tag = document.querySelector(".ahzitName-input");
		var text = tag.value;

		//글자수에 따라 다른 표시를 숫자로 구현
		var span = document.querySelector(".ahzitName-input-length");
		span.textContent = text.length;

		//15글자 초과시 빨간 글씨로 표현
		if (text.length > 15) {
			span.style.color = "red";
		} else {
			span.style.color = "black";
		}

		//15글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
		var size = text.length;
		while (size > 15) {
			tag.value = tag.value.substring(0, size - 1);
			size--;
		}
		span.textContent = size;
	}

	//소모임소개 입력 제어 (javascript)
	function ahzitInfo1() {
		//(주의) input 입력값을 value로 조회
		var tag = document.querySelector(".ahzitInfo-input");
		var text = tag.value;

		//글자수에 따라 다른 표시를 숫자로 구현
		var span = document.querySelector(".ahzitInfo-input-length");
		span.textContent = text.length;

		//200글자 초과시 빨간 글씨로 표현
		if (text.length > 200) {
			span.style.color = "red";
		} else {
			span.style.color = "black";
		}

		//200글자 초과시 입력 불가 처리 = 15글자 넘어가면 잘라내기
		var size = text.length;
		while (size > 200) {
			tag.value = tag.value.substring(0, size - 1);
			size--;
		}
		span.textContent = size;
	}

	//소모임이미지 (jquery)
	$(function() {
		$("[name=attachment]").change(function(e) {
			//input[type=file] 태그에는 files라는 속성이 존재
			console.log(this.files);
			if (this.files.length > 0) {
				//읽는 도구
				var reader = new FileReader();
				//읽을 때 해야할 작업
				reader.onload = function(e) {
					//읽은 내용 정보가 e에 들어 있음
					var preview = document.getElementById("preview")
					$(".preview").attr("src", e.target.result);
				};
				reader.readAsDataURL(this.files[0]);//읽어라
			}
		});
		$("button[name=thumbnail-delete]")
				.click(
						function() {
							$(".preview")
									.attr("src",
											"${pageContext.request.contextPath}/images/bg_default.png");
						});
		//취소버튼 클릭 시, 이전 페이지로 이동(jquery)
		$(".btn-edit-cancel").click(function() {
			history.back();
		});
	});
</script>

<style>

</style>

<div class="container-fluid ">
	<div class = "row">
		<div class = "col-8 offset-2 mt-5">
		
	<form action="create" method="post" enctype="multipart/form-data">
		<input name="ahzitLeader" value="${sessionScope.loginId}"
			type="hidden">
		<%-- <div class="row">
			<span>리더</span>
			<span name="ahzitLeader">${sessionScope.loginId}</span>
		</div> --%>

		<span class="fs-2">아지트  개설</span>
		
		<div class="row mt-4">
			<p class="fs-3">만들고 싶은 아지트를 선택하세요</p>
			<div class="row justify-content-center">
			
				<div class="fs-4">
					<input type="radio" name="ahzitSort" id="ex_rd1" value="취미" checked>
					<label for="ex_rd1">취미</label><br> 
					
					<input type="radio" name="ahzitSort" id="ex_rd2" value="스터디">
					<label for="ex_rd2">스터디</label><br> 
						
					<input type="radio" name="ahzitSort" id="ex_rd3" value="일상">
					<label for="ex_rd3">일상</label><br>
					
					<input type="radio" name="ahzitSort" id="ex_rd4" value="팬클럽">
					<label for="ex_rd4">팬클럽</label><br> 
					
					<input type="radio" name="ahzitSort" id="ex_rd5" value="음악">
					<label for="ex_rd5">음악</label><br>
					
					<input type="radio" name="ahzitSort" id="ex_rd6" value="스포츠">
					<label for="ex_rd6">스포츠</label><br> 
					
					<input type="radio" name="ahzitSort" id="ex_rd7" value="여행">
					<label for="ex_rd7">여행</label><br>
					
					<input type="radio" name="ahzitSort" id="ex_rd8" value="맛집">
					<label for="ex_rd8">맛집</label><br>
					
					<input type="radio" name="ahzitSort" id="ex_rd9" value="영화">
					<label for="ex_rd9">영화</label><br>
				</div>
			</div>
		</div>

		<%--아지트 이름 --%>
		<div class="row align-items-center mt-5">
			<p class="fs-3">아지트 이름을 입력해주세요</p>
			<div>
				<input name="ahzitName" class="ahzitName-input d-inline-flex form-control form-control-lg rounded"
					oninput="ahzitName1();" type="text" placeholder="아지트 이름 입력"
					autocomplete="off" required><br> 
					<span class="ahzitName-input-length">0</span> / 15<br>
				<br>
			</div>
		</div>

		<%--아지트 소개 --%>
		<div class="row align-items-center mt-5">
			<p class="fs-3">아지트 소개글을 입력해주세요</p>
		
			<div>
				<textarea name="ahzitInfo" class="ahzitInfo-input form-control rounded"
					oninput="ahzitInfo1();" type="text" placeholder="아지트 소개글 입력"
					autocomplete="off" style="height: 100px" required></textarea>
				<span class="ahzitInfo-input-length">0</span> / 200<br>
				<br>
			</div>
		</div>

		<div class="row align-items-center mt-5">
			<p class="fs-3">아지트 지역을 설정하세요</p>

				<%--지역선택 시/도 --%>
				<select class="form-select form-select-lg mb-3" name="ahzitRegionHigh" id="sido1"></select>
				<%--지역선택 군/구 --%>
				<select class="form-select form-select-lg mb-3" name="ahzitRegionLow" id="gugun1"></select>
		</div>


		<%--아지트 공개--%>
		<div class="row justify-content-center mt-5">
			<p class="fs-3">아지트의 공개 여부를 선택하세요</p>
			
			<div class="fs-4">
				<input type="radio" name="ahzitIspublic" value="N" checked>
				<label>공개 아지트</label> 
			</div>
			
			<div class="fs-4">
				<input type="radio" name="ahzitIspublic" value="Y">
				<label>비공개 아지트</label><br>
			</div>


		</div>


		<%--아지트 이미지--%>
		<div class="row justify-content-center mt-5">
			<p class="fs-3">아지트 이미지를 등록해주세요</p>
			
			<div class="row">
				<input id="input-file" type="file" name="attachment" class="form-control thumbnail">
			</div>
					
				
			<div class=col-3>	
				<img class="preview rounded float-start" src="${pageContext.request.contextPath}/images/bg_default.jpg" width="200" height="200">
			</div>

			<div class="col align-self-end img-btns">
				<label class="col input-file-upload img-lab" for="input-file" type="button">사진변경</label>
				<!-- <label class="col delete-file-upload img-btn" name="thumbnail-delete" type="button">삭제</label> -->
			</div>
			
		</div>

		<div class="row justify-content-center mt-5">
			<button type="submit" class="col btn-edit-cancel btn btn-outline-secondary rounded">취소</button>
			<button type="submit" class="col btn rounded" style="background-color : #E6E6E6; color:#3E4684;">개설하기</button>
		</div>
</div>
</form>
</div>
</div>


<%-- footer --%>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>