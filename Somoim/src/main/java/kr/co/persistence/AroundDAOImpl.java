package kr.co.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberVO;

@Repository
public class AroundDAOImpl implements AroundDAO {
	
	private final String NAMESPACE = "kr.co.mapper.AroundMapper";

	@Inject
	private SqlSession session;

	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".memberInfo", mid);
	}

}
