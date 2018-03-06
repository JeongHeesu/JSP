<%--==============================================================
 * 파일의 경로설정
 * @author 정희수
 * @since  2018.02.22.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	절대경로(o) : 경로 표현의 시작이 컨텍스트 루트|패스
		/ddit/04/application.jsp
		/ddit/image/ddit.jpg
	상대경로 : 경로 표현의 시작이 해당 jsp.
		../image/ddit.jpg
 -->
 
 <img alt="" src="/ddit/image/ddit.jpg" style="width : 200px; height : 150px;"><br>
 <img alt="" src="../image/ddit.jpg" style="width : 200px; height : 150px;"><br>
 <img alt="" src="./image/ddit.jpg"  style="width : 200px; height : 150px;"><br>
</body>
</html>