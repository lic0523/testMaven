
package controller;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pgeUtil.PageBean;
import pojo.User;
import service.IUserService;
 
@Controller  
@RequestMapping("/user")  
public class UserController {
	  @Resource  
	    private IUserService userService;  
	      
	    @RequestMapping("/showUser.do")  
	    public String toIndex(HttpServletRequest request,Model model){  
	    	System.out.println(request.getParameter("id"));
	        int userId = Integer.parseInt(request.getParameter("id"));  
	        User user = this.userService.getUserById(userId);  
	        model.addAttribute("user", user);  
	        return "showUser";  
	    }
	    
	 @RequestMapping("/login.do")
	 public String login(HttpServletRequest request){
		 request.setAttribute("bathpath", "http://localhost:8080/testMaven/");
		return "newlogin"; 
	 }
	 
	 @RequestMapping("/regist.do")
	 public String regist(){
		return "regist"; 
	 }
	 
	 @RequestMapping("/newadmin.do")
	 public String newadmin(){
		return "newadmin"; 
	 }
	 
	 @RequestMapping("/checkLogin.do")
	 public String checkLogin(String username,String password,Model model,HttpServletRequest request){
			  User us = userService.checkLogin(username, password);
			  if(us!=null){
			  model.addAttribute("username", us.getUserName());
			  request.setAttribute("username", us.getUserName());
			  return "index";
			  }
			  else{
				  return "error";
			  }
			 }
	 

		@RequestMapping("/checkregist.do")
		@ResponseBody
		public String checkregist(String userName,String password,String age,Model model) throws UnsupportedEncodingException{
			int pwd = Integer.parseInt(password);
			int ag = Integer.parseInt(age);
			String uname = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
			System.out.println(uname);
			int user = userService.regist(uname, pwd, ag);
			if(user!=0){
				return "index";
			}else{
				return "error";
			}
		}
		
		@RequestMapping("/getAllUser.do")  
	    public String getAllUser(HttpServletRequest request,Model model){  
	        List<User> user = userService.findAll();
	        PageBean pb = new PageBean(1, 100, user.size());
	        pb.setList(userService.findByPage("",pb.getStartIndex(),pb.getPageSize()));
	        
	        model.addAttribute("pageBean", pb);  
	        request.setAttribute("pageBean", pb); 
	        return "/newadmin";  
	    } 
		
		
		@RequestMapping("/findByUname.do")
	    public String findByUname(HttpServletRequest request,Model model,String userName) throws UnsupportedEncodingException{  
			String uname = new String(userName.getBytes("ISO-8859-1"), "UTF-8");
			List<User> ulist = userService.findByUname(uname);
	        PageBean pb = new PageBean(1, 100, ulist.size());
	        pb.setList(userService.findByPage(uname,pb.getStartIndex(),pb.getPageSize()));
	        
	        model.addAttribute("pageBean", pb);  
	        request.setAttribute("pageBean", pb); 
	        model.addAttribute("name", uname);  
	        request.setAttribute("name", uname);
	        return "/newadmin";
	    } 
		
		@RequestMapping("/updateUser.do")  
	    public String updateUser(int id,String username,String password){ 
			User user = new User();
	        if(userService.update(id, username, password)){ 
	            return "redirect:/user/getAllUser.do";  
	        }else{  
	            return "/error";  
	        }  
	    }  
		
		@RequestMapping("/delUser.do")  
	    public void delUser(int id,HttpServletRequest request,HttpServletResponse response){  
	        String result = "{\"result\":\"error\"}";  
	        if(userService.delete(id)){  
	            result = "{\"result\":\"success\"}";  
	        }  
	        response.setContentType("application/json");  
	        try {  
	            PrintWriter out = response.getWriter();  
	            out.write(result);  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }  
		
		@RequestMapping("/getUser.do")  
	    public String getUser(int id,HttpServletRequest request,Model model){  
	        request.setAttribute("user", userService.findById(id));  
	        model.addAttribute("user", userService.findById(id));  
	        return "/editUser";  
	    }
		
		@RequestMapping("/FindAllWithPage.do")
		public String FindAllWithPage(int pageNum,HttpServletRequest request){
			int pageSize = 3;
			PageBean pb = userService.findAllUserWithPage(pageNum, pageSize);
			request.setAttribute("pageBean", pb);
			return "admin";
		}
		
		@RequestMapping("/findadmininfo.do")
		public String findadmininfo(String username,HttpServletRequest request,Model model){
			List usList = userService.findByUname(username);
			User user = (User) usList.get(0);
			request.setAttribute("user", user);
			model.addAttribute("user", user);
			return "admininfo";
			
		}
}
