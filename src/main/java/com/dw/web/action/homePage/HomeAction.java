package com.dw.web.action.homePage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dw.web.model.User;
import com.dw.web.service.homePage.HomeService;
import com.dw.web.utils.StringUtils;
import com.dw.web.utils.WebConstants;

@Controller
@RequestMapping("/home")
public class HomeAction {

	private static final Logger logger = LoggerFactory.getLogger(HomeAction.class);

	@Autowired
	HomeService homeService;

	/**
	 * 跳转首页并查询采样点和topn数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/homePage")
	public ModelAndView netWorkHome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/homePage/homePage");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();

		// 获取用户信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(WebConstants.USER);
		String userid = user.getUserid() + "";
		params.put("userId", userid);

		map = homeService.getTotalStatus(params);
		mv.addObject("total", map);
		return mv;
	}

	/**
	 * 查询首页图片数据
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/getChartsInfo", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> getChartsInfo(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取用户信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(WebConstants.USER);
		String userid = user.getUserid() + "";
		String uuid = StringUtils.getUuid();
		try {
			map = homeService.getChartsInfo(uuid, userid);
		} catch (Exception e) {
			logger.error("query info for charts of homePage,Accounting chart in HomeAction.getChartsInfo", e);
		}
		return map;
	}

}
