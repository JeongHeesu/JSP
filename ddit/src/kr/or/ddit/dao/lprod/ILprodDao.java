package kr.or.ddit.dao.lprod;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.vo.LprodVO;

/**
 * @Class Name : ILprodDao.java
 * @Description : IBuyerDao 연결
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
public interface ILprodDao {

	/**
	 * Lprod_gu 값 가져오기
	 * @return List<LprodVO>
	 * @throws SQLException
	 */
	public List<LprodVO> lprodInfoList() throws SQLException;

}
