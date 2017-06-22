package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.service.MyService;

@Controller
@RequestMapping("/my")
public class MyController {
	
	@Inject
	private MyService my_service;
	
	@RequestMapping(value="/mylist", method=RequestMethod.GET)
	public void mylist(@ModelAttribute("cri") Criteria cri, Model model, String mid) throws Exception {
		// 세션에서 로그인정보 mid 넘겨주세요
		mid="user10";
		
		List<CrewVO> sel_list = my_service.crew_sel_list(cri, mid);
		model.addAttribute("sel_list", sel_list);
		
		List<CrewVO> join_list = my_service.attend_crew_list(mid);
		model.addAttribute("join_list", join_list);
	}
}
