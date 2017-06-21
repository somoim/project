package kr.co.persistence;

import kr.co.domain.MemberVO;

public interface MemberDAO {
	
	public abstract void member_join(MemberVO member_vo) throws Exception;
	
}
