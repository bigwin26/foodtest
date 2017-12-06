package com.food.webapp.controller.customer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.food.webapp.dao.CommentDao;
import com.food.webapp.dao.LikeDao;
import com.food.webapp.dao.MemberDao;
import com.food.webapp.dao.RestaurantDao;
import com.food.webapp.entity.CmtImage;
import com.food.webapp.entity.Restaurant;
import com.food.webapp.entity.RestaurantMenu;
import com.google.gson.Gson;

@Controller("customerController")
@RequestMapping("/customer/*")
public class RestaurantController {
	
	@Autowired
	RestaurantDao restaurantDao;
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	CommentDao commentDao;
	
	@Autowired
	LikeDao likeDao;
	
	@RequestMapping(value="restaurant",method=RequestMethod.GET)
	public String restaurant(@RequestParam(value="p", defaultValue="1")  Integer page,
							@RequestParam(value="f", defaultValue="name")  String field,
							@RequestParam(value="q", defaultValue="") String query,
							Model model) {
		
		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("page", restaurantDao.getCount());
		
		return "customer.restaurant.list";
	}
	
	@RequestMapping(value="restaurant-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String restaurantAjax(
							String page,
							@RequestParam(value="f", defaultValue="name")  String field,
							@RequestParam(value="q", defaultValue="") String query,
							Model model) {
		
		System.out.println(page);
		int page1 = Integer.parseInt(page);
		List<Restaurant> list = restaurantDao.getList(page1, field, query);
		
		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		System.out.println(json);
		
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		
		return json;
	}

	@RequestMapping(value="restaurant-menu-ajax", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String restaurantMenuAjax(
							String id,
							Model model) {
		
		//System.out.println(id);
		int id1 = Integer.parseInt(id);
		List<CmtImage> list = restaurantDao.cmtImageList(id1);
		
		String json = "";
		
		Gson gson = new Gson();
		json = gson.toJson(list);
		
		try {
			Thread.sleep(500);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//System.out.println(json);
		return json;
	}

	
	@RequestMapping("restaurant/{id}")
	public String detail(@PathVariable("id") int id,
						@RequestParam(value="p", defaultValue="1")  Integer page,
						Model model,Principal principal) {
		
		model.addAttribute("email",principal.getName());
		model.addAttribute("r", restaurantDao.get(id));
		model.addAttribute("prev", restaurantDao.getPrev(id));
		model.addAttribute("next", restaurantDao.getNext(id));
		model.addAttribute("cmtList", restaurantDao.getCmt(id, page));//�ı� ����Ʈ 
		model.addAttribute("cmtp", restaurantDao.cmtCount(id));//�ı� ����
		
		model.addAttribute("cmtImageList", restaurantDao.cmtImageList(id));//�ı� ������
		
		return "customer.restaurant.detail";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.GET)
	public String reg() {

		return "customer.restaurant.reg";
	}
	
	@RequestMapping(value="restaurant/reg", method=RequestMethod.POST)
	public String reg(
					Restaurant restaurant, 
					MultipartFile file, 
					HttpServletRequest request, 
					Principal principal) throws IOException {
		
		String loginEmail = principal.getName();
		int loginId = memberDao.get(loginEmail).getId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int nextId = restaurantDao.getNextId();
	      
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath(String.format("/resource/customer/restaurant/%d/%d", year,nextId));
		System.out.println("path : "+path);
		File f = new File(path); 
	      if(!f.exists()) {
		         if(!f.mkdirs())
		            System.out.println("���丮�� ������ ���� �����ϴ�.");
	      }
	    path +=File.separator + file.getOriginalFilename();
	    File f2 = new File(path); 
	    file.transferTo(f2);
		System.out.println(path);
		restaurant.setImage(file.getOriginalFilename());
		restaurant.setMemberId(loginId);
		restaurant.setLastMemberId(loginId);
		restaurantDao.insert(restaurant);
		
		return "redirect:../restaurant";
	}
	
	@RequestMapping(value="restaurant/edit/{id}", method=RequestMethod.GET)
	public String edit() {

		return "customer.restaurant.edit";
	}
	
   @RequestMapping(value="restaurant/edit/{id}", method=RequestMethod.POST)
   public String edit(@PathVariable("id") String id, String title, String content) {
      
      return "redirect:../{id}";
   }
   
/*   @RequestMapping(value="searchRestaurant",produces="text/plain;charset=UTF-8")
	public String search(Restaurant restaurant,
			@RequestParam(value="p", defaultValue="1")  Integer page,
			@RequestParam(value="f", defaultValue="name")  String field,
			@RequestParam(value="q", defaultValue="") String query,
			Model model) {

		model.addAttribute("list", restaurantDao.getList(page, field, query));
		model.addAttribute("count", restaurantDao.getCount());

		return "redirect:restaurant";
	}*/
   @RequestMapping(value ="restaurant/like", method = RequestMethod.GET)
   @ResponseBody
   public String boardLikeSave(@RequestParam int restaurant_Id, Principal principal) {
      int restaurantId = restaurant_Id;
      System.out.println("왓다 infoID : "+ restaurant_Id);
      String memberId = principal.getName();
      System.out.println("왓다 memberID : "+ memberId);
      // 좋아요 start저장하는 부분
      // 좋아요를 누른 사용자 중복체크
      Integer checkResult = 0;
      checkResult = likeDao.Check(restaurantId, memberId);
       System.out.println("idcheckResult : "+ checkResult);
      // writerId값이 존재하지 않으면 <=0
      if (checkResult <= 0) {
         int insertResult = 0;
         insertResult = likeDao.Insert(restaurantId, memberId);// 좋아요누른사람저장하기
         if (insertResult > 0) {
            System.out.println("Like_writerId등록에 성공하였습니다.");
         } else {
            System.out.println("Like_writerId등록에 실패하였습니다.");
         }
      }
      else if(checkResult == 1) {
    	  int result = 0;
          result = likeDao.delete(restaurantId, memberId);// 좋아요누른사람삭제
          if (result == 0) {
             System.out.println("Like_writerId 삭제에 성공하였습니다.");
          } 
      }
      // 좋아요 값을 가져오는 부분
      Map<String, Integer> obj = new HashMap<String, Integer>();
      obj.put("idCheck", checkResult);
      String json = "";
      Gson gson = new Gson();
      json = gson.toJson(obj);
      return json;
   }

}