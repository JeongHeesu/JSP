<%--==============================================================
 * 개인과제 - zipcode(우편번호검색 폼)
 * @author 정희수
 * @since  2018.03.05
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05. 	 정희수    	최초작성(스크립트)
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0" id="tblView">
		<tr>
			<td height="30"><img src="../image/open_post.gif" width="136"
				height="22"></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25"><div align="center">찾고자 하는 지역의 동이름을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="dong">&nbsp;동(읍/면)&nbsp;
							<input id="inputBtn" type="image" src="../image/bt_search.gif" border='0'
							align="middle">
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable">
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('#inputBtn').click(function(){
		if($('#dong').val() == ''){
			alert('검색을 위해 주소를 입력해주세요');
			return;
		}
		$.ajax({
			type : 'POST',
			dataType : 'json',
			data : {dong: $('#dong').val()},
			url : '<%=request.getContextPath()%>/06/zipcodeSerching.jsp',
			error : function(res){
				alert(res.status);
			},
			success : function(res){
				var tbl = '<table width="100%" height="190" border="0" cellspcing="0" '+
				'cellpadding="0" style="overflow:scroll;" id="zipcodeTbl">' +
				'<thead>' +
					'<tr>' +
						'<th> 우편번호 </th>' +
						'<th> 시도 </th>' +
						'<th> 구(군) </th>' +
						'<th> 동 </th>' +
					'</tr>' +
				'</thead>' +	
				'<tbody>';
				$.each(res, function(index, jsonData){
					tbl+= '<tr>' + 
								'<td>' + jsonData.zipcode + '</td>' +
								'<td>' + jsonData.sido + '</td>' +
								'<td>' + jsonData.gugun + '</td>' +
								'<td>' + jsonData.dong + '</td>' + 
						  '</tr>';		
				});
				
				tbl += '</tbody></table>';
				$('#viewTable').empty();
				$('#viewTable').html(tbl);
				
				$('#tblView tr:gt(0)').click(function(){
					var zipcode = $(this).find('td:eq(0)').text();
					var addr = $(this).find('td:eq(1)').text()+ ' ' +
							   $(this).find('td:eq(2)').text()+ ' ' +
							   $(this).find('td:eq(3)').text();
					
					$(onpener.document).find('#mem_zip1').val(zipcode.split('-')[0]);
					$(onpener.document).find('#mem_zip2').val(zipcode.split('-')[1]);
					
					self.close();
							   
				})
			}
		});
		
	})
	
})
</script>
</html>