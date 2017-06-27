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
public class SearchDAOImpl implements SearchDAO {

	private final String NAMESPACE = "kr.co.mapper.SearchMapper";

	@Inject
	private SqlSession session;

	@Override
	public List<CrewVO> searchCategory(Criteria cri, String category) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cri", cri);
		map.put("category", category);
		return session.selectList(NAMESPACE+".searchCategory", map);
	}
	
}
