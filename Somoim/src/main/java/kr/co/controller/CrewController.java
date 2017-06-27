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
import kr.co.domain.sListVO;
import kr.co.domain.sGalleryVO;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;
import kr.co.service.MemberService;
import kr.co.service.sListService;
import kr.co.service.sGalleryService;
import kr.co.util.MediaUtils;

@Controller
@RequestMapping("/crew")
public class CrewController {
	
	@Resource(name="uploadPath") 
	private String uploadPath; 

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
	
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.GET) 
	public void sgallery_create_GET(){ 
	} 
	
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
	public sGalleryVO read(@PathVariable("cno") int cno, @PathVariable("sg_no") int sg_no, Model model) throws Exception{
		
		sGalleryVO vo = sgallery_service.sgallery_detail(sg_no);
		model.addAttribute("vo", vo);
		
		return vo;
	}
	
	
	
	@RequestMapping(value="/sgallery_detail", method=RequestMethod.GET)
	public void sgallery_detail_GET(Model model) throws Exception {
		
		sGalleryVO vo = sgallery_service.sgallery_detail(85);
		model.addAttribute("vo", vo);
	}
	
	/*---------------------------------------------------------------------------------------*/
	
	@RequestMapping(value="/sgallery_delete", method=RequestMethod.POST)
	public String delete(@RequestParam("sg_no") int sg_no, @RequestParam("cno") int cno, RedirectAttributes rttr) throws Exception{
		sGalleryVO vo = sgallery_service.sgallery_detail(sg_no);
		sgallery_service.sgallery_delete(sg_no);

		String prefix = vo.getSg_picture().substring(0, 12);
		String suffix = vo.getSg_picture().substring(14);
		
		File f = new File(uploadPath+(prefix+suffix).replace('/', File.separatorChar));
		f.delete();
		File s = new File(uploadPath+vo.getSg_picture().replace('/', File.separatorChar));
		s.delete();
		
		return "redirect:/crew/tab_gallery?cno="+cno;
		
	}

	/*---------------------------------------------------------------------------------------*/

	@RequestMapping(value="/list_create", method=RequestMethod.GET) 
	public void list_create() throws Exception{ 
	} 
	
	@RequestMapping(value="/list") 
	public void crew_list() throws Exception { 
	
	} 
	
	@RequestMapping(value="/tab_board") 
	public void sBoard() throws Exception { 
	
	} 
	
	@ResponseBody
	@RequestMapping(value="/deleteFile", method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		if(mType != null){	// 이미지 파일이면
			
			String prefix = fileName.substring(0, 12);
			String suffix = fileName.substring(14);
			
			File f = new File(uploadPath+(prefix+suffix).replace('/', File.separatorChar));
			// '/'를 '\'로 바꾸는 작업
			f.delete();
		}
		File s = new File(uploadPath+fileName.replace('/', File.separatorChar));
		// 이미지 파일이 아닌 파일들 삭제
		s.delete();
		
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
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
		model.addAttribute("crewVO", crewVO);
		model.addAttribute("sList_list", sList_list);
		model.addAttribute("member_list", member_list);
	}
	
	@ResponseBody
	@RequestMapping(value="/update_Role/{cno}")
	public void update_MemberPower(@PathVariable("cno")int cno,String mid)throws Exception{
		crew_service.crew_update_role(cno, mid);
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
	
}
