package kr.co.controller;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MemberVO;
import kr.co.service.AroundService;

@Controller
@RequestMapping("/around")
public class AroundController {
	
	@Inject
	private AroundService around_service;

	@RequestMapping(value="/member_info", method=RequestMethod.GET)
	public void member_info(String mid, HttpServletRequest request, Model model) throws Exception{
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();
		
		MemberVO memberVo = getMemberInfo(mid);
		model.addAttribute("memberVo", memberVo);
	}
	
	private MemberVO getMemberInfo(String mid) throws Exception {
		MemberVO memberVo = around_service.memberInfo(mid);
		
		String birth = memberVo.getBirth();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6, 8);
		
		birth = year + "." + month + "." + day;
		memberVo.setBirth(birth);
		
		return memberVo;
	}
}
