package com.food.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class HomeController {

	@RequestMapping("index")
	public String index() {

		return "home.index";
	}
	
	@RequestMapping("echo")
	public String echo() {

		return "home.echo";
	}
	@RequestMapping("chat")
	public String chat() {

		return "home.chat";
	}
	@RequestMapping("policyservice")
	public String policyservice() {

		return "policy.policyservice";
	}
	@RequestMapping("policyprivacy")
	public String policyprivacy() {

		return "policy.policyprivacy";
	}
	
}