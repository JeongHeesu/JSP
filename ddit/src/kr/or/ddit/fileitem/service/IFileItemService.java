package kr.or.ddit.fileitem.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemService {

	public void updateFileItemInfo(FileItemVO fileItemInfo);
	
	public void deleteFileItemInfo(Map<String, String>params);
	
	public FileItemVO getFileItemInfo(Map<String, String>params);
	
	public List<FileItemVO> getFileItemList(Map<String, String>params);
	
	public void insertFileItemInfo(List<FileItemVO> fileItemList);
}
