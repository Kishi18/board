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

		//'전체' 체크박스를 선택했을경우
		$j("#ckall").on("click",function(){
			console.log("전체체크");

			if($j("#ckall").is(":checked")){
				$j("input[name='menu']").prop("checked",true); //'전체'가 체크O
			}else{
				$j("input[name='menu']").prop("checked",false); //'전체'가 체크X
			}
		});
		
		$j("input[name='menu']").on("click",function(){
			if($j("input[name='menu']:checked").length == 4){ // input name 중에 menu인 애들이 체크되어있는 애들을 .length로 카운트한다.
				$j("#ckall").prop("checked",true); // menu 4개가 모두 체크 되어있으면 '전체'도 체크
			}else{
				$j("#ckall").prop("checked",false); // menu 4개가 아니면 '전체'도 체크해제
			}		
		});
		
		
		
		function valueCheck(){
			var checkArray = new Array();
			
			$j("input[name='menu']:checked").each(function(){
				checkArray.push(this.value);				
			});	
			console.log(checkArray);
		}
		
		
		//조회 버튼을 클릭했을때
		$j("#search_btn").on("click",function(){
			console.log("조회버튼 가능");
			if($j("input[name='menu']:checked").length == 0){
				alert("체크된 항목 없음");
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
					alert("체크값 전달완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo="+page;
			    },
			 
			    error: function (err)//jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패:"+err);
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
			<input type="button" id="search_btn" name="search" value="조회">
		</td>
	</tr>
</table>
</body>
</html>