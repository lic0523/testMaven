package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import pojo.ChannelPartners;
import service.ChannelPartnersService;

@Controller
@RequestMapping("/part")  
public class ChannelPartnersController {
	
	@Autowired
	private ChannelPartnersService channelPartnersService;
	
	
	@RequestMapping("/channelPartnersInfo.do")
	public String channelPartnersPage(HttpServletRequest request){
		return "partnersInfo" ;
	}
	
	
	@RequestMapping("/saveChannelPartners.do")
	public String saveChannelPartners(HttpServletRequest request,ChannelPartners partner){
		String op = request.getParameter("op");
		if("add".equals(op)){
			channelPartnersService.saveChannelPartner(partner);
		}else if("update".equals(op)){
			channelPartnersService.updateChannelPartner(partner);
		}
		return null ;
	}
	
	
	@RequestMapping("/deleteChannelPartners.do")
	public String deleteChannelPartners(HttpServletRequest request,int partId){
		channelPartnersService.deleteChannelPartner(partId);
		return null;
	}
	
	@RequestMapping(value="/getChannelPartnersList.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getChannelPartnersList(HttpServletRequest request){
		
		String pageStr = request.getParameter("page");
		String pageSizeStr = request.getParameter("limit");
		String partName = request.getParameter("partName");
		String isValidate = request.getParameter("isValidate");
		
		if(pageStr == null || "".equals(pageStr)){
			pageStr = "1";
		}
		
		if(pageSizeStr == null || "".equals(pageSizeStr)){
			pageSizeStr = "10";
		}
		
		int page = Integer.valueOf(pageStr);
		int pageSize = Integer.valueOf(pageSizeStr);
		int beginIndex = (page -1 )*pageSize ;
	
		Map<String ,Object> params = new HashMap<String,Object>();
		params.put("pageSize", pageSize);
		params.put("beginIndex", beginIndex);
		params.put("partName", partName);
		params.put("isValidate", isValidate);
		
		int total = channelPartnersService.getChannelPartnersListCount(params);
		List<ChannelPartners> list  = channelPartnersService.getChannelPartnersList(params);
		
		Map<String ,Object> result = new HashMap<String,Object>();
		result.put("code", 0);
		result.put("msg", "");
		result.put("count", total);
		result.put("data", list);
		String jsonStr = JSON.toJSONString(result) ;
		return jsonStr ;
	}

}
