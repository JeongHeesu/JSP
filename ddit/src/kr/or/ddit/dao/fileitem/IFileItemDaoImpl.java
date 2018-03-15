package kr.or.ddit.dao.fileitem;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.dao.idpic.IIDPicDao;
import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.FileItemVO;
/**
 * @Class Name : IFileItemDaoImpl.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @see IFileItemDao
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class IFileItemDaoImpl implements IFileItemDao {
	
	private static IFileItemDao dao = new IFileItemDaoImpl();
	
	private SqlMapClient client;
	
	private IFileItemDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFileItemDao getInstance(){
		return (dao == null)? dao=new IFileItemDaoImpl() : dao;
	}
	
	
	@Override
	public void updateFileItemInfo(FileItemVO fileItemInfo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFileItemInfo(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	/**
	 * 파일불러오기
	 */
	@Override
	public FileItemVO getFileItemInfo(Map<String, String> params)
			throws SQLException {
		return (FileItemVO) client.queryForObject("file.fileItemInfo", params);
	}

	@Override
	public List<FileItemVO> getFileItemList(Map<String, String> params)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 파일등록
	 */
	@Override
	public void insertFileItemInfo(List<FileItemVO> fileItemList)
			throws SQLException {
		// commit 첫번째 인서트(성공), 두번째 인서트(성공)
		//			startTransaction -> commitTransaction -> endTransaction
		// rollback : 첫번째 인서트 (성공), 두번쨰 인서트 (실패)
		//			startTransaction -> endTransaction
		try{
			client.startTransaction();
			for(FileItemVO fileItemInfo : fileItemList){
				client.insert("file.insertfile", fileItemInfo);
			}
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
	}

}
