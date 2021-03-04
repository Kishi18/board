<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js">

	$j(document).ready(function(){
		/*
		$j("#all").click(function(){
			if($j("all").prop("cheked")){
				$j("input[name='menu']").prop("checked",true);
			}else{
				$j("input[name='menu']").prop("checked",false);
			}
		});
		*/
		$j("#all").click(function(){
			if($j("#all").is(":checked")){
				$j(".menu").prop("checked",true);
			}else{
				$j(".menu").prop("checked",false);
			}
		});
	});

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
			<input type="checkbox" name="menu" id="all" value="all">전체
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