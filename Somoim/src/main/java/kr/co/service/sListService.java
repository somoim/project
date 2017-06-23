package kr.co.service;

import java.util.List;

import kr.co.domain.sListVO;

public interface sListService {
	sListVO slist_list(int cno) throws Exception;
	List<sListVO> slist_tab_list(int cno) throws Exception;

}
