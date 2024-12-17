
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
        }, 3000); // 3초 간격으로 변경
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

}




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









// 유효성 검사 정규식 패턴 정의
const idPattern = /^[a-zA-Z0-9]{3,15}$/; // 영문자와 숫자, 3~15자
const pwdPattern = /^[a-zA-Z0-9]{6,15}$/; // 영문자와 숫자, 6~15자
const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,4}$/; // 이메일 형식
const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/; // 전화번호 형식

// 유효성 검사 함수
function validate(input, pattern, errorId, message) {
    const errorSpan = document.getElementById(errorId);
    if (pattern.test(input.value.trim())) {
        errorSpan.innerText = ""; // 오류 메시지 제거
        return true;
    } else {
        errorSpan.innerText = message;
        errorSpan.style.color = "red";
        return false;
    }
}

// 아이디 유효성 검사
function validateId() {
    const inputID = document.querySelector(".idDetailInput2");
    const errorSpan = document.getElementById("idError");
    const idPattern = /^[a-zA-Z0-9]{3,15}$/;

    if (idPattern.test(inputID.value.trim())) {
        errorSpan.innerText = "";
        return true;
    } else {
        errorSpan.innerText = "아이디는 영문과 숫자 3~15자입니다.";
        errorSpan.style.color = "red";
        return false;
    }
}

// 비밀번호 유효성 검사
function validatePassword() {
    const inputPW1 = document.querySelector(".pwDetailInput2");
    const errorSpan = document.getElementById("passError");
    const pwdPattern = /^[a-zA-Z0-9]{6,15}$/;

    if (pwdPattern.test(inputPW1.value.trim())) {
        errorSpan.innerText = "";
        return true;
    } else {
        errorSpan.innerText = "비밀번호는 영문과 숫자 6~15자입니다.";
        errorSpan.style.color = "red";
        return false;
    }
}

// 비밀번호 확인
function validateRePassword() {
    const inputPW1 = document.querySelector(".pwDetailInput2");
    const inputPW2 = document.querySelector(".pwReDetailInput2");
    const errorSpan = document.getElementById("repassError");

    if (inputPW1.value.trim() === inputPW2.value.trim() && inputPW2.value.trim() !== "") {
        errorSpan.innerText = "";
        return true;
    } else {
        errorSpan.innerText = "비밀번호가 일치하지 않습니다.";
        errorSpan.style.color = "red";
        return false;
    }
}

// 이메일 유효성 검사
function validateEmail() {
    const inputEmail = document.querySelector(".emilDetailInput2");
    const errorSpan = document.getElementById("emailError");
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-z]{2,4}$/;

    if (emailPattern.test(inputEmail.value.trim())) {
        errorSpan.innerText = "";
        return true;
    } else {
        errorSpan.innerText = "이메일 형식이 올바르지 않습니다.";
        errorSpan.style.color = "red";
        return false;
    }
}

// 휴대전화 유효성 검사
function validatePhone() {
    const inputPhone = document.querySelector(".phoneDetailInput2");
    const errorSpan = document.getElementById("phoneError");
    const phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;

    if (phonePattern.test(inputPhone.value.trim())) {
        errorSpan.innerText = "";
        return true;
    } else {
        errorSpan.innerText = "전화번호 형식이 올바르지 않습니다 (ex: 010-1234-5678).";
        errorSpan.style.color = "red";
        return false;
    }
}

// 전체 유효성 검사
function inputCheck() {
    const isIdValid = validateId();
    const isPwValid = validatePassword();
    const isRePwValid = validateRePassword();
    const isEmailValid = validateEmail();
    const isPhoneValid = validatePhone();

    if (isIdValid && isPwValid && isRePwValid && isEmailValid && isPhoneValid) {
        alert("회원가입이 완료되었습니다!");
        document.regForm.submit();
    } else {
        alert("입력 내용을 확인해주세요!");
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