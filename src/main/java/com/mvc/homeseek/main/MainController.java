package com.mvc.homeseek.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("main.do")
	public String Main() {
		return "index";
	}

}
