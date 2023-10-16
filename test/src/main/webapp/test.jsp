<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <script src="validation.js"></script>-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(document).ready(function() {
    // 통신사 체크박스 중복 선택 방지
    $('input[name="telecom"]').on('change', function() {
        if ($(this).is(':checked')) {
            $('input[name="telecom"]').not(this).prop('checked', false);
        }
        
        // 알뜰 선택 시 select 박스 활성화 
        if ($(this).val() === '알뜰') {
            $('select[name="tel"]').prop('disabled', false);
        } else {
            $('select[name="tel"]').prop('disabled', true);
        }
    });
});


function addHyphens(input) {
    // 입력값에서 모든 하이픈 제거
    var phoneNumber = input.value.replace(/-/g, '');

    if (phoneNumber.length > 0) {
        if (phoneNumber.length <= 3) {
            // 입력값이 3글자 이하일 때는 그대로 표시
            input.value = phoneNumber;
        } else if (phoneNumber.length <= 7) {
            // 입력값이 4~7글자일 때는 010-XXXX로 표시
            input.value = phoneNumber.substr(0, 3) + '-' + phoneNumber.substr(3);
        } else {
            // 입력값이 8글자 이상일 때는 010-XXXX-XXXX로 표시
            input.value = phoneNumber.substr(0, 3) + '-' + phoneNumber.substr(3, 4) + '-' + phoneNumber.substr(7);
        }
    }
}




function validateForm() {
    var name = document.frm.name.value;
    var residentNumber1 = document.frm.residentNumber1.value;
    var residentNumber2 = document.frm.residentNumber2.value;
    var email = document.frm.email.value;
    var phone = document.frm.phone.value;
    
   

    // 이름 유효성 검사
    if (!isKoreanName(name)) {
        alert("이름을 한글로만 입력하세요. 최대 6글자, 공백 없음.");
        document.frm.name.focus();
        return false;
    }

    
 // 주민번호 앞 6자리 유효성 검사 추가
    if (!isValidResidentNumber1(residentNumber1)) {
        alert("주민번호 앞 6자리는 숫자로만 입력하세요. 최대 6글자.");
        document.frm.residentNumber1.focus();
        return false;
    }
    
    
    // 주민번호 유효성 검사
     if (!isNumeric(residentNumber1) || !isValidResidentNumber2(residentNumber2) || residentNumber1.length > 6) {
        alert("주민번호는 숫자로만 입력하세요. 최대 6글자, 공백 없음. 뒷자리는 1 또는 2로 입력하세요.");
        invalidField = document.frm.residentNumber1;
        return;
    
    }
    // 주민등록번호 뒷자리 (residentNumber2)가 입력되지 않았을 때 포커스 이동
    if (residentNumber2 === "") {
        alert("주민등록번호 뒷자리 1또는 2를 입력하세요.");
        document.frm.residentNumber2.focus();
        return false;
    }
    
    // 전화번호 유효성 검사
    if (!isValidPhoneNumber(phone)) {
        alert("전화번호는 숫자로만 입력하세요 최대 13글자 공백없음.");
        document.frm.phone.focus();
        return false;
    }
    
    // 이메일 유효성 검사
    if (!isValidEmail(email)) {
        alert("올바른 이메일 주소를 입력하세요. 최대 20글자, 공백 없음. 영어로만 입력하세요.");
        document.frm.email.focus();
        return false;
    }
    

    // 추가 필드의 유효성 검사를 여기에 추가할 수 있습니다.

    //return true;
    
  
        document.getElementById('frm').submit();
    
    //document.getElementById('frm').submit();
}

function isKoreanName(text) {
    var koreanNameRegex = /^[가-힣]{1,6}$/;
    return koreanNameRegex.test(text);
}



function isNumeric(text) {
    var numericRegex = /^[0-9]+$/;
    return numericRegex.test(text);
}

// 주민번호 앞 6자리 유효성 검사 추가
function isValidResidentNumber1(text) {
    var residentNumber1Regex = /^\d{6}$/;
    return residentNumber1Regex.test(text);
}


function isValidResidentNumber2(text) {
    var residentNumber2Regex = /^[12]$/;
    return residentNumber2Regex.test(text);
}



function isValidEmail(text) {
    var emailRegex = /^[A-Za-z0-9._-]{1,20}$/;
    return emailRegex.test(text);
}

function isValidPhoneNumber(phone) {
    // 전화번호 유효성 검사
    var phoneNumberRegex = /^\d{3}-\d{4}-\d{4}$/;
    return phoneNumberRegex.test(phone);
}

</script>


</head>
<body>

<h3>회원가입</h3>
<form action="joinOk.jsp" method="post" name="frm" id="frm">
이름:   <input type="text" name="name"><br> <!-- only 한글 / 최대글자 6 / 공백X -->

주민번호: <input type="text" name="residentNumber1">-<input type="text" name="residentNumber2">XXXXXX<br>
통신사 : <input type="checkbox" name="telecom" value="SK">SK
	   <input type="checkbox" name="telecom" value="KT">KT
	   <input type="checkbox" name="telecom" value="LG">LG
	   <input type="checkbox" name="telecom" value="알뜰">알뜰
	   
	   <select name="tel" disabled="disabled">
	   
	   <option value="">선택</option>
	   <option value="SK알뜰">SK알뜰</option>
	   <option value="KT알뜰">KT알뜰</option>
	   <option value="CJ모바일">CJ모바일</option>
	   
	   
	   </select><br>
전화번호 : <input type="text" oninput="addHyphens(this)" name="phone" maxlength="13" onkeypress="return event.charCode >= 48 && event.charCode <= 57"><br>
이메일 : <input type="text" name="email">@ 	   
	    
	     <select name="email1">
	     
	   <option value="">선택</option>
	   <option value="naver.com">naver.com</option>
	   <option value="gmail.com">gmail.com</option>
	   <option value="daum.net">daum.net</option>
	   
	   
	   </select>
	    <br>
	   <input type="button" id="btn" value="확인" onclick="validateForm()">
  </form>
</body>
</html>