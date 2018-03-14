package kr.or.ddit.dao.idpic;

import java.sql.SQLException;

import kr.or.ddit.vo.IDPictureVO;

public interface IIDPicDao {

	public void insertIdPicture(IDPictureVO idPicInfo) throws SQLException;
}
