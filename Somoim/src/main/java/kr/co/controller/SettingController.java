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
import kr.co.domain.JoinSlistVO;
import kr.co.domain.MemberVO;
import kr.co.domain.sListVO;
import kr.co.service.SettingService;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@Inject
	private SettingService setting_service;
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public void info(@ModelAttribute("cri") Criteria cri, Model model, String mid) throws Exception {
		// mid 주세요~
		mid = "user03";
		
		MemberVO memberVo = getMemberInfo(mid);
		model.addAttribute("memberVo", memberVo);
		
		List<CrewVO> openCrewList = getOpenCrew(cri, mid);
		model.addAttribute("openCrewList", openCrewList);
		
		List<CrewVO> joinCrewList = getJoinCrew(cri, mid);
		model.addAttribute("joinCrewList", joinCrewList);
		
		List<JoinSlistVO> joinSlist = getJoinSlist(cri, mid);
		model.addAttribute("joinSlist", joinSlist);
	}
	
	private MemberVO getMemberInfo(String mid) throws Exception {
		MemberVO memberVo = setting_service.memberInfo(mid);
		
		String birth = memberVo.getBirth();
		String year = birth.substring(0, 4);
		String month = birth.substring(4, 6);
		String day = birth.substring(6, 8);
		
		birth = year + "." + month + "." + day;
		memberVo.setBirth(birth);
		
		return memberVo;
	}
	
	private List<CrewVO> getOpenCrew(Criteria cri, String mid) throws Exception {
		List<CrewVO> openCrewList = setting_service.openCrew(cri, mid);
		return openCrewList;
	}

	private List<CrewVO> getJoinCrew(Criteria cri, String mid) throws Exception {
		List<CrewVO> joinCrewList = setting_service.joinCrew(cri, mid);
		return joinCrewList;
	}
	
	private List<JoinSlistVO> getJoinSlist(Criteria cri, String mid) throws Exception {
		List<JoinSlistVO> joinSlist = setting_service.joinSlist(cri, mid);
		
//		String attend_date = joinSlist.getAttend_date();
//		
//		String year = attend_date.substring(0, 4);
//		String month = attend_date.substring(4, 6);
//		String day = attend_date.substring(6, 8);
//		String hour = attend_date.substring(8, 10);
//		String minute = attend_date.substring(10, 12);
//		
//		attend_date = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
//		sList_vo.setAttend_date(attend_date);
		
		return joinSlist;
	}
	
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage() throws Exception{
	}
	
}
