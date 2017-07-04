package kr.co.service;

import kr.co.domain.MemberVO;

public interface AroundService {
	public abstract MemberVO memberInfo(String mid) throws Exception;
}
