package kr.co.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.domain.VisitorVO;
import kr.co.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Inject
	private AdminService admin_service;
	
	@RequestMapping(value="/manager", method=RequestMethod.GET)
	public void manager(@ModelAttribute("cri") Criteria cri, Model model, String mid, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();
		
		MemberVO memberVo = getMemberInfo(mid);
		model.addAttribute("memberVo", memberVo);
		
		int memberCnt = admin_service.memberCnt();
		model.addAttribute("memberCnt", memberCnt);
		
		int crewCnt = admin_service.crewCnt();
		model.addAttribute("crewCnt", crewCnt);
		
		List<CrewVO> crewList = admin_service.crewMemberCnt();
		model.addAttribute("crewList", crewList);
		
		int visitorCnt = admin_service.visitorCnt();
		model.addAttribute("visitorCnt", visitorCnt);
		
		List<VisitorVO> visitorList = admin_service.visitorList();
		model.addAttribute("visitorList", visitorList);
	}
	
	private MemberVO getMemberInfo(String mid) throws Exception {
		MemberVO memberVo = admin_service.memberInfo(mid);
		
		String birth = memberVo.getBirth();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6, 8);
		
		birth = year + "." + month + "." + day;
		memberVo.setBirth(birth);
		
		return memberVo;
	}
}
