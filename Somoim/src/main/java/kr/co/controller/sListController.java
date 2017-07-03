package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.sListVO;
import kr.co.service.sListService;

@Controller
@RequestMapping("/sList")
public class sListController {
	
	@Inject
	private sListService sList_service;
	
	@RequestMapping(value="/slist_create", method=RequestMethod.GET)
	public void slist_createGet(@RequestParam("cno") int cno, Model model) throws Exception {
		model.addAttribute("cno", cno);
	}
	
	@RequestMapping(value="/slist_create", method=RequestMethod.POST)
	public String slist_createPost(sListVO slistVo, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception {
		sList_service.slist_create(slistVo);
		return "redirect:/crew/tab_list?cno="+cno;
	}
	
}
