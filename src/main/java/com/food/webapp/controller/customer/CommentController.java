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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.CommentDao;
import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Comment;
import com.food.webapp.entity.RestaurantMenu;

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
	
	@Transactional
	@RequestMapping(value="comment/{id}", method=RequestMethod.POST)
	public String reg(@PathVariable("id") int id,
						Comment comment,
						CmtImage cmtImage,
						RestaurantMenu restaurantMenu,
						MultipartFile[] file,
						MultipartFile image,
						HttpServletRequest request,
						Principal principal,
						Model model) throws IllegalStateException, IOException {
		
		//�޴��� �ִ°�� (file[0] �̸�"", image �̸� ����) or �޴��� ���°��(file[]�̸� ����, image �̸�"") or �Ѵ� �ִ°��(�Ѵ� �̸�����) 
		String checkMenuName = image.getOriginalFilename();
		String checkFilesName = file[0].getOriginalFilename();
		
		String loginEmail = principal.getName();
		int loginId = memberDao.get(loginEmail).getId();
		//int nextCmtId = commentDao.getNextId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/commentImage", year,id));
		
		if((!checkFilesName.equals("")) && (!checkMenuName.equals(""))) {
			
			File f = new File(path); 
			if (!f.exists()) {
				if (!f.mkdirs())
					System.out.println("���丮�� ������ ���� �����ϴ�.");
			}

			comment.setMemberId(loginId);
			comment.setRestaurantId(id);
			commentDao.insert(comment);

			cmtImage.setCommentId(comment.getId());
			cmtImage.setMemberId(loginId);
			
			for (int i = 0; i < file.length; i++) {
				path += File.separator + file[i].getOriginalFilename();
				cmtImage.setSrc(file[i].getOriginalFilename());
				commentDao.insertCmtImage(cmtImage);
				File f2 = new File(path);
				file[i].transferTo(f2);
				path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/commentImage", year, id));
				System.out.println(path);
			}
			
			//System.out.println(image.getOriginalFilename());
			String menuPath = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/menuImage", year, id));
			File mf = new File(menuPath);
			if (!mf.exists()) {
				if (!mf.mkdirs())
					System.out.println("���丮�� ������ ���� �����ϴ�.");
			}
			
			restaurantMenu.setRestaurantId(id);
			restaurantMenu.setMemberId(loginId);
			restaurantMenu.setSrc(image.getOriginalFilename());
			commentDao.insertMenuImage(restaurantMenu);
			//System.out.println("image: " + image);
			
			menuPath += File.separator + image.getOriginalFilename();
			File mf2 = new File(menuPath);
			image.transferTo(mf2);
			System.out.println(menuPath);
		}
		else if((checkFilesName.equals("")) && (!checkMenuName.equals(""))) {
			
			String menuPath = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/menuImage", year, id));
			File mf = new File(menuPath);
			if (!mf.exists()) {
				if (!mf.mkdirs())
					System.out.println("���丮�� ������ ���� �����ϴ�.");
			}
			
			restaurantMenu.setRestaurantId(id);
			restaurantMenu.setMemberId(loginId);
			restaurantMenu.setSrc(image.getOriginalFilename());
			commentDao.insertMenuImage(restaurantMenu);
			//System.out.println("image: " + image);
			
			menuPath += File.separator + image.getOriginalFilename();
			File mf2 = new File(menuPath);
			image.transferTo(mf2);
			System.out.println(menuPath);
			
		}
		else if((!checkFilesName.equals("")) && (checkMenuName.equals(""))) {
			
			File f = new File(path); 
			if (!f.exists()) {
				if (!f.mkdirs())
					System.out.println("���丮�� ������ ���� �����ϴ�.");
			}

			comment.setMemberId(loginId);
			comment.setRestaurantId(id);
			commentDao.insert(comment);

			cmtImage.setCommentId(comment.getId());
			cmtImage.setMemberId(loginId);
			
			for (int i = 0; i < file.length; i++) {
				path += File.separator + file[i].getOriginalFilename();
				cmtImage.setSrc(file[i].getOriginalFilename());
				commentDao.insertCmtImage(cmtImage);
				File f2 = new File(path);
				file[i].transferTo(f2);
				path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d/commentImage", year, id));
				System.out.println(path);
			}
			
		}
		
		

		return "redirect:../restaurant/{id}";
	}
	
	@RequestMapping(value="comment/edit")
	public String edit() {
		return "customer.comment.edit";
	}
	
	@RequestMapping(value="deleteComment",method=RequestMethod.GET)
	public String deleteComment(@RequestParam(value="id") int id) {
		commentDao.delete(id);
		return "redirect:restaurant";
	}
}