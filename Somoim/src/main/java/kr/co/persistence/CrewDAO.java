package kr.co.persistence;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface CrewDAO {
	public abstract List<CrewVO> crew_list(Criteria cri) throws Exception;
	
}

