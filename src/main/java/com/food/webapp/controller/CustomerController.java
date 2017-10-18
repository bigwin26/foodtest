package com.food.webapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.Date;

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

import com.food.webapp.dao.LunchDao;
import com.food.webapp.dao.LunchFileDao;
import com.food.webapp.entity.Lunch;
import com.food.webapp.entity.LunchFile;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	
	@Autowired
	private LunchDao lunchDao;
	
	@Autowired
	private LunchFileDao lunchFileDao;


	@RequestMapping("lunch")
	public String lunch(
			@RequestParam(value="p", defaultValue="1")  Integer page,
			@RequestParam(value="f", defaultValue="title")  String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {
		
		/*List<NoticeView> list = noticeDao.getList(page, field, query);		
		model.addAttribute("list", list);*/
		
		
		model.addAttribute("list", lunchDao.getList(page, field, query));
		
		//String output = String.format("p:%s, q:%s", page, query);
		//output += String.format("title : %s\n", list.get(0).getTitle());
		
		//return "customer/notice";
		return "customer.lunch.list";
	}
	

	@RequestMapping("lunch/{id}")	
	public String lunchDetail(
				@PathVariable("id") String id, Model model) {
		
	/*	select * from NoticeView where id < 250 order by regDate desc limit 1;

		select * from NoticeView where id > 250 order by regDate asc limit 1;*/
	
		
		model.addAttribute("n", lunchDao.get(id));
		model.addAttribute("prev", lunchDao.getPrev(id));
		model.addAttribute("next", lunchDao.getNext(id));
		
		return "customer.lunch.detail";
	}
	
	@RequestMapping(value="lunch/reg", method=RequestMethod.GET)	
	public String lunchReg() 	{
		
		return "customer.lunch.reg";
	}
	
	@RequestMapping(value="lunch/reg", method=RequestMethod.POST)
	   //public String noticeReg(String title, String content) throws UnsupportedEncodingException {
	   public String lunchReg(Lunch lunch,String aa, MultipartFile file, HttpServletRequest request) throws IOException {
	   
	      //1011��¥ ����
	      /*//��¥�� ��� ��� 1)
	      Date curDate = new Date();
	      //curDate.getYear(); //������� �ִ� ���*/
	      //��¥�� ��� ��� 2)�м�?? ����
	      Calendar cal = Calendar.getInstance();
	      Date curDate2 = cal.getTime();
	      int year = cal.get(Calendar.YEAR);
	      /*//��¥�� ��� ��� 3)���ڿ��� �ٲ㼭 ���� ������
	      //SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	      SimpleDateFormat fmt = new SimpleDateFormat("yyyy");
	      String year = fmt.format(curDate);*/
	      
	      String nextId = lunchDao.getNextId();
	      
	      //1011���� ��� ����
	      ServletContext ctx = request.getServletContext();
	      String path = ctx.getRealPath(String.format("/resource/customer/notice/%d/%s", year,nextId));
	                           //"/resource/customer/notice/"+year+"/"+nextId); //�������ȿ� �Խñ� ��ȣ�� �ְ� ����
	      
	      System.out.println("path : "+path);
	      
	      File f = new File(path);   //���������� �����ϱ� ���� ���� ��ü , ��δ� ������ ����ϱ� ���� �غ����
	      
	      if(!f.exists()) {
	         if(!f.mkdirs())
	            System.out.println("���丮�� ������ ���� �����ϴ�.");
	      }
	      //1012 ���� ��ο� ���ϸ� �߰�
	      
	      path += File.separator+file.getOriginalFilename();//�� path�� \������ ����path�� /.. �� �ü�����ٱ�Ģ�� �ٸ�. �̰��� ����ϰ� ���ִ� ��
	      File f2 = new File(path); //������ ������� ��
	      System.out.println("path2 : "+path);
	      InputStream fis = file.getInputStream();   //�б�
	      OutputStream fos = new FileOutputStream(f2); //���
	      
	      byte[] buf = new byte[1024];
	      
	      int size =0;
	      while((size = fis.read(buf))>0)
	         fos.write(buf, 0, size);
	      
	      fos.close();
	      fis.close();
	      
	      //--------------------�ѱ� ����--------------------------
	      //�Ķ���͵����͸� �������� ���� request(utf8)�� �Ҽ� ����. ���1 filter(was�� ������Ʈ ������,����,������ ���ݱ��� ���������� �˾����� ���ݺ��ʹ� ���Ϳ� ����� �˾ƺ���
	      // ���1) // title = new String(title.getBytes("ISO-8859-1"),"UTF-8");
	      // ���2) ����
	      
	      //---------------file����------------------------
	      //file.getInputStream(); //resource�ȿ� �־�� ���� ������ ��. �ۿ� ���� ��� ����� ����.
	      String fileName = file.getOriginalFilename(); //���� �̸� Ȯ��
	      System.out.println("filename : "+fileName);
	      

	      System.out.println("title : " + lunch.getName());
	      //int row = noticeDao.insert(title, content,writerId);
	      int row = lunchDao.insert(lunch);
	      lunchFileDao.insert(new LunchFile(null, fileName, nextId));
	      
	      return "redirect:../lunch";
	   }

}