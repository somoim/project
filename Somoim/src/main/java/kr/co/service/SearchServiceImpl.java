package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.persistence.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	SearchDAO search_dao;
	
	@Override
	public List<CrewVO> searchCategory(Criteria cri, String category) throws Exception {
		// TODO Auto-generated method stub
		return search_dao.searchCategory(cri, category);
	}

}
