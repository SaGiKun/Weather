<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>메인화면</title>
    <meta charset="UTF-8">
    <style>
		.search-container {
		    text-align: center;
		    margin: 20px 0;
		}
		
		.search-container form {
		    display: inline-block;
		}
		
		.search-container input[type="text"] {
		    padding: 15px;
		    font-size: 18px;
		    width: 400px;
		    border: 1px solid #0A64CE;
		    border-radius: 4px;
		    outline: none;
		    box-sizing: border-box;
		}
		
		.search-container input[type="text"]:focus {
		    border-color: #084EA1;
		}
		
		.search-container button {
		    padding: 15px 25px;
		    font-size: 18px;
		    border: none;
		    border-radius: 4px;
		    background-color: #0A64CE;
		    color: white;
		    cursor: pointer;
		}
		
		.search-container button:hover {
		    background-color: #084EA1;
		}
		.line {
            width: 100%;
            height: 1px;
            background-color: #0A64CE;
        }
        .image-container {
			display: flex;
			justify-content: center;
		    max-width: 600px;
		    position: relative;
		    margin: auto;
		}
		.background-img {
			padding-bottom: 10px;
			margin-top: 20px;
		}
		.navigation {
			text-align: center;
			margin-top: 10px;
		}
		.image-container img {
		    width: 600px;
		    height: 400px;
		    margin: 0 10px;
		}
		.dest-container {
		    display: grid;
		    grid-template-columns: repeat(3, 1fr);
		    grid-gap: 20px;
		}
		.dest-wrap {
		    margin: 10px;
		    border: 3px solid #0A64CE;
		    border-radius: 10px;
		    padding: 10px;
		    color: #0A64CE;
		}
		#scrollToTopBtn {
		    position: fixed;
		    bottom: 20px;
		    right: 20px;
		    display: none;
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    background-color: #0A64CE;
		    color: white;
		    border: none;
		    font-size: 30px;
		    cursor: pointer;
		}
		
    </style>
</head>
<jsp:include page="/w/header.jsp" />
<body>
<main>
<button id="scrollToTopBtn" onclick="scrollToTop()">&#8593;</button> <!-- 위 화살표 유니코드로 넣은거 -->
<jsp:include page="/w/searchTest.jsp" />
<jsp:include page="/w/imgSlider.jsp" />
	<div>
		<h2 style="color:#0A64CE" align="center">여행지 코스를 추천해드려요!</h2>
	</div>
<%
    String method = request.getMethod();
    if ("POST".equalsIgnoreCase(method)) {
        %><jsp:include page="/w/searchResult.jsp" /><%
    } else {
        %><jsp:include page="/w/recommandTourist.jsp" /><%
    }
%>
</main>
<jsp:include page="/w/footer.jsp" />
<jsp:include page="/w/topButton.jsp" />
