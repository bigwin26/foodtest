package com.food.webapp.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.webapp.dao.AutoCompleteDao;
import com.food.webapp.dao.RealTimeDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.RealTime;
import com.google.gson.Gson;

@Controller
@RequestMapping("/*")
public class HomeController {
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	AutoCompleteDao autoComplateDao;
	
	@Autowired
	RealTimeDao realTimeDao;
	
	
	@RequestMapping(value="autocom", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, String>> autocom(String term) {

		System.out.println(term);
		
		List<Map<String, String>> result = autoComplateDao.autoComplete(term);
		
		System.out.println(result);
	
		return result;
		
	}
	
	@RequestMapping(value="index", method=RequestMethod.GET)
	public String index(Model model) {

		

		
		
		
		
		
		
		return "home.index";
	}
	
	@RequestMapping(value="realTime", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String realTime(Model model) {
		
		List<RealTime> result = realTimeDao.realTime();
		
		String json = "";
		Gson gson = new Gson();
		json = gson.toJson(result);
		
		System.out.println(json);
		
		return json;
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