package kr.or.ddit.dao.idpic;

import java.sql.SQLException;

import kr.or.ddit.vo.IDPictureVO;
/**
 * @Class Name : IIDPicDao.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public interface IIDPicDao {

	/**
	 * 사진등록
	 * @param idPicInfo
	 * @throws SQLException
	 */
	public void insertIdPicture(IDPictureVO idPicInfo) throws SQLException;
}
