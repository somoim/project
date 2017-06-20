package kr.co.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/around")
public class AroundController {

	@RequestMapping(value="/member_info", method=RequestMethod.GET)
	public void member_info() throws Exception{
	}
}
