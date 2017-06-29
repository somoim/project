package kr.co.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService reply_service;
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> create(ReplyVO reply_vo) throws Exception{
		
		ResponseEntity<String> entity=null;
		
		reply_vo.setMid("m001");
		reply_vo.setSg_no(1);
		
		reply_service.reply_create_sgallery(reply_vo);
		
		entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		
		return entity;
		
	}	
	
	
	@RequestMapping(value="/{cno}/{sg_no}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> reply_list_sgallery(@PathVariable("sg_no") Integer sg_no, @PathVariable("cno") Integer cno) throws Exception{
		
		ResponseEntity<List<ReplyVO>> entity=null;
		
		List<ReplyVO> list = reply_service.reply_list_sgallery(sg_no);
		
		entity = new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
		
		System.out.println("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
		System.out.println(entity);
		
		return entity;
	}
	



	
}
	
	

