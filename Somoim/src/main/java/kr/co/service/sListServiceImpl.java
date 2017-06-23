package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.sListVO;
import kr.co.persistence.sListDAO;

@Service
public class sListServiceImpl implements sListService {
	
	@Inject
	private sListDAO sList_dao;
	
	@Override
	public sListVO slist_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.slist_list(cno);
	}

	@Override
	public List<sListVO> slist_tab_list(int cno) throws Exception {
		// TODO Auto-generated method stub
		return sList_dao.slist_tab_list(cno);
	}

}
