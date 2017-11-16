package com.food.webapp.controller.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Restaurant;
import com.google.gson.Gson;

@Controller("adminController")
@RequestMapping("/admin/*")
public class RestaurantController {
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value="restaurant", method=RequestMethod.GET)
	public String restaurant(
					@RequestParam(value="p", defaultValue="1")  Integer page,
					@RequestParam(value="f", defaultValue="name")  String field,
					@RequestParam(value="q", defaultValue="") String query,
					Model model) {
		
		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("count", restaurantDao.getCount());
		
		return "admin.restaurant.list";
	}
	
	@RequestMapping(value="restaurant-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String restaurantAjax(
					String page,
					@RequestParam(value="f", defaultValue="name")  String field,
					@RequestParam(value="q", defaultValue="") String query,
					Model model) {
		
		//System.out.println(page);
		int page1 = Integer.parseInt(page);
		List<Restaurant> list = restaurantDao.getList(page1, field, query);
		
		model.addAttribute("list", list);

		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		//System.out.println(json);
		
		return json;
	}
	
	/*@RequestMapping(value="restaurant", method=RequestMethod.GET)
	public String restaurant(
					@RequestParam(value="p", defaultValue="1")  Integer page,
					@RequestParam(value="f", defaultValue="name")  String field,
					@RequestParam(value="q", defaultValue="") String query,
					@RequestParam(value="o", defaultValue="3") Integer ok,
					Model model) {
		
		System.out.println("restaurant page: " + page);
		System.out.println("restaurant ok: " + ok);
		
		model.addAttribute("list", restaurantDao.getList(page, field, query, ok));
		model.addAttribute("count", restaurantDao.getCount());
		
		return "admin.restaurant.list";
	}
	
	@RequestMapping(value="restaurant-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String restaurantAjax(
					String page,
					@RequestParam(value="f", defaultValue="name")  String field,
					@RequestParam(value="q", defaultValue="") String query,
					String ok,
					Model model) {
		
		int page1 = Integer.parseInt(page);
		int ok1 = Integer.parseInt(ok);
		
		System.out.println("restaurant-ajax page: " + page);
		System.out.println("restaurant-ajax ok: " + ok);
		
		List<Restaurant> list = restaurantDao.getList(page1, field, query, ok1);
		model.addAttribute("list", list);

		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		//System.out.println(json);
		
		return json;
	}*/
	
	@RequestMapping(value="restaurant", method=RequestMethod.POST)
	@ResponseBody
	public String reg(
			Restaurant restaurant, 
			int restaurantId, 
			String name, 
			Date regDate, 
			HttpServletRequest request) throws IOException {
		
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		String date = fmt.format(regDate);
		
		System.out.println(restaurantId);
		System.out.println(name);
		System.out.println(date);
		
		restaurant.setId(restaurantId);
		restaurant.setName(name);
		restaurant.setDate(date);
		
		int n = restaurantDao.okRestaurant(restaurant);
		if(n>0)
			System.out.println("success");
		
		//return "redirect:../restaurant";
		return "aa";
	}
	
	
/*	@RequestMapping("restaurant/{id}")
	public String detail(@PathVariable("id") int id,
						@RequestParam(value="p", defaultValue="1")  Integer page,
						Model model) {
		
		
		model.addAttribute("r", restaurantDao.get(id));
		model.addAttribute("prev", restaurantDao.getPrev(id));
		model.addAttribute("next", restaurantDao.getNext(id));
		
		model.addAttribute("cmtList", restaurantDao.getCmt(id, page));//코멘트 리스트 
		model.addAttribute("cmtp", restaurantDao.cmtCount(id));//코멘트 갯수
		
		return "customer.restaurant.detail";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.GET)
	public String reg() {

		return "customer.restaurant.reg";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.POST)
	public String reg(Restaurant restaurant, MultipartFile file, HttpServletRequest request, Principal principal) throws IOException {
		
		String loginEmail = principal.getName();
		int loginId = memberDao.get(loginEmail).getId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int nextId = restaurantDao.getNextId();
	      
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d", year,nextId));
		System.out.println("path : "+path);
		File f = new File(path); 
	      if(!f.exists()) {
		         if(!f.mkdirs())
		            System.out.println("디렉토리를 생성할 수가 없습니다.");
		      }
	      path +=File.separator + file.getOriginalFilename();
	      File f2 = new File(path); 
	      file.transferTo(f2);
		
		restaurant.setImage(file.getOriginalFilename());
		restaurant.setMemberId(loginId);
		restaurant.setLastMemberId(loginId);
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
   }*/
	
	
}