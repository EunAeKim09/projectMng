<%@page import="com.dgit.domain.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	width: 800px;
	text-align: center;
	margin: 20px auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

th {
	width: 200px;
}

a {
	color: black;
	text-decoration: none;
}

div.add {
	margin-left: 550px;
	margin-top: 20px;
	margin-bottom: 10px;
}

div#as {
	margin-top: 10px;
	text-align: center;
}

div#as a {
	background: black;
	color: white;
	padding: 10px;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<table>
		<tr>
			<th>프로젝트 이름</th>
			<td>${pro.name }</td>
		</tr>
		<tr>
			<th>프로젝트 내용</th>
			<td>${con.content }</td>
		</tr>
		<tr>
			<th>시작 날짜</th>
			<td><fmt:formatDate value="${pro.startdate }"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>종료 날짜</th>
			<td><fmt:formatDate value="${pro.enddate }" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>상태</th>
			<td>${pro.state }</td>
		</tr>
	</table>
	<div id="as">
		<a href="${pageContext.request.contextPath }/proj/updateForm?num=${pro.pro_num }">수정</a> 
		<a id="delete">삭제</a> 
		<a href="${pageContext.request.contextPath }/proj/projectList">돌아가기</a>
	</div>
	</div>
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
	var pronum = ${pro.pro_num};
	console.log(pronum);
	$("#delete").click(function() {
		if(confirm("정말 삭제하시겠습니까?")==true){
			$.ajax({    
				type : "post",
				url : "${pageContext.request.contextPath}/proj/delete?num="+pronum,
				success : function(result) {
					console.log(result);
					if(result == "success"){
						alert("삭제되었습니다.");
						location.href="${pageContext.request.contextPath}/proj/projectList";
					}
				}
			})
		};

	});
	</script>
</body>
</html>