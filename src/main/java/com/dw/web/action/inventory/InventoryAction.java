package com.dw.web.action.inventory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dw.support.PageBean;
import com.dw.web.model.ProductType;
import com.dw.web.model.QueryBean;
import com.dw.web.service.record.ProductService;

@Controller
@RequestMapping("/inventory")
public class InventoryAction {

	@Autowired
	private ProductService productService;

	private static Logger logger = LoggerFactory.getLogger(InventoryAction.class);

	@RequestMapping(value = "/inventory")
	public ModelAndView fetchPage(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/inventory/inventory");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		if (bean.getTypeId() != null && bean.getTypeId() != -1) {
			params.put("typeId", bean.getTypeId());
		}
		if (bean.getNums() != null && bean.getNums() >= 0) {
			params.put("nums", bean.getNums());
		}
		if (bean.getProductName() != null && !bean.getProductName().equals("")) {
			params.put("name", bean.getProductName());
		}
		PageBean page = productService.queryProduct(params);
		List<ProductType> productTypes = productService.queryProductTypes(null);
		mv.addObject("productTypes", productTypes);
		mv.addObject("page", page);
		mv.addObject("bean", bean);
		return mv;
	}

}
