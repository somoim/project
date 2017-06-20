package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@RequestMapping(value="/gallery_list", method=RequestMethod.GET)
	public void gallery_list() throws Exception{
	}
	
	@RequestMapping(value="/gallery_create", method=RequestMethod.GET)
	public void gallery_create() throws Exception{
	}
	
	
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
	
	@RequestMapping(value="/tab_chat")
	public void sChat() throws Exception {
		
	}
	
}
