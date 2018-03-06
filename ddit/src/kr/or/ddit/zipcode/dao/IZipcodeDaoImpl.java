package kr.or.ddit.zipcode.dao;
/**
 * @Interface Name : IZipcodeDaoImpl.java
 * @Description : dao에서  DB로 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.03.05.
 * @version 1.0
 * @see IZipcodeDao
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipcodeVO;

public class IZipcodeDaoImpl implements IZipcodeDao {

	private SqlMapClient client;

	private static IZipcodeDao dao = new IZipcodeDaoImpl();
	
	private IZipcodeDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IZipcodeDao getInstance(){
		return (dao == null) ? dao = new IZipcodeDaoImpl() : dao;
	}
	
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) throws SQLException {
		return client.queryForList("zipcode.zipcodeList", params);
	}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

}
