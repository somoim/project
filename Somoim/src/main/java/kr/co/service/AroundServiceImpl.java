package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.MemberVO;
import kr.co.persistence.AroundDAO;

@Service
public class AroundServiceImpl implements AroundService {
	
	@Inject
	AroundDAO around_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return around_dao.memberInfo(mid);
	}

}
