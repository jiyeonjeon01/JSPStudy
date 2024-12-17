<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JYsite Register</title>

<script src="https://kit.fontawesome.com/abb02b8c73.js"
	crossorigin="anonymous"></script>
<script language="javascript" src="script.js"></script>
<link rel="stylesheet" href="style.css">
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




		<form method="post" action="regProc.jsp" name="regForm">
			<table>
				<!-- 이게 잇어야 6:4 비율 적용됨 한번에 모두  -->
				<colgroup>
					<col style="width: 60%;">
					<!-- 첫 번째 열: 60% -->
					<col style="width: 40%;">
					<!-- 두 번째 열: 40% -->
				</colgroup>

				<!-- 1행 제목  -->
				<tr class="mainTitleSec">
					<th colspan="2">회원가입</th>
				</tr>

				<!-- 한줄 뛰기 -->
				<tr>
					<th colspan="2"></th>
				</tr>

				<!-- 2행 아이디 제목 -->
				<tr class="idTitleSec">
					<td colspan="2">아이디</td>
				</tr>

				<!-- 3행 입력창, @naver.com -->
				<tr class="idDetailSec">
					<td class="idDetailInput"><input type="text"
						class="idDetailInput2" name="id" placeholder="영어, 숫자 / 3~15자"
						onblur="validateId()"></td>
					<td><input type="button" class="idDetailBtn" value="중복확인"
						onClick="idCheck()" /></td>
					<td><span id="idError" class="error-message"></span></td>
				</tr>

				<!-- 4행 비밀번호 -->
				<tr class="pwTitleSec">
					<td colspan="2">비밀번호</td>
				</tr>

				<!-- 5행 비밀번호 입력창 -->
				<tr class="pwDetailSec">
					<td class="pwDetilInput" colspan="2"><input type="password"
						class="pwDetailInput2" name="pass" placeholder="영어, 숫자 / 6~15자"
						onblur="validatePassword()"></td>
					<td><span id="passError" class="error-message"></span></td>

				</tr>

				<!-- 6행 비밀번호확인 -->
				<tr class="pwReTitleSec">
					<td colspan="2">비밀번호 확인</td>
				</tr>

				<!-- 7행 비밀번호확인 입력창 -->
				<tr class="pwReDetailSec">
					<td class="pwReDetilInput" colspan="2"><input type="password"
						class="pwReDetailInput2" name="repass" placeholder="비밀번호 확인"
						onblur="validateRePassword()"></td>
					<td><span id="repassError" class="error-message"></span></td>
				</tr>

				<!-- 8행 이름 -->
				<tr class="nameTitleSec">
					<td colspan="2">이름</td>
				</tr>

				<!-- 9행 이름입력창 -->
				<tr class="nameDetailSec">
					<td class="nameDetailInput" colspan="2"><input type="text"
						class="nameDetailInput2" placeholder="이름"></td>
				</tr>

				<!-- 10행 생년월일  -->
				<tr class="birthTitleSec">
					<td colspan="2">생년월일</td>
				</tr>

				<!-- 11행 생년월일select -->
				<tr class="birthDetailSec">
					<td class="birthDetailSelect" colspan="2"><input type="date"
						name="date" id="date" value="2001-12-17"> <br></td>

				</tr>

				<!-- 12행 성별 -->
				<tr class="genderTitleSec">
					<td colspan="2">성별</td>
				</tr>

				<!-- 13행 성별select -->
				<tr class="genderDetailSec">
					<td colspan="2"><select class="genderDetailSelect">
							<option value="">성별</option>
							<option value="male">남자</option>
							<option value="female">여자</option>
					</select></td>
				</tr>

				<!-- 14행 이메일  -->
				<tr class="emailTitleSec">
					<td colspan="2">이메일</td>
				</tr>

				<!-- 15행 이메일입력창 -->
				<tr class="emailDetailSec">
					<td class="emailDetailInput"><input type="text" name="email"
						class="emilDetailInput2" placeholder="ex) abc123@naver.com"></td>
					<td><span id="emailError" class="error-message"></span></td>
				</tr>

				<!-- 16행 휴대전화 -->
				<tr class="phoneTitleSec">
					<td colspan="2">휴대전화</td>
				</tr>

				<!-- 17행 나라select, 번호입력창 -->
				<tr class="phoneDetailSec">
					<td class="phoneDetailNumber"><input type="text" name="phone"
						class="phoneDetailInput2" placeholder="ex) 010-1234-5678"
						onblur="validatePhone()"></td>
					<td><span id="phoneError" class="error-message"></span></td>
					<td class="phoneDetailCountry"><select
						class="phoneCountryDetailSelect">
							<option value="01">대한민국 +82</option>
							<option value="02">미국 +1</option>
							<option value="03">중국 +86</option>
							<option value="04">일본 +81</option>
							<option value="05">러시아 +7</option>
							<option value="06">인도 +91</option>
					</select></td>
				</tr>

				<!-- 18행 주소입력  -->
				<tr class="addressTitleSec">
					<td colspan="2">주소</td>
				</tr>

				<!-- 19행 우편번호 찾기 -->
				<tr class="addressDetailSec">
					<td class="addressDetailInput1"><input type="text"
						class="addressDetail1" name="zipcode" placeholder="우편번호" /></td>
					<td class="addressDetailInput2"><input type="button"
						class="addressDetail2" value="우편번호 찾기" onClick="zipCheck()" /></td>
				</tr>

				<tr class="addressDetailSec2">
					<td class="addressDetailInput3"><input type="text"
						class="addressDetail3" name="address1" placeholder="주소 입력" /></td>
					<td class="addressDetailInput4"><input type="text"
						class="addressDetail4" name="address2" placeholder="상세 주소 입력" />
					</td>
				</tr>


				<!-- 20행 가입버튼  -->
				<tr class="registerBtnSec">
					<td colspan="2">
						<!-- <button class="registerBtn" type="submit" value="가입하기" onclick="submit();" > 
						가입하기
					</button> --> <input type="button" class="registerBtn1"
						value="회원가입" onClick="inputCheck()" />
					</td>
				</tr>
			</table>
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