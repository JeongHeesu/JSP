package kr.or.ddit.fileitem.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.fileitem.IFileItemDao;
import kr.or.ddit.dao.fileitem.IFileItemDaoImpl;
import kr.or.ddit.vo.FileItemVO;
/**
 * @Class Name : IFileItemServiceImpl.java
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
public class IFileItemServiceImpl implements IFileItemService {

	private IFileItemDao dao;
	
	private static IFileItemService service = new IFileItemServiceImpl();
	
	private IFileItemServiceImpl (){
		dao = IFileItemDaoImpl.getInstance();
	}
	
	public static IFileItemService getInstance(){
		return (service == null ) ? service = new IFileItemServiceImpl() : service;
	}
	
	@Override
	public void updateFileItemInfo(FileItemVO fileItemInfo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFileItemInfo(Map<String, String> params) {
		// TODO Auto-generated method stub

	}

	/**
	 * 선택파일정보
	 */
	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params) {
		FileItemVO fileItemInfo = null;
		try {
			fileItemInfo = dao.getFileItemInfo(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fileItemInfo;
	}

	@Override
	public List<FileItemVO> getFileItemList(Map<String, String> params) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertFileItemInfo(List<FileItemVO> fileItemList) {
		// TODO Auto-generated method stub

	}

}
