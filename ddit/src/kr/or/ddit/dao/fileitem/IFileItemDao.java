package kr.or.ddit.dao.fileitem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
/**
 * @Class Name : IFileItemDao.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IFileItemDao {
	
	/**
	 * 업데이트
	 * @param fileItemInfo
	 * @throws SQLException
	 */
	public void updateFileItemInfo(FileItemVO fileItemInfo) throws SQLException;
	
	/**
	 * 삭제
	 * @param params
	 * @throws SQLException
	 */
	public void deleteFileItemInfo(Map<String, String>params)  throws SQLException;
	
	/**
	 * 파일선택정보
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public FileItemVO getFileItemInfo(Map<String, String>params)  throws SQLException;
	
	/**
	 * 파일전체정보
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public List<FileItemVO> getFileItemList(Map<String, String>params) throws SQLException;
	
	/**
	 * 파일 등록
	 * @param fileItemList
	 * @throws SQLException
	 */
	public void insertFileItemInfo(List<FileItemVO> fileItemList) throws SQLException;
	
}
