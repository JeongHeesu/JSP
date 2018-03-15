<%--==============================================================
 * 게시판 대글 폼
 * @author 정희수
 * @since  2018.03.12.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.15.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 댓글등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
});
</script>
</head>
<body>
<div class="row">
	 <div class="col-sm-3">
		 <label class="col-sm-2 control-label">No : </label>
  		 <p class="form-control-static">${param.rnum }</p>
	 </div>
	 <div class="col-sm-8">
	 	<label class="col-sm-2 control-label">제목 :</label>
    	<p class="form-control-static">${param.bo_title }</p>
	 </div>
	 <div class="col-sm-1">
	 	<p class="text-right text-danger bg-danger">의 댓글</p>
	 </div>
</div>
<hr />
<form class="form-horizontal" role="form" action="" method="post" name="freeboardReplyForm">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"><p></p></div>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-success" style="float: right;">댓글등록</button>
			<button type="button" class="btn btn-danger">취소</button>
			<button type="button" class="btn btn-info">목록</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
$(function(){
	$('form[name=freeboardReplyForm]').submit(function(){
		if(!$('#bo_title').val().validationTITLE()){
			BootstrapDialog.show({
			    title: '경고',
			    message: '게시판 제목을 입력해주세요.'
			});
			return false;
		}
		if(!$('#bo_nickname').val().validationNICKNAME()){
			BootstrapDialog.show({
			    title: '경고',
			    message: '닉네임을 입력해주세요.'
			});
			return false;
		}
		if(!$('#bo_pwd').val().validationPWD()){
			BootstrapDialog.show({
			    title: '경고',
			    message: '패스워드를 입력해주세요.'
			});
			return false;
		}
		if(!$('#bo_mail').val().validationEMAIL()){
			BootstrapDialog.show({
			    title: '경고',
			    message: '메일주소를 입력해주세요.'
			});
			return false;
		}
		$content = $('<input type="hidden" name="bo_content" value="'+ $('#bo_content').summernote('code') +'"></input>');
		
		if($content.val() == ''){
			BootstrapDialog.show({
			    title: '경고',
			    message: '게시글 내용을 입력해주세요.'
			});
			return false;
		}
	
			
		$(this).append($content);
		$(this).attr('action','${pageContext.request.contextPath}/12/freeboard/insertFreeboardReply.jsp');
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"></input>');
		$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}"></input>');
		$(this).append('<input type="hidden" name="bo_group" value="${param.bo_group}"></input>');
		$(this).append('<input type="hidden" name="bo_seq" value="${param.bo_seq}"></input>');
		$(this).append('<input type="hidden" name="bo_depth" value="${param.bo_depth}"></input>');
		
		return true;
	});
});
</script>
</html>