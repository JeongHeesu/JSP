<%--==============================================================
 * 게시판 뷰 폼
 * @author 정희수
 * @since  2018.03.12.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.12.  정희수     최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 	String bo_no = request.getParameter("bo_no");

	Map<String, String> params = new HashMap<String, String>();
	params.put("bo_no", bo_no);
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	FreeboardVO freeboardInfo = service.getFreeboardInfo(params);
%>\
<c:set var="freeboardInfo" value="<%=freeboardInfo %>"></c:set>
<c:url var="updateFreeboard" value="/12/freeboard/updateFreeboard.jsp"></c:url>
<c:url var="main" value="/12/main.jsp"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
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
<form class="form-horizontal" role="form" action="" method="post" name="freeboardViewForm">
	<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id }">
	<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr }">
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
			<input type="text" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"><p></p></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style="height: 200px;">
				<div class="item active">
					<img src="./images/thumbs/arch-1.jpg" alt="pic1">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/arch-2.jpg" alt="pic2">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/autumn-1.jpg" alt="pic3">
				</div>
		
				<div class="item">
					<img src="./images/thumbs/boats-1.jpg" alt="pic4">
				</div>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-success" name="check">글쓰기</button>
			<button type="button" class="btn btn-danger" id="deleteBtn" name="check">삭제</button>
			<button type="button" class="btn btn-primary">답글</button>
			<button type="button" class="btn btn-info" id="ListGo">목록</button>
			<button type="submit" class="btn btn-default" style="float: right" name="check">수정</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
$(function(){
	$('#bo_title').val('${freeboardInfo.bo_title}');
	$('#bo_nickname').val('${freeboardInfo.bo_nickname}');
	$('#bo_pwd').val('${freeboardInfo.bo_pwd}');
	$('#bo_mail').val('${freeboardInfo.bo_mail}');
	//섬머노트에 값 추가 할때
	$('#bo_content').summernote('code', '${freeboardInfo.bo_content}');
	
	$('#ListGo').click(function(){
		$(location).attr('href','${main}');		
	});
	
	
	$('button[name=check]').click(function(){
		if(eval('${empty LOGIN_MEMBERINFO}')){
			BootstrapDialog.show({
			    title: '경고',
			    message: '로그인해주세요.'
			});
			return false;
		}
		return;
	});
	
	
	$('form[name=freeboardViewForm]').submit(function(){
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

		if('${freeboardInfo.bo_pwd}' != '${LOGIN_MEMBERINFO.mem_pass}'){
			BootstrapDialog.show({
			    title: '경고',
			    message: '비밀번호가 틀립니다. 다시입력바랍니다.'
			});
			return false;
		}
		
		if('${freeboardInfo.bo_writer}' != '${LOGIN_MEMBERINFO.mem_id}'){
			BootstrapDialog.show({
			    title: '경고',
			    message: '작성 게시글이 아닙니다.'
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
		
		$bo_no = $('<input type="hidden" name="bo_no" value="'+${param.bo_no}+'"/>');
		$('form[name=freeboardViewForm]').append($bo_no);
		
		$(this).append($content);
		$(this).attr('action','${updateFreeboard}');
		$(this).submit();
		
	});
	
	$('#deleteBtn').click(function(){
		if('${freeboardInfo.bo_writer}' != '${LOGIN_MEMBERINFO.mem_id}'){
			BootstrapDialog.show({
			    title: '경고',
			    message: '작성 게시글이 아닙니다.'
			});
			return false;
		}
		$(location).attr('href','${pageContext.request.contextPath}/12/freeboard/deleteFreeboard.jsp?bo_no=${param.bo_no}');
	});
	
	
});
</script>
</html>