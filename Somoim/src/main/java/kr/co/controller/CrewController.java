package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.ChattingVO;
import kr.co.persistence.ChattingDAO;



@Controller
@RequestMapping("/crew")
public class CrewController {
	@Inject
	private ChattingDAO dao;
	
	
	@RequestMapping(value="/list_create", method=RequestMethod.GET)
	public void list_create() throws Exception{
	}
	
	@RequestMapping(value="/list")
	public void list() throws Exception {
		
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
	public void sChat(Model model) throws Exception {
		List<ChattingVO> list=dao.msg_list(1);
		model.addAttribute("list", list);
	}
	
}
