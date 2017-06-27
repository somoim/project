package kr.co.service;

import java.util.List;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;

public interface SearchService {
	public abstract List<CrewVO> searchCategory(Criteria cri, String category) throws Exception;

}
