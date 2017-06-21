package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/join_post", method=RequestMethod.POST)
	public String member_joinPost(MemberVO member_vo, @RequestParam("birth1") String birth1, @RequestParam("birth2") String birth2, @RequestParam("birth3") String birth3,
			@RequestParam("phone1") String phone1, @RequestParam("phone2") String phone2, @RequestParam("phone3") String phone3) throws Exception{
		member_vo.setBirth(birth1+birth2+birth3);
		member_vo.setPhone(phone1+phone2+phone3);
		service.member_join(member_vo);
		System.out.println("===================================================================");
		System.out.println(member_vo);
		System.out.println("가입되었습니다");
		System.out.println("===================================================================");
		return "redirect:/crew/list";
	}
	

}
