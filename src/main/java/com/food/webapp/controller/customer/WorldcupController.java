package com.food.webapp.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer/*")
public class WorldcupController {

	@RequestMapping("worldcup")
	public String lunch() {

		return "customer.worldcup.list";
	}
	
}