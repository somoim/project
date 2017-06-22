package kr.co.service;

import kr.co.domain.MemberVO;

public interface MemberService {
	public abstract void member_join(MemberVO member_vo) throws Exception;
	public abstract MemberVO member_login(MemberVO member_vo) throws Exception;
	public abstract MemberVO member_select(MemberVO member_vo) throws Exception;
}
