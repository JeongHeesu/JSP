package kr.or.ddit.dao.idpic;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.IDPictureVO;
/**
 * @Class Name : IIDPicDaoImpl.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @see IIDPicDao
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class IIDPicDaoImpl implements IIDPicDao {

	private static IIDPicDao dao = new IIDPicDaoImpl();
	
	private SqlMapClient client ;
	
	private IIDPicDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IIDPicDao getInstance(){
		return (dao == null) ? dao= new IIDPicDaoImpl() : dao ;
	}

	/**
	 * 사진등록
	 */
	@Override
	public void insertIdPicture(IDPictureVO idPicInfo) throws SQLException {
		client.insert("idPic.insertIdPic", idPicInfo);
	}

}
