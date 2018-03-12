<%--==============================================================
 * 게시판 메인폼
 * @author 정희수
 * @since  2018.03.09.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.09.  정희수      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엄마!!미안해!!</title>
</head>
<body>

<c:import url="/12/layout/header.jsp"></c:import>
<div id="wrapper">
	<c:import url="/12/layout/left.jsp"></c:import>
	<div id="page-wrapper">
		<c:import url="/12/content_header.jsp"></c:import>
		<div class="page-content">
<%-- 			<c:if test="${empty param.contentPage }"> --%>
<%-- 				<c:import url="/12/freeboard/freeboardList.jsp"></c:import> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${!empty param.contentPage }"> --%>
<%-- 				<c:import url="${param.contentPage }"></c:import> --%>
<%-- 			</c:if> --%>
			<c:import url="${empty param.contentPage ? '/12/freeboard/freeboardList.jsp' : param.contentPage}"></c:import>
		</div>
		<c:import url="/12/layout/footer.jsp"></c:import>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	//익스프레션 또는 익스프레션렝귀지 활용시 자바스크립트에서는 '' or "" 랩핑.
	// 'ture' or 'false'
	if(eval('${!empty param.message }')){
		BootstrapDialog.show({
		    title: '알림',
		    message: '${param.message }'
		});
		return;
	}
});
</script>
</html>