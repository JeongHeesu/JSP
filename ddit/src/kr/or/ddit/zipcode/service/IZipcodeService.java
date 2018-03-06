package kr.or.ddit.zipcode.service;
/**
 * @Interface Name : IZipcodeService.java
 * @Description : service 단
 * @Modification Information
 * @author 정희수
 * @since  2018.03.05.
 * @version 1.0
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.05.  정희수      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
 */
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipcodeVO;

public interface IZipcodeService {
	public List<ZipcodeVO> getZipcodeList(Map<String, String> params);
}
