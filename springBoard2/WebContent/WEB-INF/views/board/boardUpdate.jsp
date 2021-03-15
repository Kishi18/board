<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardUpdate</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#select_type").val("${boardType}");
		
		$j("#update").on("click",function(){
			
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();
			var page = $j('#pageNo').val();
			
			$j.ajax({
			    url : "/board/boardUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("수정완료");
 					
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

<form class="boardUpdate">
<input type="hidden" name="boardNum" value="${board.boardNum}">
<input type="hidden" id="pageNo" name="pageNo" value="${pageNo.pageNo}">

	<table align="center">
		<tr>
			<td align="right">						
			<input id="update" type="button" value="수정">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1">
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
							<select id="select_type" name="boardType">
  								<c:forEach items="${selectBoxArray}" var="selectBoxType">
  								 	<option value="${selectBoxType.code_Id}">${selectBoxType.code_Name}</option>
  								 
  								 </c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value= "${board.boardTitle}" >
						
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
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
</form>	
</body>
</html>