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
import kr.co.service.CrewService;



@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@Inject
	private CrewService service;
	
	@RequestMapping(value="/gallery_create", method=RequestMethod.GET)
	public void gallery_create() throws Exception{
	}
	
	
	@RequestMapping(value="/list_create", method=RequestMethod.GET)
	public void list_create() throws Exception{
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		List<CrewVO> list = service.crew_list(cri);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/tab_list")
	public void slist() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_board")
	public void sBoard() throws Exception {
		
	}
	
	/*������ ����Ʈ(���� ����� �������� ������*/
	@RequestMapping(value="/tab_gallery")
	public void sGallery() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_chat")
	public void sChat() throws Exception {
		
	}
	
}
