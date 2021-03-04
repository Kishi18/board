<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
	
	$j(document).ready(function(){

		$j("#ckall").on("click",function(){
			console.log("test1");

			if($j("#ckall").is(":checked")){
				$j("input[name='menu']").prop("checked",true);
			}else{
				$j("input[name='menu']").prop("checked",false);
			}
		});
		
		$j("input[name='menu']").on("click",function(){
			if($j("input[name='menu']:checked").length == 4){ // 인풋 네임 중에 menu인 애들이 체크되어있는 애들을 .length로 카운트한다.
				$j("#ckall").prop("checked",true);
			}else{
				$j("#ckall").prop("checked",false);
			}
			
		});
		/*
		$j("#ckall").click(function(){
			if($j("#ckall").prop("cheked")){
				$j("input[name='menu']").prop("checked",true);
			}else{
				$j("input[name='menu']").prop("checked",false);
			}
		});
		*/
	});
	
	/*
	$j(document).ready(function(){
		
		$j("#ckall").on("click",function(){
			console.log("test=");
			
		});
	});
	*/

</script>
<body>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.boardType}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
							
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="all_menu" id="ckall" value="all">전체
			<input type="checkbox" name="menu" id="a01" value="a01">일반
			<input type="checkbox" name="menu" id="a02" value="a02">QnA
			<input type="checkbox" name="menu" id="a03" value="a03">익명
			<input type="checkbox" name="menu" id="a04" value="a04">자유
			<input type="button" name="search" value="조회">
		</td>
	</tr>
</table>
</body>
</html>