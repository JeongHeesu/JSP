package kr.or.ddit.dao.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

/**
 * @Class Name : IProdDao.java
 * @Description : IProdrDaoImple 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IProdDao {

	/**
	 * prod 전체 목록 출력
	 * @return List<ProdVO>
	 * @throws SQLException 
	 */
	public List<ProdVO> getProdList() throws SQLException;
	
	/**
	 * 상품에 대한 정보 출력
	 * @param HashMap
	 * @throws SQLException 
	 */
	public HashMap<String, Object> getProdInfo(String params) throws SQLException;
	
	/**
	 * 업데이트
	 * @param prodInfo
	 * @throws SQLException 
	 */
	public void updateMemberInfo(ProdVO prodInfo) throws SQLException;
	
	/**
	 * 상품등록
	 * @param prodInfo
	 *  @throws SQLException 
	 */
	public void insertProd(ProdVO prodInfo) throws SQLException;
	
	/**
	 * 상품삭제
	 * @param prod_id
	 *  @throws SQLException 
	 */
	public void deleteProdInfo(String prod_id) throws SQLException;

}
