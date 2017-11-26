package com.food.webapp.controller.customer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mysql.jdbc.Connection;
import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.NoticeDao;
import com.food.webapp.dao.NoticeFileDao;
import com.food.webapp.entity.Notice;
import com.food.webapp.entity.NoticeFile;
import com.food.webapp.entity.NoticeView;


@Controller
@RequestMapping("/customer/*")
public class BoardController {
	
	  @Autowired
	   private NoticeDao noticeDao;
	   
	   @Autowired
	   private NoticeFileDao noticeFileDao;
	   
	   @Autowired
	   private MemberDao memberDao;
	   
	@RequestMapping("board")
		   public String notice(@RequestParam(value="p", defaultValue="1") Integer page, 
			         @RequestParam(value="f", defaultValue="title") String field,
			         @RequestParam(value="q", defaultValue="") String query,
			         Model model) {
			      
			      List<NoticeView> list = noticeDao.getList(1, "title", "%");
			      model.addAttribute("list", list);
			      
			      /*String output = String.format("p:%s, q:%s", page, query);
			      output += String.format("title : %s\n", list.get(0).getTitle());
			      */
			      //return "customer/notice";
		return "customer.board.list";
	}
	
	   @RequestMapping("board/{id}")
	   public String noticeDetail(@PathVariable("id") String id,Model model) {
	      
	      model.addAttribute("n", noticeDao.get(id));
	      model.addAttribute("prev", noticeDao.getNext(id));
	      model.addAttribute("next", noticeDao.getPrev(id));
	      
	      
	      return "customer.board.detail";
	   }
	   
	  /* @RequestMapping(value="notice/reg", method=RequestMethod.GET)
	   public String noticeReg() {
	      
	      return "customer.board.reg";
	   }
	   
	   @RequestMapping(value="notice/reg", method=RequestMethod.POST)
	   public String noticeReg(Notice notice,MultipartFile file,HttpServletRequest request,Principal principal) throws IOException {
	      //file.isempty() ����ڰ� ������ �������� �ʾҳ�?
		   
		   //title = new String(title.getBytes("ISO-8859-1"),"UTF-8");  //�ѱ۱��� ����
		  // System.out.println(title);
		   
		   //Date curDate = new Date(); //��¥ ��¹�1
		   
		   Calendar cal = Calendar.getInstance(); //��¥ ��¹�2
		  // Date curdate2 = cal.getTime();
		   int year = cal.get(Calendar.YEAR);
		   
		   SimpleDateFormat fmt = new SimpleDateFormat("hh:mm:ss"); //��¥ ��¹�3
		   fmt.format(null);
		   String nextId = noticeDao.getNextId();
		   
		   ServletContext ctx = request.getServletContext();
		   String path = ctx.getRealPath(String.format("/resource/customer/notice"+year+"/"+nextId));
		   
		   System.out.println(path);
		   
		   File f = new File(path);
		   
		   if(!f.exists()) {
			   if(!f.mkdirs())
				   System.out.println("���丮�� �����Ҽ� �����ϴ�.");
		   }
		   
		   path+= File.separator+file.getOriginalFilename();
		   File f2 = new File(path);
		   
		   InputStream fis = file.getInputStream();
		   OutputStream fos = new FileOutputStream(f2);
		   
		   byte[] buf = new byte[1024];
		   int size = 0;
		   while((size = fis.read(buf))>0)
			   fos.write(buf, 0, size);

		   fos.close();
		   fis.close();
		   
		   //file.getInputStream();
		   String fileName = file.getOriginalFilename();
		   System.out.println(fileName);
		   
		   String writerId = "SAKURA";
		   notice.setWriterId(writerId);
		   //int row = noticeDao.insert(title, content, writerId);
		  //int row = service.insertAndPointUp(notice);
		  memberDao.pointUp(principal.getName());
		  
		 noticeFileDao.insert(new NoticeFile(null,fileName,nextId));
		  
		  //Connection con = ;
		 // con.setAutoCommit(false);
		  
		  //Statement st = con.createStatement();
		   
	      return "redirect:../board";
	   }*/
	   @RequestMapping(value="board/edit/{id}", method=RequestMethod.GET)
	   public String noticeEdit(@PathVariable("id") String id,Model model) {
		   
		   model.addAttribute("n", noticeDao.get(id));
	      
	      return "customer.board.edit";
	   }
	   
	   @RequestMapping(value="board/edit/{id}", method=RequestMethod.POST)
	   public String noticeEdit(@PathVariable("id") String id, String title, String content) {
	      
	      int row = noticeDao.update(id, title, content);
	      System.out.println(row);
		   
	      return "redirect:../../{id}";
	   }
	   
}