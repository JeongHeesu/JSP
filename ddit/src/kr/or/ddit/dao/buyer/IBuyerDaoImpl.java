package kr.or.ddit.dao.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.member.IMemberDao;
import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.BuyerVO;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * @Class Name : IBuyerDaoImpl.java
 * @Description : 거래처 Dao Impl
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @version 1.0
 * @see IBuyerDao
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 *    2018.03.05.  정희수      map으로 바이어 목록 추출
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
*/
public class IBuyerDaoImpl implements IBuyerDao{
	private SqlMapClient client;
	
	private static IBuyerDao dao = new IBuyerDaoImpl();
	/**
	 * 생성자
	 */
	private IBuyerDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	/**
	 * 싱글톤 
	 * @return IBuyerDao
	 */
	public static IBuyerDao getInstance(){
		return (dao == null ) ? dao = new IBuyerDaoImpl() : dao ;
	}
	/**
	 * 바이어 목록
	 */
	@Override
	public List<BuyerVO> getBuyerInfo(String prod_buyer) throws SQLException{
		return client.queryForList("buyer.getBuyerList", prod_buyer);
	}
	/**
	 * 바이어 목록(MAP)
	 */
	@Override
	public List<BuyerVO> getBuyerList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("buyer.buyerList", params);
	}
	
}
