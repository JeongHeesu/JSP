package kr.or.ddit.service.zipcode;

/**
 * @class Name : IZipcodeServiceImpl.java
 * @Description : Dao 연결
 * @Modification Information
 * @author 정희수
 * @since  2018.03.05.
 * @version 1.0
 * @see IZipcodeService
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.ziocode.IZipcodeDao;
import kr.or.ddit.dao.ziocode.IZipcodeDaoImpl;
import kr.or.ddit.vo.ZipcodeVO;

public class IZipcodeServiceImpl implements IZipcodeService{

	private IZipcodeDao dao;
	
	private static IZipcodeService service = new IZipcodeServiceImpl();
	
	private IZipcodeServiceImpl(){
		dao = IZipcodeDaoImpl.getInstance();
	}
	
	public static IZipcodeService getInstance(){
		return (service == null ) ? service = new IZipcodeServiceImpl() : service;
	}
	@Override
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params) {
		List<ZipcodeVO> zipcodeList = null;
		try {
			zipcodeList = dao.getZipcodeList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return zipcodeList;
	}

}
