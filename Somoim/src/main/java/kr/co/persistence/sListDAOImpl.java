package kr.co.persistence;

import java.util.List;

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

	@Override
	public List<sListVO> slist_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(NAMESPACE+".slist_tab_list", cno);
	}

	@Override
	public void update_s_join_cnt(int sl_no) throws Exception {
		// TODO Auto-generated method stub
		session.update(NAMESPACE+".update_s_join_cnt", sl_no);
	}

}
