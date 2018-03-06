package kr.or.ddit.dao.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.buyer.IBuyerDao;
import kr.or.ddit.dao.buyer.IBuyerDaoImpl;
import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

import com.ibatis.sqlmap.client.SqlMapClient;
/**
 * @Class Name : IProdDaoImpl.java
 * @Description : pord Dao Impl
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @version 1.0
 * @see IProdDao
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
*/
public class IProdDaoImpl implements IProdDao{
	private SqlMapClient client;
	
	private static IProdDao dao = new IProdDaoImpl();
	/**
	 * 생성자
	 */
	private IProdDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	/**
	 * 싱글톤 
	 * @return IProdDao
	 */
	public static IProdDao getInstance(){
		return (dao == null ) ? dao = new IProdDaoImpl() : dao ;
	}
	
	/**
	 * prod 전체 목록 출력
	 * @return List<ProdVO>
	 * @throws SQLException 
	 */
	@Override
	public List<ProdVO> getProdList() throws SQLException{
		return client.queryForList("prod.prodList");
	}
	
	/**
	 * prod 선택 내용 출력
	 * @return HashMap
	 * @throws SQLException 
	 */
	@Override
	public HashMap<String, Object> getProdInfo(String params)
			throws SQLException {
		return  (HashMap<String, Object>) client.queryForObject("prod.getProdInfo",params);
	}
	/**
	 * 업데이트
	 * @throws SQLException
	 */
	@Override
	public void updateMemberInfo(ProdVO prodInfo) throws SQLException {
		client.update("prod.updateProd", prodInfo);
	}
	/**
	 * 상품등록
	 */
	@Override
	public void insertProd(ProdVO prodInfo) throws SQLException {
		client.insert("prod.insertProdInfo",prodInfo);
	}
	/**
	 * 상품삭제
	 */
	@Override
	public void deleteProdInfo(String prod_id) throws SQLException {
		client.update("prod.deleteProdInfo", prod_id);
	}
	
}
