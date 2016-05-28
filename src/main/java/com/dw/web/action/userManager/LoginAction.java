package com.dw.web.action.userManager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dw.web.action.commManager.SuperAction;
import com.dw.web.dao.userManager.UserMapper;
import com.dw.web.model.Right;
import com.dw.web.model.User;
import com.dw.web.service.userManager.OperatorService;
import com.dw.web.shiro.OperatorToken;
import com.dw.web.utils.WebConstants;

@Controller
@RequestMapping("/login")
public class LoginAction extends SuperAction {
	@Autowired
	private UserMapper userDao;

	@Autowired
	private OperatorService operatorService;

	private static Logger logger = LoggerFactory.getLogger(LoginAction.class);
	
	/**
	* 功能说明: 登录
	* 修改者名字: dsk
	* 修改日期 2016年5月28日
	* 修改内容 
	* @参数： @param request
	* @参数： @param response
	* @参数： @param username
	* @参数： @param password
	* @参数： @return
	* @参数： @throws IOException   
	* @throws
	 */
	@RequestMapping(value = "validate")
	public @ResponseBody
	Map<String, String> validate(HttpServletRequest request, HttpServletResponse response, String username, String password) throws IOException {
		HttpSession session = request.getSession();
		Map<String, String> map = validate(session, username, password);
		return map;
	}

	/**
	* 功能说明: 注销
	* 修改者名字: dsk
	* 修改日期 2016年5月28日
	* 修改内容 
	* @参数： @param request
	* @参数： @param response
	* @参数： @return
	* @参数： @throws IOException   
	* @throws
	 */
	@RequestMapping(value = "logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute(WebConstants.USER_ALL_RIGHTS);
		request.getSession().removeAttribute(WebConstants.USER_OP_RIGHTS);
		request.getSession().removeAttribute(WebConstants.USER_OP_FUNCTIONS);
		request.getSession().removeAttribute(WebConstants.USER_OP_ACTIVE);
		request.getSession().removeAttribute(WebConstants.USER_OP_PARENT_ACTIVE);

		Subject currentUser = SecurityUtils.getSubject();
		if (currentUser != null) {
			currentUser.logout();
		}
		return redirect("/");
	}

	/**
	 * 登录验证
	 * 
	 * @param username
	 *            用户名
	 * @param pwd
	 *            密码
	 * @param code
	 *            验证码,暂时没用
	 * @return
	 */
	private HashMap<String, String> validate(HttpSession session, String username, String pwd) {
		HashMap<String, String> rtnMap = new HashMap<String, String>();
		String encryptpassword = null;
		try {
			encryptpassword = com.dw.uitl.MD5.encrypt(pwd).toUpperCase();
		} catch (Exception e) {
			encryptpassword = "";
			logger.error(e.toString());
			throw new RuntimeException(e);
		}

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("i_username", username);
		params.put("i_password", encryptpassword);

		int o_result = -1;
		int o_userid = -1;
		String message = "";
		try {
			// 数据库登录验证
			userDao.loginValidate(params);
			o_result = NumberUtils.toInt(params.get("o_result").toString());
			if (params.get("o_userid") != null) {// 出现登陆验证不通过时，存储过程没有给o_userid赋值
				o_userid = NumberUtils.toInt(params.get("o_userid").toString());
			}

			if (o_result == WebConstants.LONIN_STATUS_SUCCESS) {
				if (userDao.hasMenu(o_userid) > 0) {// 判断是否有菜单
					OperatorToken aot = new OperatorToken(username, encryptpassword, o_userid, null);
					User user = new User();
					user.setUserid(o_userid);
					operatorService.initOperInfoDetail(user, aot);
					operatorService.initOperRight(user, aot);
					Subject currentUser = SecurityUtils.getSubject();
					currentUser.login(aot); // 登录验证还是由应用本身代码完成,shiro只是提供principl的保持
					setSession(session, aot, rtnMap);
					logger.info("login success!!");
				} else {
					message = "登录失败;用户没有任何权限";
					o_result = WebConstants.LONIN_STATUS_NOMENU;
				}
			} else if (o_result == WebConstants.LONIN_STATUS_NOBODY) { // 无效的账号
				message = "登录失败;用户或密码错误";
			} else if (o_result == WebConstants.LONIN_STATUS_PWDERROR) { // 密码错误
				message = "登录失败;用户或密码错误";
			} else if (o_result == WebConstants.LONIN_STATUS_LOCKED) { // 用户被锁定
				message = "登录失败;用户被锁定";
			} else if (o_result == WebConstants.LONIN_STATUS_DBFAILD) { // 数据库操作失败
				message = "登录失败;系统繁忙,请稍候再试";
			}

		} catch (Exception ex) {
			logger.error(ex.toString());
			o_result = WebConstants.LONIN_STATUS_DBFAILD;// 数据库异常
			message = "登录失败;系统繁忙,请稍候再试";
		}
		rtnMap.put("code", String.valueOf(o_result));
		rtnMap.put("message", message);
		return rtnMap;
	}

	/**
	 * set session
	 * 
	 * @param aot
	 *            token
	 * @param rtnMap
	 */
	@SuppressWarnings("unchecked")
	private void setSession(HttpSession session, OperatorToken aot, HashMap<String, String> rtnMap) {
		HashMap<String, Object> principalMap = (HashMap<String, Object>) aot.getPrincipal();
		session.setAttribute(WebConstants.USER_OP_RIGHTS, principalMap.get(WebConstants.USER_OP_RIGHTS)); // 菜单权限
		session.setAttribute(WebConstants.USER_OP_FUNCTIONS, principalMap.get(WebConstants.USER_OP_FUNCTIONS)); // 功能权限
		List<Right> rightGroup = (List<Right>) principalMap.get(WebConstants.USER_ALL_RIGHTS);// 所有权限
		session.setAttribute(WebConstants.USER_OP_ACTIVE, -9999);// 当前选中
		session.setAttribute(WebConstants.USER_OP_PARENT_ACTIVE, -9999);// 父级选中
		session.setAttribute(WebConstants.USERINFO, aot);// 父级选中

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", aot.getUserid());
		session.setAttribute(WebConstants.USER, userDao.queryUserById(params));// user信息
		for (Right right : rightGroup) {
			if (right.getShowtype() == 1) {
				session.setAttribute(WebConstants.USER_OP_ACTIVE, right.getRightid());
				aot.setPrincipal(WebConstants.USER_HOME_PAGE, right.getUrl());
				rtnMap.put(WebConstants.USER_HOME_PAGE, right.getUrl());
				break;
			}
		}
	}
}
