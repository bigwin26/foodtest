package com.food.webapp.controller;

import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;

@Controller
@RequestMapping("/*")
public class MemberController {
	

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value="member/login", method=RequestMethod.GET)	
	public String Login() 	{
		
		return "member.login";
	}
	
	@RequestMapping(value="member/login", method=RequestMethod.POST)
	   //public String noticeReg(String title, String content) throws UnsupportedEncodingException {
	   public String Login(Member member,MultipartFile file,HttpServletRequest request,Principal principal) {
		
		return "redirect:../index";
}
	

	@RequestMapping(value="member/join", method=RequestMethod.GET)	
	public String Join() 	{
		
		return "member.join";
	}
	
	/*@RequestMapping(value="member/login", method=RequestMethod.POST)
	   //public String noticeReg(String title, String content) throws UnsupportedEncodingException {
	   public String MemberJoin(Member member) {
		
		return "redirect:login";
}*/
}