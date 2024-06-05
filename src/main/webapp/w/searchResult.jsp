<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%
String searchValue = request.getParameter("search");
if (searchValue != null) {
 String jsonFilePath = getServletContext().getRealPath("/w/data.json");
 JSONParser parser = new JSONParser();
 BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(jsonFilePath),"utf-8"));
 JSONArray jsonArray = (JSONArray)parser.parse(br);
 Set<JSONObject> uniqueNames = new HashSet<JSONObject>();
 List<JSONObject> searchResults = new ArrayList<>();
 
 for (Object obj : jsonArray) {
     if (obj instanceof JSONObject) {
         JSONObject jsonObj = (JSONObject)obj;
         if (jsonObj.get("관광지명") != null && (jsonObj.get("관광지명").toString().toLowerCase().contains("(" + searchValue.toLowerCase() + ")")) || jsonObj.get("관광지명").toString().toLowerCase().contains(searchValue.toLowerCase())) {
             uniqueNames.add(jsonObj);
         }
     }
 }
 searchResults = new ArrayList<>(uniqueNames);
 
 if (!searchResults.isEmpty()) {
    out.println("<h3 style='color:#0A64CE' align='center'>검색어: " + searchValue + "</h3>");
    out.println("<div class='dest-container'>");
    for (JSONObject jsonObj : searchResults) {
        for (Object key : jsonObj.keySet()) {
        	if(key.equals("관광지 아이디")){
        		out.println("<div class='dest-wrap' onclick='redirectToDesti()'>");
        	}
            out.println("<b>" + key + ":</b> " + jsonObj.get(key) + "<br>");
            if(key.equals("실내구분")){
            	out.println("</div>");
            }
        }
    }
    out.println("</div>");
} else {
    out.println("<p>검색 결과가 없습니다.</p>");
}
}
%>
	<script>
		function redirectToDesti() {
		    window.location.href = "http://localhost:8080/weatherTest/testRedirectPage.do";
		}
	</script>