<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	margin: 30px auto;
	width: 50%;
}

label {
	float: left;
	width: 150px;
}

div {
	margin: 20px;
}

input[type='text'] {
	width: 720px;
}

select {
	width: 140px;
}

.btn {
	text-align: center;
}

input[type='submit'], input[type='reset'], input[type='button'] {
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#save").click(function(){                           
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
		
		if($("textarea").val()==null){
			$("textarea").next().css("display","block");
			return false;
		}    

		var nameVal = $("input[name='name']").val();
		var startDateVal = $("input[name='startDate']").val();
		var endDateVal = $("input[name='endDate']").val();
		var stateVal = $("select[name='state']").val();
		var content = $("textarea").val();
		
		var sendData = {
			name : nameVal,
			startdate : startDateVal,
			enddate : endDateVal,
			state : stateVal
		};
		//@RequestBody, JSon.stringify, headers-Context-Type 세트
		$.ajax({    
			type : "post",
			url : "${pageContext.request.contextPath}/proj/addproj?content="+content,
			data : JSON.stringify(sendData), //json string으로 바꿔줌
			dataType : "text", //xml, text, json
			headers : {
				"Content-Type" : "application/json;charset=UTF-8"
			},
			success : function(result) {
				console.log(result);
				if(result == "success"){
					alert("등록되었습니다.");
					location.href="${pageContext.request.contextPath}/proj/projectList";
				}
			}
		})
	}); 
	
	$("#cancel").click(function(){  
		location.href="${pageContext.request.contextPath}/proj/projectList";
	});
});		
</script>
</head>
<body>
	<jsp:include page="header.jsp" />   
		<fieldset>
			<legend>새 프로젝트 등록하기</legend>
			<div>
				<label>프로젝트 이름</label> <input type="text" name="name">
				<p class="error">프로젝트 이름을 입력하세요.</p>
			</div>
			<div>
				<label>프로젝트 내용</label>
				<textarea cols="100" rows="20" name="content"></textarea>
				<p class="error">프로젝트 내용을 입력하세요.</p>
			</div>
			<div>
				<label>시작 날짜</label> <input type="date" name="startDate">
				<p class="error">시작 날짜를 입력하세요.</p>
			</div>
			<div>
				<label>마감 날짜</label> <input type="date" name="endDate">
				<p class="error">마감 날짜를 입력하세요.</p>
			</div>
			<div>
				<label>상태</label> <select name="state">
					<option value="준비">준비</option>
					<option value="진행중">진행중</option>
					<option value="종료">종료</option>
					<option value="보류">보류</option>
				</select>
			</div>
			<div class="btn">
				<input type="button" value="저장" id="save"> <input type="button" id="cancel" value="취소">
			</div>
		</fieldset>
	<jsp:include page="footer.jsp" />
</body>
</html>