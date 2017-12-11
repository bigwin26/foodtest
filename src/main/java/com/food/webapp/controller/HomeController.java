package com.food.webapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.webapp.dao.AutoCompleteDao;
import com.food.webapp.dao.RestaurantDao;

@Controller
@RequestMapping("/*")
public class HomeController {
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	AutoCompleteDao autoComplateDao;
	
	
	@RequestMapping(value="autocom", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, String>> autocom(String term) {
		System.out.println(term);
		List<Map<String, String>> result = autoComplateDao.autoComplete(term);
		
	System.out.println(result);

	
		
		return result;
		
	}
	
	
	
	
	@RequestMapping(value="index", method=RequestMethod.GET)
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