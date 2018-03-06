package kr.or.ddit.service.buyer;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.buyer.IBuyerDao;
import kr.or.ddit.dao.buyer.IBuyerDaoImpl;
import kr.or.ddit.vo.BuyerVO;

/**
 * @Class Name : IBuyerServiceImpl.java
 * @Description : IBuyerDao 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @see IBuyerService
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
public class IBuyerServiceImpl implements IBuyerService {
	
	private IBuyerDao dao;
	
	private static IBuyerService service = new IBuyerServiceImpl();
	
	/**
	 * 생성자
	 */
	private IBuyerServiceImpl(){
		dao = IBuyerDaoImpl.getInstance();
	}
	/**
	 * 싱글톤
	 * @return IBuyerService
	 */
	public static IBuyerService getInstance(){
		return (service == null )? service = new IBuyerServiceImpl() : service;
	}
	/**
	 * 바이어 목록
	 */
	@Override
	public List<BuyerVO> getBuyerInfo(String prod_buyer) {
		List<BuyerVO> list = null;
		try {
			list = dao.getBuyerInfo(prod_buyer);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * 바이어목록(MAP)
	 */
	@Override
	public List<BuyerVO> getBuyerList(Map<String, String> params) {
		List<BuyerVO> buyerList = null;
		try {
			buyerList = dao.getBuyerList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerList;
	}
}
