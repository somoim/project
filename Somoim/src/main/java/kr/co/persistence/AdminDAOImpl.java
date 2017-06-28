package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CrewVO;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	private final String NAMESPACE = "kr.co.mapper.AdminMapper";

	@Inject
	private SqlSession session;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE+".memberInfo", mid);
	}

	@Override
	public int memberCnt() throws Exception {
		// TODO Auto-generated method stub
		Integer memberCnt = session.selectOne(NAMESPACE+".memberCnt");
		if(memberCnt == null) {
			memberCnt = 0;
		}
		return memberCnt;
	}

	@Override
	public int crewCnt() throws Exception {
		// TODO Auto-generated method stub
		Integer crewCnt = session.selectOne(NAMESPACE+".crewCnt");
		if(crewCnt == null) {
			crewCnt = 0;
		}
		return crewCnt;
	}

	@Override
	public List<CrewVO> crewMemberCnt() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".crewMemberCnt");
	}

	@Override
	public List<MemberVO> memberList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".memberList");
	}

	@Override
	public int visitorCnt() throws Exception {
		// TODO Auto-generated method stub
		Integer visitorCnt = session.selectOne(NAMESPACE+".visitorCnt");
		if(visitorCnt == null) {
			visitorCnt = 0;
		}
		return visitorCnt;
	}

	@Override
	public List<VisitorVO> visitorList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".visitorList");
	}

}
