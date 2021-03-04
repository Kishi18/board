<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#delete").on("click",function(){
			var param = {boardNum:${boardNum}};
			var page = $j('#pageNo').val();
			
			$j.ajax({
			    url : "/board/boardDeleteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data)//, textStatus, jqXHR)
			    {
					alert("삭제완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo="+page;
			    },
			 
			    error: function (err)//jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패:"+err);
			    	location.href = "/board/boardList.do?pageNo="+page;
			    }
			    
			});
		});

		$j("#update").on("click",function(){
			var page = $j("#pageNo").val();
			var boardNum = $j("#boardNum").val();

			//var param = {boardNum:${board.boardNum}};
			var param = {boarNum:boardNum, pageNo:pageNo};			
			$j.ajax({
			    //url : "/board/boardUpdate.do",
			    url : "/board/${boardType}/${boardNum}/boardUpdate.do",
			    dataType: "json",
			    type: "GET",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("성공");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo="+page;
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>
<body>
<input type="hidden" name="boardNum" id="boardNum" value=${board.boardNum}>
<input type="hidden" id="pageNo" value=${pageNo.pageNo}>
<table align="center">
	<tr>
		<td align="right">
			
			<!-- 
			<input type ="button" value="수정" id ="update" onclick="location.href='/board/boardUpdate.do'">
			 -->
			<input type = "button" value= "수정" id = "update" onclick="location.href='/board/${board.boardType}/${board.boardNum}/boardUpdate.do'">
			<input type ="button" value="삭제" id="delete">
		</td>
	</tr>
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>	
</body>

</html>