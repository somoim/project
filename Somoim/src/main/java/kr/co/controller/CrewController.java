package kr.co.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.ChattingVO;
import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.MemberVO;
import kr.co.domain.sBoardVO;
import kr.co.domain.sListVO;
import kr.co.domain.sGalleryVO;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;
import kr.co.service.MemberService;
import kr.co.service.sBoardService;
import kr.co.service.sListService;
import kr.co.service.sGalleryService;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@Resource(name="sgallery_uploadPath")
	private String sgallery_uploadPath;
	
	@Resource(name="sboard_uploadPath")
	private String sboard_uploadPath;
	
	@Resource(name="crew_uploadPath")
	private String crew_uploadPath;
	

	@Inject
	private CrewService crew_service;

	@Inject
	private ChattingService ch_service;
	
	@Inject
	private sListService sList_service;
	
	@Inject 
	private sGalleryService sgallery_service; 
	
	@Inject
	private MemberService member_service;
	
	@Inject
	private sBoardService sboard_service;
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.GET) 
	public void sgallery_create_GET(){ 
	} 
	
	@ResponseBody
	@RequestMapping(value="/sgallery_create", method=RequestMethod.POST) 
	public String sgallery_create_POST(sGalleryVO sgallery_vo, RedirectAttributes rttr) throws Exception{ 	
		
		sgallery_vo.setCno(1);
		sgallery_vo.setMid("m001");
		
		sgallery_service.sgallery_create(sgallery_vo); 
		
		rttr.addAttribute("cno", sgallery_vo.getCno());
	
		return "redirect:/crew/tab_gallery";
	} 
	
	/*---------------------------------------------------------------------------------------*/
	
	
	@ResponseBody
	@RequestMapping(value="/tab_gallery/{cno}")
	public List<sGalleryVO> sGallery(@PathVariable("cno") int cno, Model model) throws Exception{
		
		List<sGalleryVO> list = sgallery_service.sgallery_list(cno);
		model.addAttribute("list", list);
		
		return list;
	}
	
	@RequestMapping(value="/tab_gallery")
	public void tab_gallery_GET(Model model) throws Exception {
		List<sGalleryVO> list = sgallery_service.sgallery_list(1);
		model.addAttribute("list", list);
	}
	
	
	/*---------------------------------------------------------------------------------------*/
	
	
	@ResponseBody
	@RequestMapping(value="/sgallery_detail/{cno}/{sg_no}")
	public sGalleryVO sgallery_detail(@PathVariable("cno") int cno, @PathVariable("sg_no") int sg_no, Model model) throws Exception{
		
		sGalleryVO vo = sgallery_service.sgallery_detail(sg_no);
		model.addAttribute("vo", vo);
		
		return vo;
	}
	
	
	
	@RequestMapping(value="/sgallery_detail", method=RequestMethod.GET)
	public void sgallery_detail_GET(Model model) throws Exception {
		
		sGalleryVO vo = sgallery_service.sgallery_detail(92);
		model.addAttribute("vo", vo);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="/sgallery_delete", method=RequestMethod.POST)
	public String sgallery_delete(@RequestParam("sg_no") int sg_no, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception{
		sGalleryVO vo = sgallery_service.sgallery_detail(sg_no);
		sgallery_service.sgallery_delete(sg_no);

		String prefix = vo.getSg_picture().substring(0, 12);
		String suffix = vo.getSg_picture().substring(14);
		
		File f = new File(sgallery_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
		f.delete();
		File s = new File(sgallery_uploadPath+vo.getSg_picture().replace('/', File.separatorChar));
		s.delete();
		
		return "redirect:/crew/tab_gallery?cno="+cno;
	
	}

	/*--------------------------------------SBOARD------------------------------------*/
	
	
	@RequestMapping(value="/sboard_create", method=RequestMethod.GET) 
	public void sboard_create_GET(){ 
	} 
	
	@ResponseBody
	@RequestMapping(value="/sboard_create", method=RequestMethod.POST) 
	public String sboard_create_POST(sBoardVO sboard_vo, RedirectAttributes rttr) throws Exception{ 	
		
		sboard_vo.setCno(1);
		sboard_vo.setMid("m001");	
		
		sboard_service.sboard_create(sboard_vo); 
		
		rttr.addAttribute("cno", sboard_vo.getCno());
	
		return "redirect:/crew/tab_board";
	} 
	
	
	/*---------------------------------------------------------------------------------------*/
	
	
	
	@ResponseBody
	@RequestMapping(value="/tab_board/{cno}")
	public List<sBoardVO> sBoard(@PathVariable("cno") int cno, Model model) throws Exception{
		
		List<sBoardVO> list = sboard_service.sboard_list(cno);
		model.addAttribute("list", list);
		
		return list;
	}
	
	@RequestMapping(value="/tab_board")
	public void tab_board_GET(Model model) throws Exception {
		List<sBoardVO> list = sboard_service.sboard_list(1);
		model.addAttribute("list", list);
	}
	
	
	/*---------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="/sboard_detail/{cno}/{sb_no}")
	public sBoardVO sboard_detail(@PathVariable("cno") int cno, @PathVariable("sb_no") int sb_no, Model model) throws Exception{
		
		sBoardVO vo = sboard_service.sboard_detail(sb_no);
		model.addAttribute("vo", vo);
		
		return vo;
	}
	
	
	
	@RequestMapping(value="/sboard_detail", method=RequestMethod.GET)
	public void sboard_detail_GET(Model model) throws Exception {
		
		sBoardVO vo = sboard_service.sboard_detail(16);
		model.addAttribute("vo", vo);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="/sboard_delete", method=RequestMethod.POST)
	public String sboard_delete(@RequestParam("sb_no") int sb_no, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception{
		sBoardVO vo = sboard_service.sboard_detail(sb_no);
		sboard_service.sboard_delete(sb_no);

		String prefix = vo.getSb_picture().substring(0, 12);
		String suffix = vo.getSb_picture().substring(14);
		
		File f = new File(sboard_uploadPath+(prefix+suffix).replace('/', File.separatorChar));
		f.delete();
		File s = new File(sboard_uploadPath+vo.getSb_picture().replace('/', File.separatorChar));
		s.delete();
		
		return "redirect:/crew/tab_board?cno="+cno;
	
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="sboard_update", method=RequestMethod.GET)
	public void sboard_update_GET(@RequestParam("sb_no") int sb_no, Model model) throws Exception{
		sBoardVO vo = sboard_service.sboard_detail(sb_no);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value="sboard_update", method=RequestMethod.POST)
	public String sboard_update_POST(sBoardVO sboard_vo, RedirectAttributes rttr) throws Exception{
		sboard_service.sboard_update(sboard_vo);
		
		rttr.addFlashAttribute("msg", "UPDATE");
		
		rttr.addAttribute("cno", sboard_vo.getCno());
		rttr.addAttribute("sb_no", sboard_vo.getSb_no());
	
		return "redirect:/crew/sboard_detail";
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@ResponseBody
	@RequestMapping(value="sboard_datail_picture/{sb_no}")
	public String sboard_detail_picture(@PathVariable("sb_no") int sb_no) throws Exception{
		String sg_pictue = sboard_service.sboard_detail_picture(sb_no);
		return sg_pictue;
	}
	
	
	/*---------------------------------------------------------------------------------------*/
	
	
	
	@RequestMapping(value="/list_create", method=RequestMethod.GET) 
	public void list_create() throws Exception{ 
	} 
	
	@RequestMapping(value="/list") 
	public void crew_list() throws Exception { 
	
		
	} 
	
	///////////////////////// 정림
	
	///////////////////////// 명재
	@RequestMapping(value="/tab_chat")
	public void sChat_GET(Model model) throws Exception {
		List<ChattingVO> list = ch_service.msg_list(1);
		model.addAttribute("list", list);
	}
	@ResponseBody
	@RequestMapping(value="/tab_chat/{cno}")
	public List<ChattingVO> send_Chat(@PathVariable("cno")int cno ,Model model) throws Exception {
		List<ChattingVO> list = ch_service.msg_list(cno);
		model.addAttribute("list", list);
		return list;
	}
	
	@RequestMapping(value="/tab_chat", method=RequestMethod.POST)
	public String sChat_POST(ChattingVO chat_vo) throws Exception {
		ch_service.insert_msg(chat_vo);
		
		return "redirect:/crew/tab_chat";
	} 
	
	@RequestMapping(value="/tab_list") 
	public void slist(Model model) throws Exception {
		int cno =1;
		CrewVO crewVO=crew_service.crew_tab_list(cno);
		List<sListVO> sList_list=sList_service.slist_tab_list(cno);
		List<MemberVO> member_list=member_service.member_tab_list(cno);
		int i = 0;
		for(sListVO list: sList_list){
			String str1=list.getAttend_date().substring(0, 4)+"년";
			String str2=list.getAttend_date().substring(4, 6)+"월";
			String str3=list.getAttend_date().substring(6, 8)+"일";
			String str4=list.getAttend_date().substring(8, 10)+":";
			String str5=list.getAttend_date().substring(10);
			String str = str1+str2+str3+str4+str5;
			list.setAttend_date(str);
			i++;
		}	// 정모 날자 잘라서 년월일 : 붙여주는 코드

		model.addAttribute("crewVO", crewVO);
		model.addAttribute("sList_list", sList_list);
		model.addAttribute("member_list", member_list);
	}
	
	@ResponseBody
	@RequestMapping(value="/update_Role/{cno}")	//소모임의 운영자 권한 주기
	public void update_MemberPower(@PathVariable("cno")int cno,String mid)throws Exception{
		crew_service.crew_update_role(cno, mid);
	}
	@ResponseBody
	@RequestMapping(value="/update_s_join_cnt") //정모 참석 누르기
	public void update_MemberPower(int sl_no)throws Exception{
		sList_service.update_s_join_cnt(sl_no);
	}
	
	
	///////////////////////// 진희
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model, String mid, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		mid = memberVO.getMid();

		List<CrewVO> list = crew_service.crew_list(cri, mid);
		model.addAttribute("list", list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/list_sList/{cno}")
	public sListVO crew_sList(@PathVariable("cno")int cno, Model model)throws Exception{
		sListVO sList_vo=sList_service.slist_list(cno);
		
		String attend_date = sList_vo.getAttend_date();
		
		String year = attend_date.substring(0, 4);
		String month = attend_date.substring(4, 6);
		String day = attend_date.substring(6, 8);
		String hour = attend_date.substring(8, 10);
		String minute = attend_date.substring(10, 12);
		
		attend_date = year + "/" + month + "/" + day + " " + hour + "시" + minute + "분";
		sList_vo.setAttend_date(attend_date);

		return sList_vo;
	}
	
	// 현근
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public void crew_createGet() throws Exception {
		
		
	}
	
	@RequestMapping(value="/create_post", method=RequestMethod.POST)
	public void crew_createPost(CrewVO crew_vo) throws Exception {
		crew_service.crew_create(crew_vo);
		
	}
	
	
}
