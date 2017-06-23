package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;
import kr.co.persistence.SettingDAO;

@Service
public class SettingServiceImpl implements SettingService {

	@Inject
	SettingDAO setting_dao;
	
	@Override
	public MemberVO memberInfo(String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.memberInfo(mid);
	}

	@Override
	public List<CrewVO> openCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CrewVO> joinCrew(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.joinCrew(cri, mid);
	}

	@Override
	public List<JoinSlistVO> joinSlist(Criteria cri, String mid) throws Exception {
		// TODO Auto-generated method stub
		return setting_dao.joinSlist(cri, mid);
	}

}
