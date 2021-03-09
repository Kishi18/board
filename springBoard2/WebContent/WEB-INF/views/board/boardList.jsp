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

		//'��ü' üũ�ڽ��� �����������
		$j("#ckall").on("click",function(){
			console.log("��üüũ");

			if($j("#ckall").is(":checked")){
				$j("input[name='menu']").prop("checked",true); //'��ü'�� üũO
			}else{
				$j("input[name='menu']").prop("checked",false); //'��ü'�� üũX
			}
		});
		
		$j("input[name='menu']").on("click",function(){
			if($j("input[name='menu']:checked").length == 4){ // input name �߿� menu�� �ֵ��� üũ�Ǿ��ִ� �ֵ��� .length�� ī��Ʈ�Ѵ�.
				$j("#ckall").prop("checked",true); // menu 4���� ��� üũ �Ǿ������� '��ü'�� üũ
			}else{
				$j("#ckall").prop("checked",false); // menu 4���� �ƴϸ� '��ü'�� üũ����
			}		
		});
		
		
		
		function valueCheck(){
			var checkArray = new Array();
			
			$j("input[name='menu']:checked").each(function(){
				checkArray.push(this.value);				
			});	
			console.log(checkArray);
		}
		
		
		//��ȸ ��ư�� Ŭ��������
		$j("#search_btn").on("click",function(){
			console.log("��ȸ��ư ����");
			if($j("input[name='menu']:checked").length == 0){
				alert("üũ�� �׸� ����");
			}
			
			valueCheck();
			
			var param = {"checkArray":checkArray};
			var page = $j('#pageNo').val();
			
			$j.ajax({
			    url : "/board/boardList.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data)//, textStatus, jqXHR)
			    {
					alert("üũ�� ���޿Ϸ�");
					
					alert("�޼���:"+data.success);
					
					location.href = "/board/boardList.do?pageNo="+page;
			    },
			 
			    error: function (err)//jqXHR, textStatus, errorThrown)
			    {
			    	alert("����:"+err);
			    	//location.href = "/board/boardList.do?pageNo="+page;
			    }
			    
			});

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
							${list.code_Name}
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
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
	<tr>
		<td>
			<input type="checkbox" name="all_menu" id="ckall" value="all">��ü
			<input type="checkbox" name="menu" id="a01" value="a01">�Ϲ�
			<input type="checkbox" name="menu" id="a02" value="a02">QnA
			<input type="checkbox" name="menu" id="a03" value="a03">�͸�
			<input type="checkbox" name="menu" id="a04" value="a04">����
			<input type="button" id="search_btn" name="search" value="��ȸ">
		</td>
	</tr>
</table>
</body>
</html>