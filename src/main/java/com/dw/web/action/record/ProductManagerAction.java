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

import com.dw.support.PageBean;
import com.dw.web.model.CustomerInfo;
import com.dw.web.model.Product;
import com.dw.web.model.ProductType;
import com.dw.web.model.QueryBean;
import com.dw.web.service.record.ProductService;

@Controller
@RequestMapping("/record")
public class ProductManagerAction {

	@Autowired
	private ProductService productService;

	private static Logger logger = LoggerFactory.getLogger(ProductManagerAction.class);

	@RequestMapping(value = "/newProduct")
	public ModelAndView proManagerPage(QueryBean bean, HttpServletRequest request, Integer pageIndex, Integer pageSize) {
		ModelAndView mv = new ModelAndView("/record/newProduct");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		if (bean.getTypeId() != null && bean.getTypeId() != -1) {
			params.put("typeId", bean.getTypeId());
		}
		if (bean.getProductName() != null && !bean.getProductName().equals("")) {
			params.put("name", bean.getProductName());
		}
		PageBean page = productService.queryProduct(params);
		mv.addObject("page", page);

		List<ProductType> productTypes = productService.queryProductTypes(null);
		mv.addObject("productTypes", productTypes);
		
		mv.addObject("bean", bean);

		return mv;
	}

	/**
	 * 进入用户编辑页面
	 * 
	 * @param request
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/editProduct")
	public ModelAndView editUser(HttpServletRequest request, Integer id) {
		ModelAndView mv = new ModelAndView("/record/editProduct");
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			Product product = productService.queryById(params);
			mv.addObject("product", product);
		} else {
			mv.addObject("product", null);
		}

		List<ProductType> productTypes = productService.queryProductTypes(null);
		mv.addObject("productTypes", productTypes);
		return mv;
	}

	/**
	 * 修改用户启用状态
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/changeState")
	public @ResponseBody
	Map<String, Integer> changeUserState(@ModelAttribute Product product, HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		params.put("state", product.getState());
		// 判断是添加还是修改
		params.put("id", product.getId());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		params.put("modifyDate", time);
		num = productService.changeState(params);
		re.put("msg", num);
		return re;
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteProduct")
	public @ResponseBody
	Map<String, Object> deleteProduct(HttpServletRequest request, Integer id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = productService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	/**
	 * 修改或者新添用户
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveProduct")
	public @ResponseBody
	Map<String, Object> saveProduct(@ModelAttribute Product product, HttpServletRequest request) {
		Map<String, Object> re = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, Object> queryName = new HashMap<String, Object>();
		Integer num = -1;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		product.setCreateTime(time);
		product.setModifyTime(time);
		params.put("product", product);
		// 判断是添加还是修改
		if (product.getId() != null) {
			// 修改
			num = productService.updOne(params);
		} else {
			// 添加
			// 查询产品名称是否已存在
			queryName.put("name", product.getName());
			Product p = productService.queryByName(queryName);
			if (p != null && p.getName() != null) {
				re.put("info", "已存在该产品");
			} else {
				num = productService.addOne(params);
			}
		}
		re.put("msg", num);
		return re;
	}

	/**
	 * 
	 * 功能说明: 根据ID查询产品 修改者名字: dsk 修改日期 2016年5月9日 修改内容
	 * 
	 * @参数： @param request
	 * @参数： @param customerName
	 * @参数： @return
	 * @throws
	 */
	@RequestMapping(value = "/queryByID")
	public @ResponseBody
	Map<String, Object> queryByID(HttpServletRequest request, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		Product product = productService.queryById(params);
		map.put("product", product);
		return map;
	}
}
