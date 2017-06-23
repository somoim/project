package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.persistence.CrewDAO;

@Service
public class CrewServiceImpl implements CrewService {

	@Inject
	CrewDAO crew_dao;
	
	@Override
	public List<CrewVO> crew_list(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return crew_dao.crew_list(cri, mid);
	}

	@Override
	public CrewVO crew_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return crew_dao.crew_tab_list(cno);
	}

}
