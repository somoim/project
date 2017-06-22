package kr.co.persistence;

import kr.co.domain.sListVO;

public interface sListDAO {
	public abstract sListVO slist_list(int cno) throws Exception;
}
