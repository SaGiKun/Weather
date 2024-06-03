<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="MS949"%>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/w/menu.jsp" />
<body>
    <%
    String searchValue = request.getParameter("search");
    String currentURL = (String) session.getAttribute("currentURL");
    
	String jsonFilePath = getServletContext().getRealPath("/w/data.json");

	JSONParser parser = new JSONParser();
	BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(jsonFilePath),"utf-8"));
	JSONArray jsonArray = (JSONArray)parser.parse(br);
	Set<JSONObject> uniqueNames = new HashSet<JSONObject>();
	List<JSONObject> searchResults = new ArrayList<>();
	
	if(searchValue != null){
		for (Object obj : jsonArray) {
		    if (obj instanceof JSONObject) {
		        JSONObject jsonObj = (JSONObject)obj;
				if (jsonObj.get("°ü±¤Áö¸í") != null && (jsonObj.get("°ü±¤Áö¸í").toString().toLowerCase().contains("(" + searchValue.toLowerCase() + ")")) || jsonObj.get("°ü±¤Áö¸í").toString().toLowerCase().contains(searchValue.toLowerCase())) {
					for (Object key : jsonObj.keySet()) {
						uniqueNames.add(jsonObj);
					}
				}
			}
		    searchResults = new ArrayList<>(uniqueNames);
		}
		
		request.setAttribute("searchResults", searchResults);
		request.setAttribute("searchValue", searchValue);
		
		String referringPage = request.getHeader("Referer");
	    if (referringPage != null && (referringPage.contains("form.do")|| (referringPage.contains("dataSearch.do")))) {
	        request.getRequestDispatcher("/w/form.jsp").forward(request, response);
	    } else if (referringPage != null && referringPage.contains("nameSearch.do")) {
	    	request.getRequestDispatcher("/w/nameSearch.jsp").forward(request, response);
	    } else {
	    	out.println("<p>referringPageToken: " + referringPage + "</p>");
	    }
	}
%>
</body>
</html>