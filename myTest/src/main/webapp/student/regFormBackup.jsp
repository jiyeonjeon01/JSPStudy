<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JYsite Register</title>

<script src="https://kit.fontawesome.com/abb02b8c73.js"
	crossorigin="anonymous"></script>
<script language="javascript" src="script.js"></script>
<link rel="stylesheet" href="styleBackup.css">
</head>

<body onload="onLoad();">
	<!-- header: 로고, 메뉴, 아이콘 -->
	<header>
		<div class="logo">
			<a href="#"> <i class="fa-solid fa-house" width="10%"></i> <span
				class="logoLetter">JY Site</span>
			</a>
		</div>
		<div class="menu">
			<ul>
				<li><a href="#">둘러보기</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">글쓰기</a></li>
				<li><a href="#">공지사항</a></li>
			</ul>
		</div>
		<div class="icon">
			<a href="#" class="icon1"><i class="fa-brands fa-instagram"></i></a>
			<a href="#" class="icon2"><i class="fa-brands fa-github"></i></a>
		</div>
	</header>

	<!-- 회전목마: 사진, 왼.오버튼, 섹션버튼 -->
	<div class="slideShow">
		<div class="slidePic">
			<a href="#"><img src="./media/slidePic1.png"></a> <a href="#"><img
				src="./media/slidePic2.png"></a> <a href="#"><img
				src="./media/slidePic3.png"></a> <a href="#"><img
				src="./media/slidePic4.png"></a> <a href="#"><img
				src="./media/slidePic5.png"></a>
		</div>
		<div class="slideSideIcon">
			<a href="#" class="prev"><i
				class="fa-solid fa-circle-chevron-left"></i></a> <a href="#"
				class="next"><i class="fa-solid fa-circle-chevron-right"></i></a>
		</div>
		<div class="slideFooterIcon">
			<a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
			<a href="#"><i class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
				class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
				class="fa-solid fa-circle-dot"></i></a> <a href="#"><i
				class="fa-solid fa-circle-dot"></i></a>
		</div>
	</div>



	<!-- main: nav, secion, aside -->
	<main>
		<!-- nav: 왼쪽 사이드바 -->
		<nav>
			<p class="textP">왼쪽 사이드바인 nav 부분입니다.</p>
		</nav>

<!--  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
		<!-- div 말고 테이블로 바꾸기 -->
		<form method="post" action="regProc.jsp" name="regForm">
			<!-- section: 가운데 메인 -->
			<section>
				<p class="mainTitle">JY Register</p>
				<br>
				<div class="mainDetail">

					<div class="idSec">
						<p class="idTitle">아이디</p>
						<div class="idDetail">
							<input type="text" name="id" class="idDetailInput"></input> &nbsp; 
							<input type="button" value="중복확인" onClick="idCheck()" />
						</div>

					</div>
					<div class="pwSec">
						<p class="pwTitle">비밀번호</p>
						<input type="text" class="pwDetail"></input>
					</div>

					<div class="repwSec">
						<p class="repwTitle">비밀번호 재확인</p>
						<input type="text" class="repwDetail"></input>
					</div>

					<div class="nameSec">
						<p class="nameTitle">이름</p>
						<input type="text" class="nameDetail"></input>
					</div>

					<div class="birthSec">
						<p class="birthTitle">생년월일</p>
						<div class="bithDetail">
							<input type="text" class="birthDetailYear" placeholder="년(4자)"></input>
							<select class="birthDetailMonth">
								<option value="">월</option>
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select> <input type="text" class="birthDetailDay"></input>
						</div>
					</div>

					<div class="genderSec">
						<p class="genderTitle">성별</p>
						<select class="genderDetail">
							<option value="">성별</option>
							<option value="01">남자</option>
							<option value="02">여자</option>
						</select>
					</div>

					<div class="emailSec">
						<p class="emailTitle">
							본인 확인 이메일<span id="soft">(선택)</span>
						</p>
						<input type="text" class="emailDetail" placeholder="선택입력"></input>
					</div>

					<div class="phoneSec">
						<p class="phoneTitle">휴대전화</p>
						<select class="phoneCountryDetail">
							<option value="01">대한민국 +82</option>
							<option value="02">미국 +1</option>
							<option value="03">중국 +86</option>
							<option value="04">일본 +81</option>
							<option value="05">러시아 +7</option>
							<option value="06">인도 +91</option>
						</select>
						<div class="phoneDetail">
							<input type="text" class="phoneDetailWrite"></input>
							<button class="phoneDetailSubmit">인증번호 받기</button>
							<span class="validationMessage"></span>
						</div>
						<input type="text" class="phoneCodeDetail"
							placeholder="인증번호를 입력하세요"></input>
					</div>

					<div class="zipCode">
						<p class="zipCodeTitle">우편번호</p>
						<br> <input type="text" name="zipcode" /> <input
							type="button" value="찾기" onClick="zipCheck()" />
					</div>

					<div class="address1">
						<p class="address1Title">주소1:</p>
						<input type="text" name="address1" size="50" />
					</div>

					<div class="address2">
						<p class="address2Title">주소2:</p>
						<input type="text" name="address2" size="50" />
					</div>

					<div>
						<!-- <!-- 아래는 참고 코드 -->
						<!--   <input id="btn-join" type="submit" value="회원가입" onclick="joinMember();">
                    <button class="registerBtn" type="submit" value="가입하기" onclick="submit();"> -->
						<input type="button" value="회원가입" onClick="inputCheck()" />&nbsp;&nbsp;
						<input type="reset" value="다시입력" />
					</div>

				</div>




			</section>
		</form>

		<!-- aside: 오른쪽 사이드바 -->
		<aside>
			<p id="textP">오른쪽 사이드바인 aside 부분입니다.</p>
		</aside>
	</main>



	<!-- footer: 맨 아래 푸터 -->
	<footer>
		<p id="textP">맨 아래 푸터인 footer 부분입니다.</p>
	</footer>
</body>
</html>