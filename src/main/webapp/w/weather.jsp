<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
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
	Object regionStatus = "";
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
    String jsonString = "";
    
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
    	JSONParser parser = new JSONParser();
    	BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
    	JSONObject json = (JSONObject)parser.parse(br);
    	
    	jsonString = json.get("response").toString();
    	
    	out.print(jsonString);
    	
		
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
    <h2>상태: <% if(jsonString.contains("매우 좋음")){%> 매우 좋음 <%} %>
    <% if(jsonString.contains("좋음")){%> 좋음 <%} %>
    <% if(jsonString.contains("보통")){%> 보통 <%} %>
    <% if(jsonString.contains("나쁨")){%> 나쁨 <%} %>
    </h2>
</body>
</html>