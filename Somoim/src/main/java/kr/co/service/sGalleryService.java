package kr.co.service;

import java.util.List;

import kr.co.domain.sGalleryVO;

public interface sGalleryService {
	
	abstract void sgallery_create(sGalleryVO sgallery_vo) throws Exception;
	abstract List<sGalleryVO> sgallery_list(int cno) throws Exception;
	abstract void sgallery_delete(int sg_no) throws Exception;

}
