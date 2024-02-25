<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/w/menu.jsp"/>
<body>
<%
        String region = request.getParameter("region");
        String subRegion = request.getParameter("subRegion");
        String id = "0";
    if(region.equals("서울")){
    	if(subRegion.equals("강남")){
    		id = "1168000000";
    	}
    	if(subRegion.equals("종로")){
    		id = "1111000000";
    	}
    }
    
    if(region.equals("경기")){
    	if(subRegion.equals("수원")){
    		id = "4111100000";
    	}
    	if(subRegion.equals("용인")){
    		id = "4146100000";
    	}
    }
    
    if(region.equals("인천")){
    	if(subRegion.equals("동구")){
    		id = "2814000000";
    	}
    	if(subRegion.equals("중구")){
    		id = "2811000000";
    	}
    }
    
    Date currentDate = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
    String formattedDate = dateFormat.format(currentDate);
    
    SimpleDateFormat timeFormat = new SimpleDateFormat("HHmm");
    String formattedTime = timeFormat.format(currentDate);
    
    try {
    	
    String apiURL = "https://apis.data.go.kr/1360000/TourStnInfoService1/getCityTourClmIdx1?";
    String serviceKey = "rMsytW9bKyJX/AhprdiNYd8H8fgTy1QGzav18/BRxINo4oIZc2iI5mhyVrBBt1lNzednRX9aUKC7b7SM0Gb76w==";
    String pageNo = "1";
    String numOfRows = "10";
    String dataType = "JSON";
    String apiDate = formattedDate;
    apiURL += "ServiceKey=" + serviceKey + "&pageNo=" + pageNo + "&numOfRows=" + numOfRows + "&dataType=" + dataType + "&CURRENT_DATE=" + apiDate + "&DAY=0&CITY_AREA_ID=" + id;

    URL url = new URL(apiURL);
    
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    
    connection.setRequestMethod("GET");
    
    int responseCode = connection.getResponseCode();
    
    if (responseCode == HttpURLConnection.HTTP_OK) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
        StringBuilder responseBody = new StringBuilder();
        String line;
        
        while ((line = reader.readLine()) != null) {
            responseBody.append(line);
        }
        reader.close();
        
        out.println("<pre>" + responseBody.toString() + "</pre>");
    } else {
        out.println("<h2>API 요청 실패. 응답 코드: " + responseCode + "</h2>");
    }
    
    connection.disconnect();
} catch (Exception e) {
    out.println("<h2>예외 발생: " + e.getMessage() + "</h2>");
}

    %>
    <h2>현재 날짜: <%= formattedDate %></h2>
    <h2>현재 시간: <%= formattedTime %></h2>
    
    <h2>위치: <%= region %> <%= subRegion %></h2>
    <h2>상태: </h2>
</body>
</html>