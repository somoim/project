package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<CrewVO> crew_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("mid", mid);
		return session.selectList(NAMESPACE+".crew_list", map);
	}

	@Override
	public CrewVO crew_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".crew_tab_list", cno);
	}

	@Override
	public void crew_update_role(int cno, String mid) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cno);
		map.put("mid", mid);
		session.update(NAMESPACE+".crew_update_role",map);
	}

}
