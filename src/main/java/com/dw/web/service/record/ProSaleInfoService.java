package com.dw.web.service.record;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.support.PageBean;
import com.dw.web.dao.record.ProSaleInfoDao;
import com.dw.web.model.ProSaleInfo;
import com.dw.web.model.QueryBean;
import com.dw.web.service.commManager.BaseService;
import com.dw.web.utils.ExportUtils;
import com.dw.web.utils.TimeUtils;

@Service("proSaleService")
public class ProSaleInfoService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleInfoService.class);
	@Autowired
	public ProSaleInfoDao dao;

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public PageBean queryPage(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProSaleInfoDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	public ProSaleInfo queryById(Map<String, Object> params) {
		try {
			ProSaleInfo proSaleInfo = dao.queryById(params);
			return proSaleInfo;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	public ProSaleInfo queryByName(Map<String, Object> params) {
		try {
			ProSaleInfo proSaleInfo = dao.queryByName(params);
			return proSaleInfo;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	public Integer updSaleInfoValue(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.updSaleInfoValue(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 添加
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer addOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.addOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 修改
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer updOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.updOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 更新销售数据
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public void updSaleInfoData(){
		try {
			dao.updSaleInfoData();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
	/**
	 * 删除
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer deleteOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.deleteOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	public String createExport(HttpServletRequest request, QueryBean bean) throws Exception {
		Map<String,Object> params = new HashMap<String,Object>();
		// 订货人
		params.put("customerName", (bean.getCustomerName() == null || bean.getCustomerName().equals("") ? null : bean.getCustomerName()));
		// 时间条件
		if (bean != null && bean.getQueryTime() != null && !bean.getQueryTime().equals("")) {
			Map<String, String> time = TimeUtils.getSETime(bean.getQueryTime());
			params.put("starttime", time.get("starttime") + " 00:00:00");
			params.put("endtime", time.get("endtime") + " 23:59:59");
		}
		
		List<Map<String, Object>> list = dao.query4Export(params);
		List<Object> titleName = new ArrayList<Object>();
		List<String> columnName = new ArrayList<String>();
		List<Integer> type = new ArrayList<Integer>();
		String[] tn = { "订单号", "订单日期", "订货人", "产品名称", "销售数量", "进货单价", "销售单价", "应收款小计", "利润小计" };
		String[] cn = { "flowId", "orderDate", "customerName", "productName", "orderNum", "costPrice", "salePrice", "originPay", "profit" };
		Integer[] tp = { 1, 1, 1, 1, 2, 2, 2, 2, 2 };
		for (int i = 0; i < cn.length; i++) {
			titleName.add(tn[i]);
			columnName.add(cn[i]);
			type.add(tp[i]);
		}
		List<String> sheetName = new ArrayList<String>();
		sheetName.add("销售记录");
		List<String> sheetColumn = new ArrayList<String>();
		sheetColumn.add("saleInfo");
		Map<String, Object> tln = new HashMap<String, Object>();
		tln.put("saleInfo", titleName);
		Map<String, Object> col = new HashMap<String, Object>();
		col.put("saleInfo", columnName);
		Map<String, Object> types = new HashMap<String, Object>();
		types.put("saleInfo", type);
		Map<String, Object> lt = new HashMap<String, Object>();
		lt.put("saleInfo", list);
		String fileName = ExportUtils.createExcel(request, sheetName, sheetColumn, tln, col, types, lt);
		return fileName;
	}
}
