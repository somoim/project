package kr.co.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.sListVO;

@Repository
public class sListDAOImpl implements sListDAO {
	
	private final String NAMESPACE = "kr.co.mapper.sListMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public sListVO slist_list(int cno) throws Exception {
		return session.selectOne(NAMESPACE+".slist_list", cno);
	}

}
