<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.image-container {
	display: flex;
	justify-content: center;
    max-width: 400px;
    position: relative;
    margin: auto;
}
.background-img {
	background-color: #333;
	padding-bottom: 10px;
}
.navigation {
	text-align: center;
	margin-top: 10px;
}
</style>
</head>
<jsp:include page="/w/menu.jsp" />
<body>
    <h1 id="content-title">관광지 만들기</h1>
    <div class="background-img">
	    <h1 style="text-align:center; padding-top: 10px; color: #fff;">추천 관광지</h1>
	
	    <div class="image-container">
	        <img src="${pageContext.request.contextPath}/w/images/image1.jpg" alt="Image 1" style="width: 300px; height: 200px; margin: 0 10px;" />
	        <img src="${pageContext.request.contextPath}/w/images/image2.jpg" alt="Image 2" style="width: 300px; height: 200px; margin: 0 10px;" />
	        <img src="${pageContext.request.contextPath}/w/images/image3.jpg" alt="Image 3" style="width: 300px; height: 200px; margin: 0 10px;" />
	    </div>
	
	    <div class="navigation">
	        <button onclick="prevImage()"><</button>
	        <button onclick="nextImage()">></button>
	    </div>
	</div>
	
	<script>
        var images = document.querySelectorAll('.image-container img');
        var currentIndex = 0;
        var maxVisibleImages = images.length;

        function shiftImages(direction) {
            if (direction === 'left') {
                var lastImage = images[images.length - 1].src;
                for (var i = images.length - 1; i > 0; i--) {
                    images[i].src = images[i - 1].src;
                }
                images[0].src = lastImage;
            } else if (direction === 'right') {
                var firstImage = images[0].src;
                for (var i = 0; i < images.length - 1; i++) {
                    images[i].src = images[i + 1].src;
                }
                images[images.length - 1].src = firstImage;
            }

            updateVisibility();
        }

        function updateVisibility() {
            for (var i = 0; i < images.length; i++) {
                if (i < currentIndex || i >= currentIndex + maxVisibleImages) {
                    images[i].style.display = 'none';
                } else {
                    images[i].style.display = 'block';
                }
                
                if (i === currentIndex + Math.floor(maxVisibleImages / 2)) {
                    images[i].style.opacity = 1;
                } else {
                	images[i].style.opacity = 0.5;
                }
            }
        }

        function prevImage() {
            shiftImages('left');
        }

        function nextImage() {
            shiftImages('right');
        }

        function showNextImage() {
            shiftImages('right');
            setTimeout(showNextImage, 5000);
        }

        window.onload = function () {
            showNextImage();
        };
    </script>
    
	<%
		String currentURL = request.getRequestURL().toString();
		session.setAttribute("currentURL", currentURL);
	%>
	
	<form action="dataSearch.do" method="post" style="text-align:center; padding-top: 10px;">
		<label>지명으로 관광지 찾기: </label>
		<input type="text" name="search" />
		<input type="submit" value="dataSearch">
	</form>
	
	<%
	String searchValue = (String)request.getAttribute("searchValue");    
    if(searchValue != null){
    	out.println("<h3>검색어: " + searchValue + "</h3>");

    	JSONArray searchResults = (JSONArray) request.getAttribute("searchResults");
    	if (searchResults != null && !searchResults.isEmpty()) {
    		for (Object result : searchResults) {
    			if (result instanceof JSONObject) {
    				JSONObject jsonObj = (JSONObject) result;
    				out.println("<ul>");
    				for (Object key : jsonObj.keySet()) {
    					out.println("<li><b>" + key + ":</b> " + jsonObj.get(key) + "</li>");
    				}
    				out.println("</ul>");
    			}
    		}
    	} else {
    		out.println("<p>검색 결과가 없습니다.</p>");
    	}	
    }
    %>
</body>
</html>