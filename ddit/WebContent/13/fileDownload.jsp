<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");

	File downloadFile = new File(GlobalConstant.SAVE_PATH, fileName);
	
	if(downloadFile.exists()){
		// fileName 한글일때 브라우저의 다운로드창 출력시의 파일이름은 UTF-8로 인코딩 처리.
		fileName = URLEncoder.encode(fileName, "UTF-8");
		
		response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
		response.setContentType("application/octet-stream");
		response.setContentLength((int)downloadFile.length());
		
		out.clear();
		out = pageContext.pushBody();
		
		BufferedInputStream bi =
				new BufferedInputStream(new FileInputStream(downloadFile));
		BufferedOutputStream bo =
				new BufferedOutputStream(response.getOutputStream());
		
		byte[] buffer = new byte[(int)downloadFile.length()];
		int readCnt = 0;
		while((readCnt = bi.read(buffer)) != -1){
			bo.write(buffer);
		}
		
		bi.close();
		bo.close();
	}
%>
