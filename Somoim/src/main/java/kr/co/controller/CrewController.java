package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.ChattingVO;
import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;



@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@Inject
	private CrewService crew_service;
	
	@Inject
	private ChattingService ch_service;
	
	@RequestMapping(value="/list_create", method=RequestMethod.GET)
	public void list_create() throws Exception{
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		List<CrewVO> list = crew_service.crew_list(cri);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/tab_list")
	public void slist() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_board")
	public void sBoard() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_gallery")
	public void sGallery() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_chat", method=RequestMethod.GET)
	public void sChat_GET(Model model) throws Exception {
		
		if(ch_service.msg_list(1)==null){return ;}
		List<ChattingVO> list = ch_service.msg_list(1);
		model.addAttribute("list", list);
	}
	@RequestMapping(value="/tab_chat", method=RequestMethod.POST)
	public String sChat_POST(ChattingVO vo, Model model) throws Exception {
		ch_service.insert_msg(vo);
		
		return "redirect:/crew/tab_chat";
	}
	
}
