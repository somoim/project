package kr.co.service;

import java.util.List;

import kr.co.domain.StatusVO;
import kr.co.domain.sListVO;

public interface sListService {
	sListVO slist_list(int cno) throws Exception;
	List<sListVO> slist_tab_list(int cno) throws Exception;
	void update_s_join_cnt(int sl_no) throws Exception;
	void join_sList_insert(int cno,int sl_no,String mid)throws Exception;
	List<StatusVO> join_sList_select(int sl_no)throws Exception;

}
