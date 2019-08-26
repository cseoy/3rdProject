package com.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SampleController {
	
	@RequestMapping(value="/")
	public ModelAndView sampleView(ModelAndView mv) throws Exception{
		mv.setViewName("sample");
		
		return mv;
	}

}
