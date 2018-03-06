package kr.or.ddit.service.lprod;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dao.lprod.ILprodDao;
import kr.or.ddit.dao.lprod.ILprodDaoImpl;
import kr.or.ddit.vo.LprodVO;

/**
 * @Class Name : ILprodServiceImpl.java
 * @Description : ILprodDao 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.02.27.
 * @see ILprodService                                                          
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.27.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class ILprodServiceImpl implements ILprodService {
	private ILprodDao dao;
	
	private static ILprodService service = new ILprodServiceImpl();
	
	/**
	 * 생성자
	 */
	private ILprodServiceImpl(){
		dao = ILprodDaoImpl.getInstance();
	}
	/**
	 * 싱글톤
	 * @return ILprodServiceImpl
	 */
	public static ILprodService getInstance(){
		return (service == null )? service = new ILprodServiceImpl() : service;
	}
	/**
	 * lprod_gu 값 가져오기
	 */
	@Override
	public List<LprodVO> lprodInfoList() {
		List<LprodVO> list = null;
		try {
			list =  dao.lprodInfoList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
