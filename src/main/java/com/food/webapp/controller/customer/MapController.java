package com.food.webapp.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;
import com.google.gson.Gson;

@Controller
@RequestMapping("/customer/*")
public class MapController {
	
	@Autowired
	RestaurantDao restaurantDao;

	@RequestMapping("map")
	public String map(Model model) {
		
		model.addAttribute("list", restaurantDao.getListAll());
		
		return "customer.map.list";
	}
	
	@RequestMapping(value="map-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String mapAjax(Model model) {
		
		List<Restaurant> list = restaurantDao.getListAll();
		
		model.addAttribute("list", restaurantDao.getListAll());

		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		return json;
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