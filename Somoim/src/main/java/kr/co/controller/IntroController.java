package kr.co.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/intro")
public class IntroController {
	
	@RequestMapping(value="/intro", method=RequestMethod.GET)
	public void intro() throws Exception{
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login() throws Exception{
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void join() throws Exception{
	}
	
}
