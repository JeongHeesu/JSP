package kr.or.ddit.dao.idpic;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.IDPictureVO;

public class IIDPicDaoImpl implements IIDPicDao {

	private static IIDPicDao dao = new IIDPicDaoImpl();
	
	private SqlMapClient client ;
	
	private IIDPicDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
	}
	
	public static IIDPicDao getInstance(){
		return (dao == null) ? dao= new IIDPicDaoImpl() : dao ;
	}

	@Override
	public void insertIdPicture(IDPictureVO idPicInfo) throws SQLException {
		client.insert("idPic.insertIdPic", idPicInfo);
	}

}
