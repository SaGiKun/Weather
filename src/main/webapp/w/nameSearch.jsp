<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/w/menu.jsp"/>
<body>
	<form action="dataSearch.do" method="post">
		<label>지명으로 관광지 찾기: </label>
		<select name="search">
			<option value="서울">서울</option>
			<option value="경기">경기</option>
			<option value="인천">인천</option>
		</select>
		<input type="submit" value="dataSearch">
	</form>
</body>
</html>