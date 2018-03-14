package kr.or.ddit.dao.freeboard;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.service.freeboard.IFreeboardService;
import kr.or.ddit.vo.FreeboardVO;

/**
 * @Class Name : IFreeboardDaoImpl.java
 * @Description : Dao 쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.09.
 * @version 1.0
 * @see IFreeboardDao
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.09.  정희수      최초작성
 *    2018.03.12.  정희수      insert,view
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */

public class IFreeboardDaoImpl implements IFreeboardDao {

	private static IFreeboardDao dao = new IFreeboardDaoImpl();
	
	private SqlMapClient client;
	
	private IFreeboardDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IFreeboardDao getInstance(){
		return (dao == null) ? dao = new IFreeboardDaoImpl() : dao ;
	}
	
	@Override
	public FreeboardVO getFreeboardInfo(Map<String, String> params)
			throws SQLException {
		return (FreeboardVO) client.queryForObject("free.freeboardInfo", params);
	}

	/**
	 * 게시판 목록
	 */
	@Override
	public List<FreeboardVO> getFreeboardList() throws SQLException {
		return client.queryForList("free.freeboardList");
	}

	/**
	 * 게시글 등록
	 */
	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		return (String) client.insert("free.insertFreeboard", freeboardInfo);
	}

	/**
	 * 게시글 수정
	 */
	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo)
			throws SQLException {
		client.update("free.updateFreeboard", freeboardInfo);
	}

	/**
	 * 게시글 비활성화(삭제)
	 */
	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws SQLException {
		client.update("free.deleteFreeboard", params);
	}

}
