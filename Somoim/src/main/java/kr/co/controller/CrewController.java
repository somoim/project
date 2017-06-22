package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
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
import org.springframework.web.multipart.MultipartFile;

import kr.co.domain.ChattingVO;
import kr.co.domain.CrewVO;
import kr.co.domain.Criteria;
import kr.co.domain.sGalleryVO;
import kr.co.service.ChattingService;
import kr.co.service.CrewService;
import kr.co.service.sGalleryService;
import kr.co.util.MediaUtils;
import kr.co.util.UploadFileUtils;

	@Controller
	@RequestMapping("/crew")
	public class CrewController {
	
		
	@Inject
	private CrewService crew_service;
	
	@Resource(name="uploadPath") 
	private String uploadPath; 
	
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
	
	@RequestMapping(value="/tab_chat") 
	public void sChat() throws Exception { 
	
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
	
	
	
	///////////////////////// 진희
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void crew_list(@ModelAttribute("cri") Criteria cri, Model model, String mid) throws Exception {
		// 로그인 한 mid 넘겨주세요
		mid = "user10";
		
		List<CrewVO> list = crew_service.crew_list(cri, mid);
		model.addAttribute("list", list);
	}
	
}
