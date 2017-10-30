package com.food.webapp.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/customer/*")
public class RestaurantController {

	@RequestMapping("restaurant")
	public String restaurant() {

		return "customer.restaurant.list";
	}
	
	@RequestMapping("restaurant/{id}")
	public String detail() {

		return "customer.restaurant.detail";
	}
	
	@RequestMapping("restaurant/reg")
	public String reg() {

		return "customer.restaurant.reg";
	}
	
	@RequestMapping(value="restaurant/edit/{id}", method=RequestMethod.GET)
	public String edit() {

		return "customer.restaurant.edit";
	}
	
   @RequestMapping(value="restaurant/edit/{id}", method=RequestMethod.POST)
   public String edit(@PathVariable("id") String id, String title, String content) {
      
      return "redirect:../{id}";
   }
}