package kr.or.ddit.service.idpic;

import org.apache.commons.fileupload.FileItem;

import kr.or.ddit.vo.IDPictureVO;
/**
 * @Class Name : IIDPicService.java
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
public interface IIDPicService {
	/**
	 * 사진등록
	 * @param mem_id
	 * @param item
	 * @return IDPictureVO
	 */
	public IDPictureVO insertIdPicture(String mem_id, FileItem item);
	

}
