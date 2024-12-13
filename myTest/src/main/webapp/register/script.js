/*회원가입폼 아이디검색*/
function idCheck() {
	let value = document.regForm.id.value;
	if (value === "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
	} else {
		url = "idCheck.jsp?id=" + value;
		window.open(url, "post", "width=500,height=300");
	}
}
/*회원가입폼 주소체크*/
function zipCheck() {
	url = "zipCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no ,width=600 ,height=300, directories=no,status=yes,scrollbars=yes,menubar=no");
}
/*회원가입폼 동체크*/
function dongCheck() {
	let value = document.zipForm.dong.value;
	if (value === "") {
		alert("동이름을 입력해 주세요.");
		document.zipForm.dong.focus();
		return;
	}
	document.zipForm.submit();
}
/*주소내용을 불러주는 윈도우창 각 요소저장*/
function sendAddress(zipcode, sido, gugun, dong, bunji) {
	var address = sido + " " + gugun + " " + dong + " " + bunji;
	opener.document.regForm.zipcode.value = zipcode;
	opener.document.regForm.address1.value = address;
	self.close();
}
/*회원가입폼 패턴검색*/
function inputCheck() {
	if (document.regForm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.id.focus();
		return;
	}
	if (document.regForm.pass.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.pass.focus();
		return;
	}
	if (document.regForm.repass.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regForm.repass.focus();
		return;
	}
	if (document.regForm.pass.value !=
		document.regForm.repass.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.repass.focus();
		return;
	}
	if (document.regForm.name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regForm.name.focus();
		return;
	}
	if (document.regForm.phone1.value == "") {
		alert("통신사를 입력해 주세요.");
		document.regForm.phone1.focus();
		return;
	}
	if (document.regForm.phone2.value == "") {
		alert("전화번호을 입력해 주세요.");
		document.regForm.phone2.focus();
		return;
	}
	if (document.regForm.phone3.value == "") {
		alert("전화번호을 입력해 주세요.");
		document.regForm.phone3.focus();
		return;
	}
	if (document.regForm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.email.focus();
		return;
	}
	const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
	var email = document.regForm.email.value;
	if (pattern.test(email) === false) {
		alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
		document.regForm.email.focus();
		return;
	}
	
	if (document.regForm.zipcode.value == "") {
		alert("우편번호를 입력해 주세요.");
		document.regForm.zipcode.focus();
		return;
	}
	if (document.regForm.address1.value == "") {
		alert("주소를 입력해 주세요.");
		document.regForm.address1.focus();
		return;
	}
	if (document.regForm.address2.value == "") {
		alert("세부주소를 입력해 주세요.");
		document.regForm.address2.focus();
		return;
	}
	document.regForm.submit();
}







function onLoad() {
    // 슬라이드 시작 ~ 
    // 화면 객체 가져온다.
    let slideshow = document.querySelector(".slideShow");
    let slidePic = document.querySelector(".slidePic");
    let picArr = document.querySelectorAll(".slidePic a");
    let prev = document.querySelector(".prev");
    let next = document.querySelector(".next");
    let slideFooterIcon = document.querySelectorAll(".slideFooterIcon a");

    // 현재 이미지 인덱스, 인터벌 아이디, 슬라이드 개수
    let currentIndex = 0; 
    let timerID = null; 
    let slideCount = picArr.length;

    // 현재 이미지를 한 줄로 정렬한다.
    function initSlides() {
        for (let i=0; i<slideCount; i++) {
            picArr[i].style.left = `${i * 100}%`;
        }
        gotoslide(currentIndex); // 초기 슬라이드 설정
    }

    // 화면 전환 해주는 함수
    function gotoslide(index) {
        // 현재 인덱스를 업데이트합니다.
        currentIndex = index;

        // 슬라이드를 왼쪽으로 이동합니다.
        let newLeft = `${index * -100}%`;
        slidePic.style.transform = `translateX(${newLeft})`;

        // indicator 그 위치를 가리켜줘야 한다. 
        slideFooterIcon.forEach((icon, i) => {
            icon.classList.toggle('active', i === index);
        });
    }

    // 3초마다 gotoslide() 불러주자. 
    function startTimer() {
        timerID = setInterval(() => {
            currentIndex = (currentIndex + 1) % slideCount; // 다음 슬라이드로 이동
            gotoslide(currentIndex);
        }, 1000); // 3초 간격으로 변경
    }

    initSlides(); // 슬라이드 초기화
    startTimer(); // 타이머 시작

    // 이벤트 등록 핸들러 기능
    function stopTimer() {
        clearInterval(timerID);
    }

    function resumeTimer() {
        startTimer();
    }

    // 마우스 이벤트 처리
    slidePic.addEventListener("mouseenter", stopTimer);
    slidePic.addEventListener("mouseleave", resumeTimer);
    prev.addEventListener("mouseenter", stopTimer);
    prev.addEventListener("mouseleave", resumeTimer);
    next.addEventListener("mouseenter", stopTimer);
    next.addEventListener("mouseleave", resumeTimer);
    
    // 이전 슬라이드 버튼 클릭 시
    prev.addEventListener("click", (event) => {
        event.preventDefault();
        currentIndex = (currentIndex - 1 + slideCount) % slideCount; // 이전 슬라이드로 이동
        gotoslide(currentIndex);
    });

    // 다음 슬라이드 버튼 클릭 시
    next.addEventListener("click", (event) => {
        event.preventDefault();
        currentIndex = (currentIndex + 1) % slideCount; // 다음 슬라이드로 이동
        gotoslide(currentIndex);
    });

    // 슬라이드 인디케이터 클릭 시
    slideFooterIcon.forEach((icon, index) => {
        icon.addEventListener("mouseenter", stopTimer);
        icon.addEventListener("mouseleave", resumeTimer);
        icon.addEventListener("click", (event) => {
            event.preventDefault();
            gotoslide(index); // 해당 인덱스로 이동
        });
    });

    initSlides(); // 슬라이드 초기화
    // ~ 슬라이드 종료









   // 회원가입 폼 시작 
    //패턴 검색
    const idPattern = /^[\w]{3,}$/; // 영문자, 숫자, _만 입력 가능, 3글자 이상
    const pwdPattern = /^[\w]{6,10}$/; // 영문자와 숫자, _ 6~10자
    const namePattern = /^[가-힣]{2,4}|[A-Z]{1}[a-zA-Z\x20]{1,19}$/; // 한글 2~4자, 영어 2~20자 (첫 글자는 대문자)
    const emailPattern = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
    const mobilePattern = /^010-(?:[\d]{3}|[\d]{4})-[\d]{4}$/;

    // 객체 찾기
    const inputID = document.querySelector(".idDetailInput");
    const inputPW1 = document.querySelector(".pwDetail");
    const inputPW2 = document.querySelector(".repwDetail");
    const inputName = document.querySelector(".nameDetail");
    const inputEmail = document.querySelector(".emailDetail");
    const inputMobile = document.querySelector(".phoneDetailWrite");
    const myform = document.querySelector(".mainDetail");

    // 이벤트 리스너 등록 및 핸들러 처리
    inputID.addEventListener("blur", () => validate(inputID, idPattern, "영문자, 숫자, _만 입력 가능"));
    inputPW1.addEventListener("blur", () => validate(inputPW1, pwdPattern, "영문자와 숫자, _ 6~10자"));
    inputPW2.addEventListener("blur", () => {
        validate(inputPW2, pwdPattern, "영문자와 숫자, _ 6~10자");
        if (inputPW1.value !== inputPW2.value) {
            inputPW2.nextSibling.textContent = "패스워드가 일치하지 않습니다";
            inputPW2.nextSibling.style.color = "red";
            inputPW1.value = "";
            inputPW2.value = "";
            inputPW1.focus();
        }
    });
    inputName.addEventListener("blur", () => validate(inputName, namePattern, "한글 2~4자 또는 영문 2~20자"));
    inputEmail.addEventListener("blur", () => validate(inputEmail, emailPattern, "이메일 형식이 맞지 않습니다"));
    inputMobile.addEventListener("blur", () => validate(inputMobile, mobilePattern, "휴대전화 번호 형식이 맞지 않습니다"));

    // 폼 제출 이벤트 처리
    myform.addEventListener("submit", (e) => {
        e.preventDefault(); // 기본 제출 동작 방지
        let isValid = true; // 유효성 검사 플래그

        // 각 필드의 유효성 검사
        isValid &= validate(inputID, idPattern, "영문자, 숫자, _만 입력 가능");
        isValid &= validate(inputPW1, pwdPattern, "영문자와 숫자, _ 6~10자");
        isValid &= validate(inputPW2, pwdPattern, "영문자와 숫자, _ 6~10자");

        if (inputPW1.value !== inputPW2.value) {
            inputPW2.nextSibling.textContent = "패스워드가 일치하지 않습니다";
            inputPW2.nextSibling.style.color = "red";
            inputPW1.value = "";
            inputPW2.value = "";
            inputPW1.focus();
            isValid = false; // 유효성 검사 실패
        }

        isValid &= validate(inputName, namePattern, "한글 2~4자 또는 영문 2~20자");
        isValid &= validate(inputEmail, emailPattern, "이메일 형식이 맞지 않습니다");
        isValid &= validate(inputMobile, mobilePattern, "휴대전화 번호 형식이 맞지 않습니다");

        if (isValid) { // 모든 필드가 유효할 경우
            alert("서버로 전송하겠습니다.");
            myform.submit(); // 실제 폼 제출
        }
    });

    // 유효성 검사 함수
    function validate(userInput, pattern, message) {
        if (userInput.value.match(pattern)) {
            userInput.nextSibling.textContent = "성공";
            userInput.nextSibling.style.color = "blue";
            return true; // 유효성 검사 성공
        } else {
            userInput.nextSibling.textContent = message;
            userInput.nextSibling.style.color = "red";
            userInput.value = "";
            userInput.focus();
            return false; // 유효성 검사 실패
        }
    }

    
    // ~ 회원가입 폼 종료

}
        
   
   // 이게 싫으면 zIndex로 주면 됨 
   // 지금거는 옆으로 100% 200% 300% 400% 를 차지하고잇는 사진을 100%씩 왼쪽으로 미는 방식 
   