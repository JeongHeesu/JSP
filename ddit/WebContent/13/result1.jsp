<%--==============================================================
 * 브라우저 파일 다운로드1
 * @author 정희수
 * @since  2018.03.13.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       	수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.13. 	 정희수    	최초작성 
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.global.GlobalConstant"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//클라이언트의 파일 업로드 요청을 서버 내에서 처리하기 위한 환경
	//	1. http://commons.apache.org
	// 	commons-fileupload-1.2.2.jar
	// 	commons-io-2.3.jar
	// 2. WEB-INF  import
	// 클라이언트에서 업로드 된 파일의 저장소
	// 		임시저장소(해당 파일의 저장처리를 위한 임시 저장소) - 서버에 따라 메로리, 파일시스템
	//		실제저장소(해당 파일의 실 저장소)
// 	String savePath = application.getRealPath("upload");
	String savePath = GlobalConstant.SAVE_PATH;
	application.log("savePath : " + savePath );
	
	//어비로드된 파일은 사이즈를 제한해서 저장처리
	int fileSizeMax = 1024*1024*100;
	
	//클라이언트 요청																							request.getContentType()
	//  일반 요청 : location.href or location.rerplace() or <a href=""/>`											공백
	//				form method="get|post"								
	//				form enctypek="apllication/x-www-form-urlencoded"											apllication/x-www-form-urlencoded
	//				ajax type:get|post
	//				ajax contentType:apllication/x-www-form-urlencoded											apllication/x-www-form-urlencoded
	// 파일 업로드 요청 :  form method=post enctype=multipart/form-data												multipart/form-data
	//					ajax type:post, contentType=multipart/form-data											multipart/form-data
	// 해당 클라이언트의 요청이 파일업로드 요청 여부 체크
	// multipart/form-data : true
	// 일반요청 			   : false
	boolean multipartFlag = ServletFileUpload.isMultipartContent(request);
	if(multipartFlag){
		//임시저장소 설정
		//엄로드한 파일의 사이즈 제한
		//업로드한 파일은 메모리에 임시저장 처리
		//임시저장된 파일은 실제 저장처리 후 자동  삭제
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//다수의 파일의 전체 사이즈 제한
		factory.setSizeThreshold(fileSizeMax);
		factory.setRepository(new File(savePath));

		ServletFileUpload fileUploadServlet = new ServletFileUpload(factory);
		//다수의 파일의 전체 사이즈를 제한
		fileUploadServlet.setSizeMax(fileSizeMax);
		//파일 단위의 사이즈 제한
// 		fileUploadServlet.setFileSizeMax(1024*1024);
		
		//				|----------폼필드------------|
		//클라이언트		 mem_id	  mem_pass	mem_name   files	files	  전송
		//서버(업로드)	FileItem  FileItem  FileItem  FileItem  FileItem  객체
		List<FileItem> items = fileUploadServlet.parseRequest(request);
		for(FileItem item : items){
			//폼필드와 파일 구분
			if(item.isFormField()){
				out.println("파라메터 키 : "+item.getFieldName() +"<br>");
				out.println("파라메터 값 : "+item.getString("UTF-8") +"<br>");
			}else{
				out.println("파라케터 키 : "+item.getFieldName()+"<br>");
				//브라우저별로 클라이언트에서 파일 선택시의 파일시스템 경로를 포함 or 미포함
				out.println("파라케터 파일명 : "+item.getName()+"<br>");
				out.println("파라케터 컨텐츠 타입 : "+item.getContentType()+"<br>");
				out.println("파라케터 파일 사이즈 : "+item.getSize()+"<br>");
				
				String fileName = item.getName().substring(item.getName().lastIndexOf("\\")+1);
				File saveFile = new File(savePath, fileName);
				
				item.write(saveFile);
				
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
mem_id : ${param.mem_id }<br>
mem_pass : ${param.mem_pass }<br>
mem_name : ${param.mem_name }<br>
mem_file1 : ${param.files }<br>
mem_file2 : ${param.files }<br>

</body>
</html>