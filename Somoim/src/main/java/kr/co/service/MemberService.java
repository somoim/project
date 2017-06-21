package kr.co.service;

import kr.co.domain.MemberVO;

public interface MemberService {
	public abstract void member_join(MemberVO member_vo) throws Exception;
}
