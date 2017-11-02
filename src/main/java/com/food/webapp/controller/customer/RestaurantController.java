package com.food.webapp.controller.customer;

import java.security.Principal;
import java.util.Calendar;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;

@Controller
@RequestMapping("/customer/*")
public class RestaurantController {
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@RequestMapping("restaurant")
	public String restaurant(@RequestParam(value="p", defaultValue="1")  Integer page,
							@RequestParam(value="f", defaultValue="name")  String field,
							@RequestParam(value="q", defaultValue="") String query,
							Model model) {
		
		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("page", restaurantDao.getCount());
		
		return "customer.restaurant.list";
	}
	
	@RequestMapping("restaurant/{id}")
	public String detail(@PathVariable("id") int id,
						@RequestParam(value="p", defaultValue="1")  Integer page,
						Model model) {
		
		model.addAttribute("r", restaurantDao.get(id));
		model.addAttribute("prev", restaurantDao.getPrev(id));
		model.addAttribute("next", restaurantDao.getNext(id));
		
		model.addAttribute("cmtList", restaurantDao.getCmt(id, page));//ÄÚ¸àÆ® ¸®½ºÆ® 
		model.addAttribute("cmtp", restaurantDao.cmtCount(id));//ÄÚ¸àÆ® °¹¼ö
		
		return "customer.restaurant.detail";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.GET)
	public String reg() {

		return "customer.restaurant.reg";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.POST)
	public String reg(Restaurant restaurant, String aaa, MultipartFile file, HttpServletRequest request, Principal principal) {
		
		/*Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int nextId = restaurantDao.getNextId();
	      
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d", year,nextId));*/
		
		restaurant.setImage(file.getOriginalFilename());
		System.out.println("df");
		System.out.println(principal.getName());
		
		restaurantDao.insert(restaurant);
		
		
		return "redirect:../restaurant";
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