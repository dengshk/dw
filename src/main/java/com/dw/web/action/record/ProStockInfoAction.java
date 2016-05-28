package com.dw.web.action.record;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.dw.web.model.ProStockInfo;
import com.dw.web.model.Product;
import com.dw.web.model.QueryBean;
import com.dw.web.service.record.ProOrderLogService;
import com.dw.web.service.record.ProStockInfoService;
import com.dw.web.service.record.ProductService;
import com.dw.web.utils.StringUtils;
import com.dw.web.utils.TimeUtils;
import com.dw.web.utils.WebConstants;

@Controller
@RequestMapping("/proStock")
public class ProStockInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoAction.class);

	@Autowired
	protected ProStockInfoService proStockInfoService;
	@Autowired
	protected ProOrderLogService proOrderLogService;
	@Autowired
	protected ProductService productService;

	@RequestMapping(value = "/proStock")
	public ModelAndView proStock(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/proStock/proStockInfo");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		// 时间条件
		if (bean != null && bean.getQueryTime() != null && !bean.getQueryTime().equals("")) {
			Map<String, String> time = TimeUtils.getSETime(bean.getQueryTime());
			params.put("starttime", time.get("starttime") + " 00:00:00");
			params.put("endtime", time.get("endtime") + " 23:59:59");
		}

		PageBean page = proStockInfoService.queryPage(params);

		mv.addObject("bean", bean);
		mv.addObject("page", page);
		return mv;
	}

	@RequestMapping(value = "/flowInfo")
	public ModelAndView flowInfo(String flowId, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/proStock/proStockFlow");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? 50 : pageSize);
		params.put("flowId", flowId);

		// 流水ID(新增/修改)
		if (flowId == null || flowId.equals("")) {
			mv.addObject("proStockInfo", null);
			mv.addObject("page", null);
		} else {
			ProStockInfo proStockInfo = proStockInfoService.queryByFlowId(flowId);
			PageBean page = proOrderLogService.queryPage(params);

			//查询订单总计
			params.put("type", 1);
			Map<String, Object> flowTotal = proOrderLogService.queryFlowIdTotal(params);
			
			mv.addObject("proStockInfo", proStockInfo);
			mv.addObject("flowTotal", flowTotal);
			mv.addObject("page", page);
		}

		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteOne")
	public @ResponseBody
	Map<String, Object> deleteProduct(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("flowId", id);
		Integer re = proOrderLogService.deleteFlowId(params);
		re = proStockInfoService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/saveStockInfo")
	public @ResponseBody
	Map<String, Object> saveStockInfo(@ModelAttribute ProStockInfo proStockInfo, HttpServletRequest request) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer re = -1;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		proStockInfo.setCreateTime(time);
		proStockInfo.setModifyTime(time);
		params.put("proStockInfo", proStockInfo);
		// 进货日期为空,则为当天
		if (proStockInfo.getStockDate() == null || "".equals(proStockInfo.getStockDate())) {
			proStockInfo.setStockDate(time);
		}
		// 运费及其他
		if (proStockInfo.getExpressPrice() == null || "".equals(proStockInfo.getExpressPrice())) {
			proStockInfo.setExpressPrice(null);
		}
		// 判断是添加还是修改
		if (proStockInfo.getFlowId() != null && !proStockInfo.getFlowId().equals("")) {
			// 修改
			re = proStockInfoService.updOne(params);
		} else {
			// 流水号生成
			proStockInfo.setFlowId(StringUtils.getFlowId());
			// 添加
			re = proStockInfoService.addOne(params);
		}
		msg.put("flowId", proStockInfo.getFlowId());
		msg.put("msg", re);
		return msg;
	}

	@RequestMapping(value = "/editStockOrder")
	public ModelAndView editUser(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("/proStock/child");
		List<Product> products = productService.queryAll();
		mv.addObject("products", products);
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			ProOrderLog proOrderLog = proOrderLogService.queryById(params);
			mv.addObject("stockOrder", proOrderLog);
		} else {
			mv.addObject("stockOrder", null);
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
			// 更新订单数据
			proStockInfoService.updOrderData(proOrderLog.getFlowId());
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
	Map<String, Object> deleteOneOrder(HttpServletRequest request, String id,String flowId) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = proOrderLogService.deleteOne(params);
		// 更新订单数据
		proStockInfoService.updOrderData(flowId);
		msg.put("msg", re);
		return msg;
	}
}
