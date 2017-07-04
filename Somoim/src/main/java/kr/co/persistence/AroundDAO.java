package kr.co.persistence;

import kr.co.domain.MemberVO;

public interface AroundDAO {
	public abstract MemberVO memberInfo(String mid) throws Exception;
}
