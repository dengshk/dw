package com.dw.web.action.homePage;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dw.web.service.homePage.HomeService;

@Controller
@RequestMapping("/home")
public class HomeAction {

	private static final Logger logger = LoggerFactory.getLogger(HomeAction.class);

	@Autowired
	HomeService homeService;

	/**
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/homePage")
	public ModelAndView netWorkHome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/homePage/homePage");
		return mv;
	}

}
