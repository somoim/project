package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

@Repository
public class CrewDAOImpl implements CrewDAO {

	private final String NAMESPACE = "kr.co.mapper.CrewMapper";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void crew_create(CrewVO crew_vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CrewVO> crew_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void crew_update(CrewVO crew_vo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void crew_delete(int cno) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public CrewVO crew_read(int cno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrewVO> crew_sel_lis(Criteria crit, String category, String region, String mid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrewVO> crew_search(Criteria cri, String search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrewVO> crew_category_list(Criteria cri, String category) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer crew_member_cnt(String cno) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
