<%--==============================================================
 * 바이어 목록 찾기 폼
 * @author 정희수
 * @since  2018.03.05.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05.  정희수      최초작성 (스크립트) 
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
			<td height="30">
				<h2>거래처 검색</h2>
			</td>
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
						<td height="25"><div align="center">찾고자 하는 거래처명을
								입력해주십시오.</div></td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<input type="text" id="buyerName">&nbsp;거래처명&nbsp;
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
		if($('#buyerName').val() == ''){
			alert('검색을 위해 거래처명을 입력해주세요');
			return;
		}
		$.ajax({
			type : 'POST',
			dataType : 'json',
			data : {buyer_name: $('#buyerName').val()},
			url : '<%=request.getContextPath()%>/07/buyerSerching.jsp',
			error : function(res){
				alert(res.status);
			},
			success : function(res){
				var tbl = '<table width="100%" height="190" border="0" cellspcing="0" '+
				'cellpadding="0" style="overflow:scroll;" id="buyerTbl">' +
				'<thead>' +
					'<tr>' +
						'<th> 거래처번호 </th>' +
						'<th> 거래처명 </th>' +
					'</tr>' +
				'</thead>' +	
				'<tbody>';
				$.each(res, function(index, jsonData){
					tbl+= '<tr>' + 
								'<td>' + jsonData.buyer_id + '</td>' +
								'<td>' + jsonData.buyer_name + '</td>' +
						  '</tr>';		
				});
				
				tbl += '</tbody></table>';
				$('#viewTable').empty();
				$('#viewTable').html(tbl);
				
				$('#buyerTbl tr:gt(0)').click(function(){
					var buyer_id = $(this).find('td:eq(0)').text();
					$('#prod_buyer',opener.document).val(buyer_id);
					
					self.close();
							   
				})
			}
		});
		
	})
	
})
</script>
</html>