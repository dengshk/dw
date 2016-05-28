package com.dw.web.action.record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dw.support.PageBean;
import com.dw.web.model.ProOrderLog;
import com.dw.web.model.Product;
import com.dw.web.model.ProductType;
import com.dw.web.model.QueryBean;
import com.dw.web.model.User;
import com.dw.web.service.record.ProOrderLogService;
import com.dw.web.service.record.ProductService;
import com.dw.web.utils.TimeUtils;
import com.dw.web.utils.WebConstants;

@Controller
@RequestMapping("/proSelf")
public class ProSelfAction {
	private static final Logger logger = LoggerFactory.getLogger(ProSelfAction.class);

	@Autowired
	private ProductService productService;
	@Autowired
	ProOrderLogService proOrderLogService;

	@RequestMapping(value = "/proSelf")
	public ModelAndView proSelf(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/proSelf/proSelf");
		Map<String, Object> params = new HashMap<String, Object>();
		// 获取用户信息
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(WebConstants.USER);
		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? 50 : pageSize);
		// 时间条件
		if (bean != null && bean.getQueryTime() != null && !bean.getQueryTime().equals("")) {
			Map<String, String> time = TimeUtils.getSETime(bean.getQueryTime());
			params.put("starttime", time.get("starttime") + " 00:00:00");
			params.put("endtime", time.get("endtime") + " 23:59:59");
		}
		// 产品类型
		if (bean.getTypeId() != null && bean.getTypeId() != -1) {
			params.put("typeId", bean.getTypeId());
		}
		// 产品名称
		if (bean.getProductName() != null && !bean.getProductName().equals("")) {
			params.put("productName", bean.getProductName());
		}
		// 销售类型
		params.put("type", 2);
		// 流水号
		params.put("flowId", user.getUserid());
		// 查询页面数据
		PageBean page = proOrderLogService.queryPage(params);
		// 产品类型查询
		List<ProductType> productTypes = productService.queryProductTypes(null);
		// 总计
		Map<String, Object> flowTotal = proOrderLogService.queryFlowIdTotal(params);

		mv.addObject("productTypes", productTypes);
		mv.addObject("flowTotal", flowTotal);
		mv.addObject("bean", bean);
		mv.addObject("page", page);
		return mv;
	}

	@RequestMapping(value = "/child")
	public ModelAndView child(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("/proSelf/child");
		List<Product> products = productService.queryAll();
		mv.addObject("products", products);
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			ProOrderLog proOrderLog = proOrderLogService.queryById(params);
			mv.addObject("saleOrder", proOrderLog);
		} else {
			mv.addObject("saleOrder", null);
		}

		return mv;
	}

	/**
	 * 修改或者新添
	 * 
	 * @param ProOrderLog
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveOrder")
	public @ResponseBody
	Map<String, Integer> saveOrder(@ModelAttribute ProOrderLog proOrderLog, HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> productParams = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		// 通过产品名称查询产品信息
		productParams.put("name", proOrderLog.getProductName());
		Product product = productService.queryByName(productParams);
		if (product != null) {
			proOrderLog.setTypeId(product.getTypeId());
			proOrderLog.setProductId(product.getId());

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String time = df.format(new Date());
			proOrderLog.setCreateTime(time);
			proOrderLog.setModifyTime(time);
			proOrderLog.setOrderDate(time);
			params.put("proOrderLog", proOrderLog);
			// 判断是添加还是修改
			if (proOrderLog.getId() != null && !proOrderLog.getId().equals("")) {
				// 修改
				num = proOrderLogService.updOne(params);
			} else {
				// 添加
				num = proOrderLogService.addOne(params);
			}
		} else {
			num = 0;
		}

		re.put("msg", num);
		return re;
	}

	/**
	 * 删除一笔订单
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/deleteOneOrder")
	public @ResponseBody
	Map<String, Object> deleteOneOrder(HttpServletRequest request, String id, String flowId) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = proOrderLogService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}
}
