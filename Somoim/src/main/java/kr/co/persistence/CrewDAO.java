package kr.co.persistence;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface CrewDAO {
	public abstract void crew_create(CrewVO crew_vo) throws Exception;
	public abstract List<CrewVO> crew_list(Criteria cri) throws Exception;
	public abstract void crew_update(CrewVO crew_vo) throws Exception;
	public abstract void crew_delete(int cno) throws Exception;
	public abstract CrewVO crew_read(int cno) throws Exception;
	public abstract List<CrewVO> crew_sel_lis(Criteria crit, String category, String region, String mid) throws Exception;
	public abstract List<CrewVO> crew_search(Criteria cri, String search) throws Exception;
	public abstract List<CrewVO> crew_category_list(Criteria cri, String category) throws Exception;
	public abstract Integer crew_member_cnt(String	cno) throws Exception;

}
