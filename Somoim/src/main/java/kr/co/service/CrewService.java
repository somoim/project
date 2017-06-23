package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface CrewService {
	public abstract List<CrewVO> crew_list(Criteria cri, String mid) throws Exception;
	public abstract CrewVO crew_tab_list(int cno) throws Exception;

}
