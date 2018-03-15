package kr.or.ddit.fileitem.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
/**
 * @Class Name : IFileItemService.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @see 
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IFileItemService {

	/**
	 * 파일 업데이트
	 * @param fileItemInfo
	 */
	public void updateFileItemInfo(FileItemVO fileItemInfo);
	
	/**
	 * 파일삭제
	 * @param params
	 */
	public void deleteFileItemInfo(Map<String, String>params);
	
	/**
	 * 선택 파일 정보
	 * @param params
	 * @return
	 */
	public FileItemVO getFileItemInfo(Map<String, String>params);
	
	/**
	 * 파일 전체정보
	 * @param params
	 * @return
	 */
	public List<FileItemVO> getFileItemList(Map<String, String>params);
	
	/**
	 * 파일 등록
	 * @param fileItemList
	 */
	public void insertFileItemInfo(List<FileItemVO> fileItemList);
}
