package kr.or.ddit.dao.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.service.buyer.IBuyerService;
import kr.or.ddit.vo.BuyerVO;
/**
 * @Class Name : IBuyerDao.java
 * @Description : IBuyerDao 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.02.28.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.28.  정희수      최초작성
 *    2018.03.05.  정희수     바이어 목록
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IBuyerDao {
	/**
	 * 바이어 목룍
	 * @return List
	 * @throws SQLException
	 */
	public List<BuyerVO> getBuyerInfo(String prod_buyer) throws SQLException;

	/**
	 * 바이어 목록
	 * @param params
	 * @return List<BuyerVO>
	 * @throws SQLException
	 */
	public List<BuyerVO> getBuyerList(Map<String, String> params) throws SQLException;
}
