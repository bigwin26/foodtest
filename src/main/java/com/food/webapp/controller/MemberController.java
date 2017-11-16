package com.food.webapp.controller;





import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.MemberDao;
import com.food.webapp.entity.Member;
import com.food.webapp.entity.ResultMessage;

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

   @RequestMapping(value="sameCheckId", method=RequestMethod.POST)
	@ResponseBody
	public ResultMessage sameCheckId(Member member) {
		
		ResultMessage resultMsg = null;
		int selectCnt = 0;
		
		try {
			selectCnt = memberDao.sameCheckId(member);
			
			if ( selectCnt == 0 )	
				resultMsg = new ResultMessage("false");
			else					
				resultMsg = new ResultMessage("true");
		} catch (Exception e) {
			
			e.printStackTrace();
			resultMsg = new ResultMessage("Fail");
		}
		
		return resultMsg;
	}
   
   @RequestMapping(value="edit/{nickName}", method=RequestMethod.GET)
   public String edit(@PathVariable("nickName") String nickName,Model model) {
	   
	   model.addAttribute("member", memberDao.getMember(nickName));
      System.out.println(nickName);
      return "member.edit";
   }
   
   /*@RequestMapping(value="edit", method=RequestMethod.POST)
   public String noticeEdit(@PathVariable("id") String id, String title, String content) {
      
      int row = service.updateNotice(id, title, content);
      System.out.println(row);
	   
      return "redirect:../{id}";
   }*/
}