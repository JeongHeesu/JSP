package kr.or.ddit.service.prod;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.buyer.IBuyerDaoImpl;
import kr.or.ddit.dao.prod.IProdDao;
import kr.or.ddit.dao.prod.IProdDaoImpl;
import kr.or.ddit.service.buyer.IBuyerService;
import kr.or.ddit.service.buyer.IBuyerServiceImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ProdVO;

/**
 * @Class Name : IProdServiceImpl.java
 * @Description : IProdDao 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @see IProdService
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class IProdServiceImpl implements IProdService {
	
	private IProdDao dao;
	
	private static IProdService service = new IProdServiceImpl();
	
	/**
	 * 생성자
	 */
	private IProdServiceImpl(){
		dao = IProdDaoImpl.getInstance();
	}
	/**
	 * 싱글톤
	 * @return IBuyerService
	 */
	public static IProdService getInstance(){
		return (service == null )? service = new IProdServiceImpl() : service;
	}
	/**
	 * prod 목록 출력
	 */
	@Override
	public List<ProdVO> getProdList() {
		List<ProdVO> prodList = null;
		try {
			prodList = dao.getProdList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodList;
	}
	
	/**
	 * prod 자세한 항목
	 */
	@Override
	public HashMap<String, Object> getProdInfo(String params) {
		HashMap<String, Object> prodInfo = null;
		try {
			prodInfo = dao.getProdInfo(params);
			System.out.println("서비스");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return prodInfo;
	}
	
	/**
	 * 업데이트
	 */
	@Override
	public void updateProdInfo(ProdVO prodInfo) {
		try {
			dao.updateMemberInfo(prodInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	/**
	 * 상품등록
	 */
	@Override
	public void insertProd(ProdVO prodInfo) {
		try {
			dao.insertProd(prodInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 상품 삭제
	 */
	@Override
	public void deleteProdInfo(String prod_id) {
		try {
			dao.deleteProdInfo(prod_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
