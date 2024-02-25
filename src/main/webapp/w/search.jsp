<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    margin: 0;
    font-family: 'Arial', sans-serif;
    overflow: hidden;
}

.split-screen {
    display: flex;
    height: 100vh;
}

.left-content, .right-content {
    flex: 1;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 48px;
    opacity: 0;
    transition: opacity 1s ease-in-out;
}

.left-content {
    color: #adb5bd;
}

.left-content:hover {
	background-color: #e9ecef;
    color: #495057;
}


.right-content {
    color: #adb5bd;
}

.right-content:hover {
	background-color: #e9ecef;
    color: #495057;
}
</style>
</head>
<jsp:include page="/w/menu.jsp"/>
<body>
	<div class="split-screen">
        <div class="left-content" id="leftContent"></div>
        <div class="right-content" id="rightContent"></div>
    </div>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        setTimeout(function () {
            document.getElementById('leftContent').innerText = '지명으로 찾기';
            document.getElementById('rightContent').innerText = '날씨로 찾기';
            document.getElementById('leftContent').style.opacity = 1;
            document.getElementById('rightContent').style.opacity = 1;
            
            document.getElementById('leftContent').addEventListener('click', function () {
                fadeOutAndLoadNewPage('nameSearch.do');
            });
            
            document.getElementById('rightContent').addEventListener('click', function () {
                fadeOutAndLoadNewPage('weatherSearch.do');
            });
            
        }, 500);
        
        function fadeOutAndLoadNewPage(newPageUrl) {
            document.getElementById('leftContent').style.opacity = 0;
            document.getElementById('rightContent').style.opacity = 0;

            setTimeout(function () {
                window.location.href = newPageUrl;
            }, 1000);
        }
    });    
    </script>
</body>
</html>