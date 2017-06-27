package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CrewVO;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;
import kr.co.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO admin_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.memberInfo(mid);
	}

	@Override
	public int memberCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.memberCnt();
	}

	@Override
	public int crewCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.crewCnt();
	}

	@Override
	public List<CrewVO> crewMemberCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.crewMemberCnt();
	}

	@Override
	public int visitorCnt() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.visitorCnt();
	}

	@Override
	public List<VisitorVO> visitorList() throws Exception {
		// TODO Auto-generated method stub
		return admin_dao.visitorList();
	}

}
