package kr.co.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.ChattingVO;
import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.sListVO;
import kr.co.domain.sGalleryVO;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;
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
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.POST) 
	public void sgallery_create_post(sGalleryVO sgallery_vo) throws Exception{ 	
		
		sgallery_vo.setCno(1);
		sgallery_vo.setMid("aaa");
		
		sgallery_service.sgallery_create(sgallery_vo); 
	} 
	
	@RequestMapping(value="/sgallery_create", method=RequestMethod.GET) 
	public void sgallery_create(){ 
	} 
	
	
	@ResponseBody
	@RequestMapping(value="sgallery_list/{cno}")
	public List<sGalleryVO> sgallery_list(@PathVariable("cno") int cno) throws Exception{
	//@PathVariable("bno") int bno : path에 있는 bno를 가지고 와서 int bno에 넣어줌
		System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println("controller"+cno);
		return sgallery_service.sgallery_list(cno);
	}
	
	
	@RequestMapping(value="/list_create", method=RequestMethod.GET) 
	public void list_create() throws Exception{ 
	} 
	
	@RequestMapping(value="/list") 
	public void crew_list() throws Exception { 
	
	} 
	
	@RequestMapping(value="/tab_list") 
	public void slist() throws Exception { 
	
	} 
	
	@RequestMapping(value="/tab_board") 
	public void sBoard() throws Exception { 
	
	} 
	
	@RequestMapping(value="/tab_gallery") 
	public void sGallery() throws Exception { 
	
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
	
	///////////////////////// 진희
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model, String mid) throws Exception {
		// 로그인 한 mid 넘겨주세요
		mid = "user10";
		List<CrewVO> list = crew_service.crew_list(cri, mid);
		model.addAttribute("list", list);
		List<sListVO> sList= new ArrayList<>();
		for(int i=0;i<list.size();i++){
			int cno = list.get(i).getCno();
			sListVO vo= sList_service.slist_list(cno);
			sList.add(vo);
		}
		model.addAttribute("sList", sList);
	}
	
	@ResponseBody
	@RequestMapping(value="/list_sList/{cno}")
	public sListVO crew_sList(@PathVariable("cno")int cno, Model model)throws Exception{
		sListVO sList_vo=sList_service.slist_list(cno);
		return sList_vo;
		
	}
	
}
