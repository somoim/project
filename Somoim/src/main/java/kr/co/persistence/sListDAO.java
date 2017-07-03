package kr.co.persistence;

import java.util.List;

import kr.co.domain.StatusVO;
import kr.co.domain.sListVO;

public interface sListDAO {
	public abstract sListVO slist_list(int cno) throws Exception;
	public abstract List<sListVO> slist_tab_list(int cno) throws Exception;
	public abstract void update_s_join_cnt(int sl_no) throws Exception;
	public abstract void join_sList_insert(int cno,int sl_no,String mid)throws Exception;
	public abstract List<StatusVO> join_sList_select(int sl_no)throws Exception;
	public abstract List<StatusVO> join_sList_member(int cno)throws Exception;
	public abstract void slist_create(sListVO slistVo);
}
