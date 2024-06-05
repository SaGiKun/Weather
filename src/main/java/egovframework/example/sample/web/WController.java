package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WController {
	@RequestMapping(value = "/form.do")
	public String form() {
		
		return "w/form";
	}
	
	@RequestMapping(value = "/search.do")
	public String search() {
		
		return "w/search";
	}
	
	@RequestMapping(value = "/nameSearch.do")
	public String nameSearch() {
		
		return "w/nameSearch";
	}
	
	@RequestMapping(value = "/weatherSearch.do")
	public String weatherSearch() {
		
		return "w/weatherSearch";
	}
	
	@RequestMapping(value = "/dataSearch.do")
	public String dataSearch() {
		
		return "w/dataSearch";
	}
	
	@RequestMapping(value = "/weather.do")
	public String weather() {
		
		return "w/weather";
	}
	
	@RequestMapping(value = "/map.do")
	public String map() {
		
		return "w/map";
	}
	
	@RequestMapping(value = "/main.do")
	public String main() {
		
		return "w/main";
	}
	
	@RequestMapping(value = "/testRedirectPage.do")
	public String test1() {
		
		return "w/testRedirectPage";
	}
}
