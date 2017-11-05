package com.food.webapp.controller;




import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberDao memberDao;

	
   @RequestMapping(value="login")
   public String login() { 
       
      return "member.login";
   }
   
   @RequestMapping(value="join", method=RequestMethod.GET)
   public String join() { 
      return "member.join";
   }
   
   
   @RequestMapping(value="join", method=RequestMethod.POST)
   public String join(Member member,HttpServletRequest request, MultipartFile file){
   
	   String image = file.getOriginalFilename();    
	   member.setImage(image); 
       int row = memberDao.insert(member);
      
       
       
       
      return "redirect:login";
   }
}