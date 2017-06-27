package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Inject
	private SearchService search_service;
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public void search(@ModelAttribute("cri") Criteria cri) throws Exception {
		
		System.out.println("searchCategory... path:search/search.jsp");
	}
	
//	@ResponseBody
	@RequestMapping(value="/searchCrew")
	public void searchCrew(@ModelAttribute("cri") Criteria cri, Model model, @RequestParam("category") String category) throws Exception{
		System.out.println("################################");
		System.out.println("category :: " + category);
		System.out.println("################################");
		List<CrewVO> searchCrewList = search_service.searchCategory(cri, category);
		model.addAttribute("searchCrewList", searchCrewList);
	}
	
}
