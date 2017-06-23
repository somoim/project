package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.sListVO;
import kr.co.service.MyService;
import kr.co.service.sListService;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Inject
	private MyService my_service;
	
	@Inject
	private sListService sList_service;
	
	@RequestMapping(value="/mylist", method=RequestMethod.GET)
	public void mylist(@ModelAttribute("cri") Criteria cri, Model model, String mid) throws Exception {
		// 세션에서 로그인정보 mid 넘겨주세요
		mid="user10";
		
		List<CrewVO> sel_list = my_service.crew_sel_list(cri, mid);
		model.addAttribute("sel_list", sel_list);
		
		List<CrewVO> attend_list = my_service.attend_crew_list(mid);
		model.addAttribute("attend_list", attend_list);
	}
	
	@ResponseBody
	@RequestMapping(value="/list_sList/{cno}")
	public sListVO my_sList(@PathVariable("cno")int cno, Model model)throws Exception{
		sListVO sList_vo=sList_service.slist_list(cno);

		String attend_date = sList_vo.getAttend_date();
		
		String year = attend_date.substring(0, 4);
		String month = attend_date.substring(4, 6);
		String day = attend_date.substring(6, 8);
		String hour = attend_date.substring(8, 10);
		String minute = attend_date.substring(10, 12);
		
		attend_date = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
		sList_vo.setAttend_date(attend_date);

		return sList_vo;
	}
}
