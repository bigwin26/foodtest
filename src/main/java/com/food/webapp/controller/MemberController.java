package com.food.webapp.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
   public String join(Member member){ 
	   System.out.println(member.getEmail());
       int row = memberDao.insert(member);
      return "redirect:../login";
   }
}