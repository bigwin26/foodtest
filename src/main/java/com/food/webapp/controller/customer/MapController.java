package com.food.webapp.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer/*")
public class MapController {

	@RequestMapping("map")
	public String map() {

		return "customer.map.list";
	}
	
	@RequestMapping("map/{id}")
	public String detail() {

		return "customer.map.detail";
	}
	
	@RequestMapping("map/reg")
	public String reg() {

		return "customer.map.reg";
	}
	
	@RequestMapping(value="map/edit/{id}", method=RequestMethod.GET)
	public String edit() {

		return "customer.map.edit";
	}
	
   @RequestMapping(value="map/edit/{id}", method=RequestMethod.POST)
   public String edit(@PathVariable("id") String id, String title, String content) {
      
      return "redirect:../{id}";
   }
}