package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/intro")
public class IntroController {
	
	@Inject
	private MemberService service;
	
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public void intro() throws Exception{
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() throws Exception{
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void member_joinGet() throws Exception{
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public void member_joinPost(MemberVO member_vo) throws Exception{
		service.member_join(member_vo);
	}
	

}
