package kr.co.controller;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;



@Controller
@RequestMapping("/crew")
public class CrewController {
	/*
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		System.out.println("originalFilename: "+file.getOriginalFilename());
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
	
		String uploadedFileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		return new ResponseEntity<String>(uploadedFileName, HttpStatus.CREATED);
	}
		
	@RequestMapping(value="/uploadAjax", method=RequestMethod.GET)
	public void uploadAjax(){
	}*/
 	

	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping(value="/gallery_create", method=RequestMethod.POST)
	public String gallery_create_post(MultipartFile file, Model model) throws Exception{
		
		String originalFileName	= new String(file.getOriginalFilename().getBytes("8859_1"),"UTF-8");
		
		System.out.println("+++++++++++++++++++++++++++++");
		System.out.println("originalFilename: "+originalFileName);
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("+++++++++++++++++++++++++++++");
	
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+originalFileName;
		
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(file.getBytes(), target);
		model.addAttribute("savedName", savedName);
		
		return "tab_gallery";
	}

	@RequestMapping(value="/gallery_create", method=RequestMethod.GET)
	public void gallery_create(){
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
	
	/*������ ����Ʈ(���� ����� �������� ������*/
	@RequestMapping(value="/tab_gallery")
	public void sGallery() throws Exception {
		
	}
	
	@RequestMapping(value="/tab_chat")
	public void sChat() throws Exception {
		
	}
	
}
