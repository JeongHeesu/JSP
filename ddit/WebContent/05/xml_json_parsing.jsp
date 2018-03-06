<%--==============================================================
 * createXML_JSON Data 불러오는 페이지
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
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$('input[value=XML요청]').click(function(){
		$.ajax({
			type : 'GET',
			dataType:'XML',
			data : {},
			url : '<%=request.getContextPath()%>/05/createXMLData.jsp',
			error: function(res){
				alert(res.status + ' | ' + res.responseText);
			},
			success : function(res){
				$('#resultView').empty();
				$('member' , res).each(function(){
					//$(location).attr('href','주소ㅓ');
					$('#resultView').html($('#resultView').html()+'<br>' + 
					$(this).attr('id') + ' | ' + 
					$('mem_pass', this).text() + ' | ' +
					$('mem_name', this).text() + '<br/>');
				
				})
				alert(res);
			}
		});	        
	});
	///////////////////////////////////////////////////////////////////////////////////////
	$('input[value=json요청]').click(function(){
		$.ajax({
			type:'POST',
			dataType : 'json',
			data : {},
			url : '<%=request.getContextPath()%>/05/createJsonData.jsp',
			error : function(res){
				alert(res.responseText);
			},
			success : function(res){
				//[{"key" : "값"}]
				//json 형식 문자열에 배열표현이 포함되어있으면 array처리.
// 				alert(res);
				$('#resultView').empty();
// 				for(var i=0; i<res.length; i++){
// 					$('#resultView').html($('#resultView').html()+'<br>' +
// 												res[i].mem_id + '|' + 
// 												res[i].mem_pass + '|' + 
// 												res[i].mem_name + '<br>');
// 				}

				$.each(res, function(index, jsonData){
					$('#resultView').html($('#resultView').html()+'<br>' +
							jsonData.mem_id + ' | ' +
							jsonData.mem_pass + ' | ' +
							jsonData.mem_name + ' <br> ');
								
				})
			}
		})
	});
	
});
</script>
</head>
<body>
XML 데이타 요청 : <input type="button" value="XML요청" /><br/> 
JSON 데이타 요청 : <input type="button" value="json요청" /><br/> 
<div id="resultView"></div>
</body>
</html>