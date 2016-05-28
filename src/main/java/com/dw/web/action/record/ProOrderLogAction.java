package com.dw.web.action.record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dw.web.model.ProOrderLog;
import com.dw.web.model.Product;
import com.dw.web.service.record.ProOrderLogService;
import com.dw.web.service.record.ProductService;

@Controller
@RequestMapping("/proOrderLog")
public class ProOrderLogAction {
	private static final Logger logger = LoggerFactory.getLogger(ProOrderLogAction.class);

	@Autowired
	ProductService productService;
	@Autowired
	ProOrderLogService proOrderLogService;

	@RequestMapping(value = "/deleteOne")
	public @ResponseBody
	Map<String, Object> deleteOne(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = proOrderLogService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	@RequestMapping(value = "/editSaleOrder")
	public ModelAndView editUser(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfoChildChild");
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
	Map<String, Integer> saveProduct(@ModelAttribute ProOrderLog proOrderLog, HttpServletRequest request) {
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
}
