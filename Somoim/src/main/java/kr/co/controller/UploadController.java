package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.util.MediaUtils;
import kr.co.util.UploadFileUtils;

@Controller
public class UploadController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
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
	
	@ResponseBody
	@RequestMapping(value="/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath+fileName);
			
			if(mType != null){	//이미지 파일이면,	
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename = \""+ new String (fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");
			}
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),headers,HttpStatus.CREATED);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally{
			if(in != null) in.close();
		}
		return entity;
	}
	
	
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
	}
 	
 	
/*	@RequestMapping(value="/uploadForm", method=RequestMethod.POST)
	public String uploadFormPost(MultipartFile file, Model model) throws Exception{
		System.out.println("+++++++++++++++++++++++++++++");
		System.out.println("originalFilename: "+file.getOriginalFilename());
		//파일 이름이 같을 경우 그냥 덮어씌워버림
		System.out.println("size: "+file.getSize());
		System.out.println("contentType: "+file.getContentType());
		System.out.println("+++++++++++++++++++++++++++++");
	
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString()+"_"+file.getOriginalFilename();
		
		File target = new File(uploadPath, savedName);
		//파일 객체 생성 - 완벽하게 unique하지는 않지만 비슷하게 나옴
		FileCopyUtils.copy(file.getBytes(), target);
		model.addAttribute("savedName", savedName);
		
		return "uploadResult";
	}*/
	
	
	
	
}
