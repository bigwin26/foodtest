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

@Controller("customer-noticeController")
@RequestMapping("/customer/*")
public class NoticeController {

	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private NoticeFileDao noticeFileDao;

	@Autowired
	private MemberDao memberDao;

	@RequestMapping("notice")
	public String notice(@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "f", defaultValue = "title") String field,
			@RequestParam(value = "q", defaultValue = "") String query, Model model) {

		List<NoticeView> list = noticeDao.getList(1, "title", "%");

		model.addAttribute("list", list);

		/*
		 * String output = String.format("p:%s, q:%s", page, query); output +=
		 * String.format("title : %s\n", list.get(0).getTitle());
		 */
		// return "customer/notice";
		return "customer.notice.list";
	}

	@RequestMapping(value = "notice/{nickName}")
	public String noticeDetail(@PathVariable("nickName") String id, Model model) {

		model.addAttribute("n", noticeDao.get(id));
		model.addAttribute("prev", noticeDao.getNext(id));
		model.addAttribute("next", noticeDao.getPrev(id));

		return "customer.notice.detail";
	}

	@RequestMapping(value = "notice/reg", method = RequestMethod.GET)
	public String noticeReg() {

		return "customer.notice.reg";
	}

	@RequestMapping(value = "notice/reg", method = RequestMethod.POST)
	public String noticeReg(Notice notice, MultipartFile file, HttpServletRequest request, Principal principal)
			throws IOException {
		// file.isempty() 占쏙옙占쏙옙微占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십았놂옙?

		// title = new String(title.getBytes("ISO-8859-1"),"UTF-8"); //占싼글깍옙占쏙옙 占쏙옙占쏙옙
		// System.out.println(title);

		// Date curDate = new Date(); //占쏙옙짜 占쏙옙쨔占�1

		Calendar cal = Calendar.getInstance(); // 占쏙옙짜 占쏙옙쨔占�2
		// Date curdate2 = cal.getTime();
		int year = cal.get(Calendar.YEAR);

		/*
		 * SimpleDateFormat fmt = new SimpleDateFormat("hh:mm:ss"); //占쏙옙짜 占쏙옙쨔占�3
		 * fmt.format(arg0);
		 */
		String nextId = noticeDao.getNextId();
		String loginEmail = principal.getName();
		String loginId = memberDao.get(loginEmail).getnickName();
		System.out.println(loginId);
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/notice" + year + "/" + nextId));

		System.out.println(path);

		File f = new File(path);

		if (!f.exists()) {
			if (!f.mkdirs())
				System.out.println("占쏙옙占썰리占쏙옙 占쏙옙占쏙옙占쌀쇽옙 占쏙옙占쏙옙占싹댐옙.");
		}

		path += File.separator + file.getOriginalFilename();
		File f2 = new File(path);

		InputStream fis = file.getInputStream();
		OutputStream fos = new FileOutputStream(f2);

		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = fis.read(buf)) > 0)
			fos.write(buf, 0, size);

		fos.close();
		fis.close();

		// file.getInputStream();
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		notice.setId(nextId);
		notice.setWriterName(loginId);
		notice.setFileName(fileName);
		// int row = noticeDao.insert(title, content, writerId);
		noticeDao.insert(notice);
		// memberDao.pointUp(principal.getName());

		/*
		 * noticeFileDao.insert(new NoticeFile(null,fileName,nextId));
		 * 
		 * Connection con = ; con.setAutoCommit(false);
		 * 
		 * Statement st = con.createStatement();
		 */

		return "redirect:../notice";
	}

	@RequestMapping(value = "notice/edit/{id}", method = RequestMethod.GET)
	public String noticeEdit(@PathVariable("id") String id, Model model) {

		model.addAttribute("n", noticeDao.get(id));

		return "customer.notice.edit";
	}

	/*@RequestMapping(value = "notice/edit/{id}", method = RequestMethod.POST)
	public String noticeEdit(@PathVariable("id") String id, String title, String content) {

		int row = noticeDao.update(id, title, content);
		System.out.println(row);

		return "redirect:../{id}";
	}*/

}
