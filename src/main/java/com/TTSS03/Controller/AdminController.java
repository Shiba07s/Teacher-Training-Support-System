package com.TTSS03.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
 
	@RequestMapping("/")
	public String traineeSide() {
		return "/../../index";
	}
	
}
