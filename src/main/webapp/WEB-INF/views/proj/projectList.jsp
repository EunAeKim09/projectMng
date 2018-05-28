<%@page import="com.dgit.domain.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width:800px;
	text-align: center;
	margin:0 auto;
}
table, th, td{
	border:1px solid black;
	border-collapse: collapse;
}
th, td{
	padding:5px;
}
a{
	color:black;
	text-decoration: none;
}
div.add{
	margin-left:550px;
	margin-top:20px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="add">
		<a href="${pageContext.request.contextPath}/proj/addproj">[새 프로젝트 등록]</a>
	</div>
	<table>
		<tr>
			<th>프로젝트 이름</th>
			<th>시작 날짜</th>
			<th>종료 날짜</th>
			<th>상태 </th>
		</tr>
		<c:if test="${list.size() == 0 }">
			<tr>
				<td colspan="4">
					등록된 프로젝트가 없습니다.
					
				</td>
			</tr>
		</c:if>
		<c:if test="${list.size() > 0 }">
			<c:forEach var="item" items="${list}">   
				<tr>
					<td><a href="${pageContext.request.contextPath }/proj/detail?num=${item.pro_num}">${item.name }</a></td>
					<td><fmt:formatDate value="${item.startdate }" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${item.enddate }" pattern="yyyy-MM-dd"/></td>
					<td>${item.state }</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>