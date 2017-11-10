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
		
		return "customer.comment.reg";
	}
	
	@RequestMapping(value="comment/{id}", method=RequestMethod.POST)
	public String reg(@PathVariable("id") int id,
						Comment comment,
						MultipartFile[] file,
						HttpServletRequest request,
						Principal principal,
						Model model) throws IllegalStateException, IOException {
		
		String loginEmail = principal.getName();
		int loginId = memberDao.get(loginEmail).getId();
		//int nextCmtId = commentDao.getNextId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/commentImage", year,id));
		
		File f = new File(path); 
	      if(!f.exists()) {
		         if(!f.mkdirs())
		            System.out.println("디렉토리를 생성할 수가 없습니다.");
		      }
	      
	      for(int i = 0; i<file.length; i++) {
		      path +=File.separator + file[i].getOriginalFilename();
		      File f2 = new File(path); 
		      file[i].transferTo(f2);
	      }
	      
	      comment.setMemberId(loginId);
	      comment.setRestaurantId(id);
	      commentDao.insert(comment);
	      
		return "redirect:../restaurant/{id}";
	}
	
	
}