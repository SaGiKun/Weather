<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지</title>
<style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
    }
    .topbar {
      background-color: #333;
      color: #fff;
      padding: 2px;
      text-align: center;
    }
    .menu {
    background-color: #222;
    color: #fff;
    padding: 10px;
	}
	
	nav ul {
		display: flex;
		justify-content: space-around;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	}
	
	nav ul li {
	    display: inline-block;
	    margin-right: 10px;
	}
	
	nav ul li a {
		text-decoration : none;
	    color: #fff;
	}
	
	nav ul li a:hover {
	    color: #aaa;
	}
</style>
</head>
<body>
	<div class="topbar">
		<h1 style="text-decoration : none;
	    color: #fff;"><a href="<%= request.getContextPath() %>/form.do">관광지</a></h1>
	</div>
	<div class="menu">
		<nav>
		<ul>
			<li><a href="<%= request.getContextPath() %>/form.do">메인메뉴</a></li>
			<li><a href="<%= request.getContextPath() %>/search.do">관광지 찾기</a></li>
		</ul>
	</nav>
	</div>
</body>
</html>