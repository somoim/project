package kr.co.persistence;

import java.util.List;

import kr.co.domain.sListVO;

public interface sListDAO {
	public abstract sListVO slist_list(int cno) throws Exception;
	public abstract List<sListVO> slist_tab_list(int cno) throws Exception;
	public abstract void update_s_join_cnt(int sl_no) throws Exception;
}
