package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.utils.FileUploadRequestWrapper;

import org.apache.commons.lang.StringUtils;

public class FileUploadFilter implements Filter {

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		//일반요청 : 공백(location.href or loaction.replace() or <a href="">
		// 				브라우저 주소창에 직접  URL 입력)
//						<form> submitt 전송 -  apllication/x-www-form-urlencoded
		// 파일업로드 요청 : <form method=post enctype=mulipart/form-data>
		//				  ajax contentType:multipart/form-data
		
		
//		String contentType = req.getContentType();
		
//		if(StringUtils.isNotEmpty(contentType)&&contentType.toLowerCase().contains("multipart")){
		
			FileUploadRequestWrapper wrapper = new FileUploadRequestWrapper((HttpServletRequest)req);
			chain.doFilter(wrapper, res);
			
//		}else{
//			chain.doFilter(req, res);
//		}
			
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
