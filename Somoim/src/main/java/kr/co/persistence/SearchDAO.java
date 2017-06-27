package kr.co.persistence;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;

public interface SearchDAO {
	public abstract List<CrewVO> searchCategory(Criteria cri, String category) throws Exception;

}