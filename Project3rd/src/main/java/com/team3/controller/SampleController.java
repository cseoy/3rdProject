package com.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class SampleController {

	@RequestMapping(value="/about")
	public String about(Model model) throws Exception {
		
		return "include/about";
	}
	
	@RequestMapping(value="/contact")
	public String contact(Model model) throws Exception {
		
		return "include/contact";
	}
}
