package com.food.webapp.controller.admin;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.Member;
import com.food.webapp.entity.Restaurant;
import com.google.gson.Gson;

@Controller("admin-memberController")
@RequestMapping("/admin/*")
public class MemberController {
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	MemberDao memberDao;
	
	/*@RequestMapping(value="member", method=RequestMethod.GET)
	public String member() {
		
		return "admin.member.list";
	}*/
	
	@RequestMapping(value="member", method=RequestMethod.GET)
	public String member(
			@RequestParam(value="p", defaultValue="1")  Integer page,
			@RequestParam(value="f", defaultValue="nickName")  String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		model.addAttribute("list", memberDao.getListAdmin(page, field, query));
		model.addAttribute("count", memberDao.getCountAdmin(field, query));
		
		return "admin.member.list";
	}
	
	@RequestMapping(value="member-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String restaurantAjax(
					String page,
					@RequestParam(value="f", defaultValue="nickName")  String field,
					@RequestParam(value="q", defaultValue="") String query,
					Model model) throws UnsupportedEncodingException {
		
		int page1 = Integer.parseInt(page);
		query = URLDecoder.decode(query,"UTF-8");
		
		System.out.println("member-ajax page: " + page);
		System.out.println("member-ajax field: " + field);
		System.out.println("member-ajax query:" + query);
		
		List<Member> list = memberDao.getListAdmin(page1, field, query);
		model.addAttribute("list", list);

		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		//System.out.println(json);
		
		return json;
	}
	
	
}