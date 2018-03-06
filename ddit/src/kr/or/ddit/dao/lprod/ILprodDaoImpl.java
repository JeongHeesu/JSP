package kr.or.ddit.dao.lprod;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.LprodVO;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * @Class Name : ILprodDaoImpl.java
 * @Description : DB 접근 쿼리
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @see ILprodDao
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class ILprodDaoImpl implements ILprodDao {
	private SqlMapClient client;
	
	private static ILprodDao dao = new ILprodDaoImpl();
	/**
	 * 생성자
	 */
	private ILprodDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	/**
	 * 싱글톤
	 * @return ILprodDaoImpl
	 */
	public static  ILprodDao getInstance(){
		return (dao == null ) ? dao= new ILprodDaoImpl() : dao ;
	}
	/**
	 * lprod_gu 가져오기
	 */
	@Override
	public List<LprodVO> lprodInfoList() throws SQLException {
		return client.queryForList("lprod.lprod_gu");
	}
	
}
