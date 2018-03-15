package kr.or.ddit.service.idpic;

import java.sql.SQLException;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.dao.idpic.IIDPicDao;
import kr.or.ddit.dao.idpic.IIDPicDaoImpl;
import kr.or.ddit.utils.AttachFileMapper;
import kr.or.ddit.vo.IDPictureVO;
/**
 * @Class Name : IIDPicService.java
 * @Description :  쿼리질의
 * @Modification Information
 * @author 정희수
 * @since  2018.03.14.
 * @see IIDPicService
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.14.  정희수       최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
public class IIDPicSertviceImpl implements IIDPicService {

	private static IIDPicService service = new IIDPicSertviceImpl();
	
	private IIDPicDao dao;
	
	private IIDPicSertviceImpl(){
		dao = IIDPicDaoImpl.getInstance();
	}
	
	public static IIDPicService getInstance(){
		return (service == null) ? service = new IIDPicSertviceImpl() : service ;
	}
	/**
	 * 사진등록
	 */
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
