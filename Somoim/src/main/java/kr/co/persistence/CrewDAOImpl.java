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
	public List<CrewVO> crew_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".crew_list", cri);

	}

}
