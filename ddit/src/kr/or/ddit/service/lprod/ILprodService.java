package kr.or.ddit.service.lprod;

import java.util.List;

import kr.or.ddit.vo.LprodVO;

/**
 * @Class Name : IBuyerService.java
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
 *    2018.02.28.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface ILprodService {
	/**
	 * Lprod_gu 값 가져오기
	 * @return List<LprodVO>
	 */
	public List<LprodVO> lprodInfoList();
}
