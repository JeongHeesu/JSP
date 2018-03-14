package kr.or.ddit.service.idpic;

import java.sql.SQLException;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.dao.idpic.IIDPicDao;
import kr.or.ddit.dao.idpic.IIDPicDaoImpl;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.IDPictureVO;

public class IIDPicSertviceImpl implements IIDPicService {

	private static IIDPicService service = new IIDPicSertviceImpl();
	
	private IIDPicDao dao;
	
	private IIDPicSertviceImpl(){
		dao = IIDPicDaoImpl.getInstance();
	}
	
	public static IIDPicService getInstance(){
		return (service == null) ? service = new IIDPicSertviceImpl() : service ;
	}
	@Override
	public IDPictureVO insertIdPicture(String mem_id,FileItem item) {
		IDPictureVO idpicInfo =  AttachFileMapper.idPicMapping(mem_id,item);
		try {
			dao.insertIdPicture(idpicInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idpicInfo;
	}

}
