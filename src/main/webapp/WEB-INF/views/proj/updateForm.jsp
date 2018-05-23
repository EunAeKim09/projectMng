<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	margin:30px auto;
	width:50%;
}
label{
	float: left;
    width: 150px;
}
div{
	margin:20px;
}
input[type='text']{
	width:720px;
}
select{
	width:140px;
}
.btn{
	text-align: center;
}
input[type='button']{
	background: black;
    width: 100px;
    height: 40px;
    border: none;
    color: white;
}
.error{
	color:red;
	display: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#cancel").click(function(){
		location.href="${pageContext.request.contextPath}/proj/detail?num="+${pro.pro_num};
	});
	
	$("#update").click(function(){
		$(".error").css("display","none");
		
		var count = 0;
		
		$("input[name]").each(function(i, obj){
			if($(obj).val() == ""){
				$(obj).next().css("display","block");
				count++;
			}
		});
		
		if(count > 0){
			return false;
		}
		
		if($("textarea").val()==""){
			$("textarea").next().css("display","block");
			return false;
		}
		
		
		var pronum = ${pro.pro_num};
		var nameVal = $("input[name='name']").val();
		var startDateVal = $("input[name='startdate']").val();
		var endDateVal = $("input[name='enddate']").val();
		var stateVal = $("select[name='state']").val();
		
		var content = $("textarea").val();
		
		var sendData = {
			pro_num : pronum,
			name : nameVal,
			startdate : startDateVal,
			enddate : endDateVal,
			state : stateVal
		};
		//@RequestBody, JSon.stringify, headers-Context-Type 세트
		$.ajax({    
			type : "post",
			url : "${pageContext.request.contextPath}/proj/update?content="+content,
			data : JSON.stringify(sendData), //json string으로 바꿔줌
			dataType : "text", //xml, text, json
			headers : {
				"Content-Type" : "application/json;charset=UTF-8"
			},
			success : function(result) {
				console.log(result);
				if(result == "success"){
					alert("수정되었습니다.");
					location.href="${pageContext.request.contextPath}/proj/detail?num="+pronum;
				}
			}
		})
		
		
		
		
		
		
		
		
		
	});
});
</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<form action="update.do" method="post">
		<fieldset>
			<legend>프로젝트 수정하기</legend>
			<div>
				<label>프로젝트 이름</label>
				<input type="text" name="name" value="${pro.name }">
				<p class="error">프로젝트 이름을 입력하세요.</p>
			</div>
			<div>
				<label>프로젝트 내용</label>
				<textarea cols="100" rows="20" name="content">${con.content }</textarea>
				<p class="error">프로젝트 내용을 입력하세요.</p>
			</div>
			<div>
				<label>시작 날짜</label>
				<input type="date" name="startdate" 
				value="<fmt:formatDate value='${pro.startdate }' pattern='yyyy-MM-dd'/>">
				<p class="error">시작 날짜를 입력하세요.</p>
			</div>
			<div>
				<label>마감 날짜</label>
				<input type="date" name="enddate"
				value="<fmt:formatDate value='${pro.enddate }' pattern='yyyy-MM-dd'/>">
				<p class="error">마감 날짜를 입력하세요.</p>
			</div>
			<div>
				<label>상태</label>
				<select name="state">
					<option value="준비" <c:if test="${pro.state =='준비' }">
					selected="selected"
					</c:if>
					>준비</option>
					<option value="진행중" <c:if test="${pro.state =='진행중' }">selected="selected"</c:if>>진행중</option>
					<option value="종료" <c:if test="${pro.state =='종료' }">selected="selected"</c:if>>종료</option>
					<option value="보류" <c:if test="${pro.state =='보류' }">selected="selected"</c:if>>보류</option>
				</select>
			</div>
			<div class="btn">
				<input type="button" id="update" value="수정">
				<input type="button" id="cancel" value="취소">
			</div>
			<input type="hidden" value="${pro.pro_num }" name="num">
		</fieldset>
	</form>
	<jsp:include page="footer.jsp"/>
</body>
</html>