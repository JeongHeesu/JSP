package kr.or.ddit.service.buyer;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BuyerVO;

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
 *    2018.03.05.  정희수     바이어 목록
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IBuyerService {
	/**
	 * 바이어 목룍
	 * @return List<BuyerVO>
	 */
	public List<BuyerVO> getBuyerInfo(String prod_buyer);
	
	/**
	 * 바이어 목록
	 * @param params
	 * @return List<BuyerVO>
	 */
	public List<BuyerVO> getBuyerList(Map<String, String> params);
}
