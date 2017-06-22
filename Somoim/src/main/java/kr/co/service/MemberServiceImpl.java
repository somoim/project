package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAO dao;
	
	@Override
	public void member_join(MemberVO member_vo) throws Exception {
		
		dao.member_join(member_vo);
	}
	
	@Override
	public MemberVO member_login(MemberVO member_vo) throws Exception {
		return dao.member_login(member_vo);
	}
	

}
