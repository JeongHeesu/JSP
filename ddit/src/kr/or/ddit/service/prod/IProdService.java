package kr.or.ddit.service.prod;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

/**
 * @Class Name : IProdService.java
 * @Description : IProdrDao 연결
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
public interface IProdService {
	/**
	 * prod 전체 목록 출력
	 * @return List<ProdVO>
	 */
	public List<ProdVO> getProdList();
	
	/**
	 * 상품에 대한 정보 출력
	 * @param String
	 * @return HashMap
	 */
	public HashMap<String, Object> getProdInfo(String params);

	/**
	 * 업데이트
	 * @param prodInfo
	 */
	public void updateProdInfo(ProdVO prodInfo);
	
	/**
	 * 상품등록
	 * @param prodInfo
	 */
	public void insertProd(ProdVO prodInfo);
	
	/**
	 * 상품삭제
	 * @param prod_id
	 */
	public void deleteProdInfo(String prod_id);
	
//	LPROD_NM,
//	#PROD_ID,
//	#PROD_NAME,
//	#PROD_LGU,
//	#PROD_IMG,
//	#PROD_BUYER,
//	#PROD_COST,
//	#PROD_PRICE,
//	#PROD_SALE,
//	#PROD_OUTLINE,
//	#PROD_DETAIL,
//	#PROD_TOTALSTOCK,
//	#PROD_PROPERSTOCK,
//	#PROD_INSDATE,
//	#PROD_SIZE,
//	#PROD_COLOR,
//	#PROD_UNIT,
//	#PROD_QTYIN,
//	#PROD_QTYSALE,
//	#PROD_DELIVERY,
//	#PROD_MILEAGE,
//	#PROD_DELETE,
	
	
}