<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<header>
    <div style="display: flex; justify-content: space-between; align-items: center; padding: 1em;">
    	<div style="flex: 1;"></div>
        <div style="flex: 1; text-align: center;">
            <img src="logo.png" alt="로고 위치" style="height: 50px;" onclick="window.location.href = 'http://localhost:8080/weatherTest/main.do';" >
        </div>
        <div style="flex: 1; text-align: right; color: #0A64CE;">
            <a href="signup.jsp" style="margin-right: 1em; text-decoration: none; font-weight: bold;">회원가입</a>
            <a href="login.jsp" style="margin-right: 1em; text-decoration: none; font-weight: bold;">로그인</a>
        </div>
    </div>
</header>


