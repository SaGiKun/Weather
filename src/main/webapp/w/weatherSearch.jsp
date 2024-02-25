<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script>
    function showSubOptions() {
        var region = document.querySelector('input[name="region"]:checked');
        var subOptions = document.getElementById('subOptions');
        var submitButton = document.getElementById('submitButton');

        if (region) {
            subOptions.innerHTML = ''; // 세부 옵션 초기화

            // 선택된 지역에 따라 세부 옵션 설정
            if (region.value === '서울') {
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="강남" onclick="showSubmitButton()"> 강남</label>';
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="종로" onclick="showSubmitButton()"> 종로</label>';
            } else if (region.value === '경기') {
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="수원" onclick="showSubmitButton()"> 수원</label>';
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="용인" onclick="showSubmitButton()"> 용인</label>';
            } else if (region.value === '인천') {
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="동구" onclick="showSubmitButton()"> 동구</label>';
                subOptions.innerHTML += '<label><input type="radio" name="subRegion" value="중구" onclick="showSubmitButton()"> 중구</label>';
            }

            subOptions.style.display = 'block';
        } else {
            subOptions.style.display = 'none';
        }
    }

    function showSubmitButton() {
        var subRegion = document.querySelector('input[name="subRegion"]:checked');
        var submitButton = document.getElementById('submitButton');

        if (subRegion) {
            submitButton.style.display = 'block';
        } else {
            submitButton.style.display = 'none';
        }
    }
    </script>
</head>
<jsp:include page="/w/menu.jsp"/>
<body>
어디가세요
	<form action="weather.do" method="post">
        <label><input type="radio" name="region" value="서울" onclick="showSubOptions()"> 서울</label>
        <label><input type="radio" name="region" value="경기" onclick="showSubOptions()"> 경기</label>
        <label><input type="radio" name="region" value="인천" onclick="showSubOptions()"> 인천</label>

        <div id="subOptions" style="display: none;">
        </div>

        <input type="submit" value="제출" id="submitButton" style="display: none;">
    </form>
</body>
</html>