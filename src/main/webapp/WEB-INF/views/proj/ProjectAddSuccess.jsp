<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
	color:black;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<h1>새 프로젝트 등록을 완료했습니다.</h1>
	<h2><a href="index.jsp">[메인으로 돌아가기]</a></h2>
	<h2><a href="projectList.do">[프로젝트 리스트 보기]</a></h2>
	<h2><a href="projectAdd.do">[새 프로젝트 등록하기]</a></h2>
	<jsp:include page="footer.jsp"/>
</body>
</html>