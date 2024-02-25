<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="MS949"%>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/w/menu.jsp" />
<body>
<h2>결과</h2>
    <%
    String searchValue = request.getParameter("search");
    out.println("<h2>Selected value: " + searchValue + "</h2>");
    
	String jsonFilePath = getServletContext().getRealPath("/w/data.json");

	JSONParser parser = new JSONParser();
	BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(jsonFilePath),"utf-8"));
	JSONArray jsonArray = (JSONArray)parser.parse(br);

	out.println("<h1>JSON 내용</h1>");
	out.println("<ul>");

	for (Object obj : jsonArray) {
	    if (obj instanceof JSONObject) {
	        JSONObject jsonObj = (JSONObject) obj;
			if (jsonObj.get("관광지명") != null && (jsonObj.get("관광지명").toString().toLowerCase().contains("(" + searchValue.toLowerCase() + ")")) || jsonObj.get("관광지명").toString().toLowerCase().contains(searchValue.toLowerCase())) {
				for (Object key : jsonObj.keySet()) {
					out.println("<li><b>" + key + ":</b> " + jsonObj.get(key) + "</li>");
				}
				out.println("<br>");
			}
		}
	}
	out.println("</ul>");
%>
</body>
</html>