package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.ChattingVO;

@Repository
public class chattingDAOImple implements ChattingDAO{
	
	@Inject
	private SqlSession session;
	private final String NAMESPACE="kr.co.mapper.chattingMapper";
	
	
	@Override
	public void insert_msg(ChattingVO vo) throws Exception {
		session.insert(NAMESPACE+".insert_msg", vo);
		
	}

	@Override
	public List<ChattingVO> msg_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".msg_list", cno);
	}

}
