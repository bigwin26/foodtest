package com.food.webapp.controller.customer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.food.webapp.dao.CommentDao;
import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Comment;
import com.food.webapp.entity.Restaurant;

@Controller
@RequestMapping("/customer/*")
public class CommentController {
/*	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	CommentDao commentDao;
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(value="comment/{id}", method=RequestMethod.GET)
	public String reg(@PathVariable("id") int id,
						Model model) {
		
		model.addAttribute("r", restaurantDao.get(id));
		
		model.addAttribute("cmtp", restaurantDao.cmtCount(id));
		
		return "customer.restaurant.detail";
	}
	
	@RequestMapping(value="comment/{id}", method=RequestMethod.POST)
	public String reg(@PathVariable("id") int id,
						Comment comment,
						MultipartFile[] file,
						Principal principal,
						Model model) {
		
		
		return "redirect:../restaurant/{id}";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.POST)
	public String reg(Restaurant restaurant, String aaa, MultipartFile file, HttpServletRequest request, Principal principal) throws IOException {
		
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