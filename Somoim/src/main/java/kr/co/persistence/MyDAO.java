package kr.co.persistence;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface MyDAO {
	public abstract List<CrewVO> crew_sel_list(Criteria cri, String category, String region, String mid) throws Exception;
	public abstract List<CrewVO> attend_crew_list(String mid) throws Exception;

}