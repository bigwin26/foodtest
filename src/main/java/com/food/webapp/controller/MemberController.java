package com.food.webapp.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
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
import com.food.webapp.entity.Member;
import com.food.webapp.entity.ResultMessage;

@Controller("memberController")
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
   @RequestMapping(value="login")
   public String login() { 
       
      return "member.login";
   }
   
   @RequestMapping(value="join", method=RequestMethod.GET)
   public String join() { 
      return "member.join";
   }
   
   
   @RequestMapping(value="join", method=RequestMethod.POST)
   public String join(String email, Member member,HttpServletRequest request, MultipartFile file) throws IOException{
   
	   		String image = file.getOriginalFilename();	  
	   		String ext = ".png";
	   

		     
	       
	   		ServletContext ctx = request.getServletContext();
		      String path = ctx.getRealPath("/resource/userimages/"+email);  
		      File f1 = new File(path);
		      if(!f1.isDirectory()) {
		    	  f1.mkdirs();
		    	  
		    	     	  
			      String path1 = ctx.getRealPath("/resource/images/user.png");
			        
	 				File f = new File(path1);
	 				System.out.println(path1);
					FileInputStream input = new FileInputStream(f);
					FileOutputStream output= new FileOutputStream(new File(path+"/"+email+".png"));

					int readBuffer = 0;
			        byte [] buffer = new byte[1024];
			        while((readBuffer = input.read(buffer)) > 0) {
			            output.write(buffer, 0, readBuffer);
			        }
			        input.close();
			        output.close();
		    	  
		    		  if(!(image=="")) {
		    		  path += File.separator+email+ext;
				      //System.out.println("path : " + path);
				      File f2 = new File(path);
				     // System.out.println("path : " + path);
				      	      
				      InputStream fis = file.getInputStream();
				      OutputStream fos = new FileOutputStream(f2);
				      
				      byte[] buf = new byte[1024];      
				      int size = 0;
				      while((size = fis.read(buf)) > 0)
				      fos.write(buf, 0, size);
				      
				      fis.close();
				      fos.close();
		    		  }  
			        
		      }	  
		      
		      member.setImage(email+ext); 
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
   
   @RequestMapping(value="edit", method=RequestMethod.POST)
   public String edit(String useremail, Model model, Member member) {
	   
	   
	   
	   member.setEmail(useremail);
	   model.addAttribute("userinfo", memberDao.editUserInfo(member));
	   	   
	   
      return "member.edit";
   }
   
   @RequestMapping(value="editMember", method=RequestMethod.POST)
   public String editMember(String nickName, String pwdchk, String mentor, Model model, MultipartFile file, Member member, HttpServletRequest request, Principal principal) throws IOException {
	   
	   	  
	   String email = principal.getName();
	   String ext = ".png";
	   
	   	  ServletContext ctx = request.getServletContext();
	      String path = ctx.getRealPath("/resource/userimages/"+email);  
	      File f1 = new File(path);
	      if(!f1.isDirectory()) 
	    	  f1.mkdirs();
	    	  
	    	  
	      if(""==file.getOriginalFilename()) {
	    	  
	    	  	    	  
	      } else {
	    	  path += File.separator+email+ext;
		      //System.out.println("path : " + path);
		      File f2 = new File(path);
		     // System.out.println("path : " + path);
		      	      
		      InputStream fis = file.getInputStream();
		      OutputStream fos = new FileOutputStream(f2);
		      
		      byte[] buf = new byte[1024];      
		      int size = 0;
		      while((size = fis.read(buf)) > 0)
		      fos.write(buf, 0, size);
		      
		      fis.close();
		      fos.close();
	    	  
		      
	      }
	      
	      member.setEmail(email);
	      member.setnickName(nickName);
    	  member.setPwd(pwdchk);
    	  member.setMentor(mentor);
    	  member.setImage(email+".png");
	      
    	  memberDao.editMember(member);
	    	  
	    	  
	
	   
	   
	   
      return "redirect:../index";
   }
   
   
   
   /*@RequestMapping(value="edit", method=RequestMethod.POST)
   public String noticeEdit(@PathVariable("id") String id, String title, String content) {
      
      int row = service.updateNotice(id, title, content);
      System.out.println(row);
	   
      return "redirect:../{id}";
   }*/
   
   @RequestMapping(value="list",method=RequestMethod.GET)
	public String list() {
		return "member.myinfo.list";
	}
   
   @RequestMapping(value="liked",method=RequestMethod.GET)
	public String liked(@RequestParam(value="p", defaultValue="1")  Integer page,
							@RequestParam(value="f", defaultValue="name")  String field,
							@RequestParam(value="q", defaultValue="") String query,
							Model model) {
		
		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("page", restaurantDao.getCount());
		
		return "member.myinfo.liked";
	}
}