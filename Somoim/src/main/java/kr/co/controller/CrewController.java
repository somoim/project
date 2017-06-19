package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/crew")
public class CrewController {
	
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
	
	@RequestMapping(value="/tab_chat")
	public void sChat() throws Exception {
		
	}
	
}
