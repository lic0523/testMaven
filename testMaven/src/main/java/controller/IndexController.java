package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("/index")
    public String homepage(){
        return "admin/index/login";
    }
	
	@RequestMapping("/welcome")
    public String welcomepage(){
        return "admin/index/welcome";
    }	

}
