package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@RequestMapping(value="/info", method=RequestMethod.GET)
	public void info() throws Exception{
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public void mypage() throws Exception{
	}
	
}
