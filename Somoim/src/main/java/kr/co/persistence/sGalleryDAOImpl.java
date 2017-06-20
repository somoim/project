package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.sGalleryVO;

@Repository
public class sGalleryDAOImpl implements sGalleryDAO {
	
	private static final int HashMap = 0;
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.sGalleryMapper";

	@Override
	public void sgallery_create(sGalleryVO sgallery_vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(NAMESPACE+".sgallery_create", sgallery_vo);
	}

	@Override
	public List<sGalleryVO> sgallery_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".sgallery_list", cno);
	}

	@Override
	public void sgallery_delete(int sg_no) throws Exception {
		// TODO Auto-generated method stub
		session.delete(NAMESPACE+".sgallery_delete", sg_no);
	}

}
