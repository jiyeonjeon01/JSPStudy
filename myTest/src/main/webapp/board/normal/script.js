// DOMContentLoaded 이벤트가 발생하면 onLoad 함수 실행
document.addEventListener("DOMContentLoaded", onLoad);

function onLoad() {
    // 슬라이드쇼 관련 DOM 요소 가져오기
    let slideshow = document.querySelector(".slideShow"); // 슬라이드쇼 전체 컨테이너
    let slidePic = document.querySelector(".slidePic"); // 슬라이드 이미지를 감싸는 컨테이너
    let picArr = document.querySelectorAll(".slidePic a"); // 각 슬라이드 이미지 링크
    let prev = document.querySelector(".prev"); // 이전 버튼
    let next = document.querySelector(".next"); // 다음 버튼
    let slideFooterIcon = document.querySelectorAll(".slideFooterIcon a"); // 하단 인디케이터

    // 슬라이드 상태 변수
    let currentIndex = 0; // 현재 슬라이드의 인덱스
    let timerID = null; // 자동 슬라이드 타이머 ID
    let slideCount = picArr.length; // 전체 슬라이드 개수

    // 초기화 함수: 슬라이드 이미지를 가로로 배치
    function initSlides() {
        for (let i = 0; i < slideCount; i++) {
            // 각 이미지의 위치를 왼쪽으로 정렬 (0%, 100%, 200%, ...)
            picArr[i].style.left = `${i * 100}%`;
        }
        gotoslide(currentIndex); // 첫 슬라이드로 이동
    }

    // 슬라이드를 이동시키는 함수
    function gotoslide(index) {
        currentIndex = index; // 현재 슬라이드 인덱스 업데이트
        let newLeft = `${index * -100}%`; // 이동할 거리 계산
        slidePic.style.transform = `translateX(${newLeft})`; // 슬라이드 이동 애니메이션

        // 하단 인디케이터 활성화 상태 업데이트
        slideFooterIcon.forEach((icon, i) => {
            icon.classList.toggle("active", i === index); // 현재 인덱스와 일치하는 인디케이터 활성화
        });
    }

    // 자동 슬라이드를 시작하는 함수
    function startTimer() {
        timerID = setInterval(() => {
            currentIndex = (currentIndex + 1) % slideCount; // 다음 슬라이드로 이동 (순환 구조)
            gotoslide(currentIndex); // 슬라이드 이동
        }, 3000); // 3초마다 실행
    }

    // 자동 슬라이드를 멈추는 함수
    function stopTimer() {
        clearInterval(timerID); // 타이머 중지
    }

    // 슬라이드 초기화 및 타이머 시작
    initSlides();
    startTimer();

    // 마우스 이벤트 등록
    // 슬라이드에 마우스를 올리면 자동 슬라이드 멈춤
    slidePic.addEventListener("mouseenter", stopTimer);
    slidePic.addEventListener("mouseleave", startTimer);

    // 이전 버튼에 마우스 이벤트 등록
    prev.addEventListener("mouseenter", stopTimer);
    prev.addEventListener("mouseleave", startTimer);

    // 다음 버튼에 마우스 이벤트 등록
    next.addEventListener("mouseenter", stopTimer);
    next.addEventListener("mouseleave", startTimer);

    // 이전 버튼 클릭 시 슬라이드 이동
    prev.addEventListener("click", (event) => {
        event.preventDefault(); // 기본 동작(페이지 이동) 방지
        currentIndex = (currentIndex - 1 + slideCount) % slideCount; // 이전 슬라이드로 이동 (순환 구조)
        gotoslide(currentIndex); // 슬라이드 이동
    });

    // 다음 버튼 클릭 시 슬라이드 이동
    next.addEventListener("click", (event) => {
        event.preventDefault(); // 기본 동작(페이지 이동) 방지
        currentIndex = (currentIndex + 1) % slideCount; // 다음 슬라이드로 이동 (순환 구조)
        gotoslide(currentIndex); // 슬라이드 이동
    });

    // 하단 인디케이터 클릭 이벤트 등록
    slideFooterIcon.forEach((icon, index) => {
        // 마우스를 올리면 자동 슬라이드 멈춤
        icon.addEventListener("mouseenter", stopTimer);
        icon.addEventListener("mouseleave", startTimer);

        // 인디케이터 클릭 시 해당 슬라이드로 이동
        icon.addEventListener("click", (event) => {
            event.preventDefault(); // 기본 동작 방지
            gotoslide(index); // 클릭한 인디케이터에 해당하는 슬라이드로 이동
        });
    });
}
