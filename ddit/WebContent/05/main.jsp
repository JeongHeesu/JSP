<%--==============================================================
 * 로그인시 메인화면 폼
 * @author 정희수
 * @since  2018.02.22.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22. 	 정희수    	최초작성 (스크립트) 
 *    2018.02.23. 	 정희수    	스크립트 작성 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// /05/memberForm.jsp
	// /05/memberView.jsp
	// /05/memberList.jsp
	String contentPage = request.getParameter("contentPage");
	if(contentPage == null){
		contentPage = "/05/memberList.jsp";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
</head>
<body>
<!-- 
	http://localhost/ddit/05/main.jsp
							응답객체 <= 컨텐츠 저장
							응답 객체 <= jsp: include page = 다른 jsp로 포워딩 후 취득한 컨텐츠를 저장
							응답 객체 <= 컨텐츠 저장
							응답 객체 <= jsp: include page = 다른 jsp로 포워딩 후 취득한 컨텐츠를 저장
 -->
<center>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/05/layout/header.jsp" />
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<jsp:include page="/05/layout/left.jsp" />
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<jsp:include page="<%= contentPage %>" />
			</div>
		</div>
		<div>
			<jsp:include page="/05/layout/footer.jsp" />
		</div>
	</div>
</center>
</body>
</html>









