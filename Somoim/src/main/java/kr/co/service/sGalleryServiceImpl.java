package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.sGalleryVO;
import kr.co.persistence.sGalleryDAO;

@Service
public class sGalleryServiceImpl implements sGalleryService {

	@Inject
	sGalleryDAO sgallery_dao;
	
	@Override
	public void sgallery_create(sGalleryVO sgallery_vo) throws Exception {
		// TODO Auto-generated method stub
		sgallery_dao.sgallery_create(sgallery_vo);
	}

	@Override
	public List<sGalleryVO> sgallery_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sgallery_dao.sgallery_list(cno);
	}

	@Override
	public void sgallery_delete(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		sgallery_dao.sgallery_delete(sg_no);
	}

}
