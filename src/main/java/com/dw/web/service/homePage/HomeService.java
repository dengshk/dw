package com.dw.web.service.homePage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.web.dao.homePage.HomeDao;

@Service("homeService")
public class HomeService {

	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);

	@Autowired
	HomeDao dao;

	public Map<String, Object> getChartsInfo(String uuid, String userId) {
		Map<String, Object> params1 = new HashMap<String, Object>();
		Map<String, Object> params2 = new HashMap<String, Object>();

		Map<String, Object> reMap = new HashMap<String, Object>();// 返回结果
		List<String> xAxisData = new ArrayList<String>();// 时间
		List<String> serDayIncome = new ArrayList<String>();// 单日收入
		List<String> serDayProfit = new ArrayList<String>();// 当日盈利
		List<String> serDayExpend = new ArrayList<String>();// 当日支出
		Map<String, List<String>> saleTop = new HashMap<String, List<String>>();// 热销产品

		List<Map<String, Object>> pieDayExpend = new ArrayList<Map<String, Object>>();// 饼图日支出分布
		try {
			// 执行存储过程
			params1.put("uuid", uuid);
			params1.put("userId", userId);
			dao.kpiAnalysis(params1);
			// 查询数据
			params2.put("qryUuid", uuid);
			List<Map<String, Object>> queryMap = dao.queryDefaultSize(params2);
			for (Map<String, Object> map : queryMap) {
				xAxisData.add(map.get("calTime") + "");
				serDayIncome.add(map.get("dayIncome") + "");
				serDayProfit.add(map.get("dayProfit") + "");
				serDayExpend.add(map.get("dayExpend") + "");
				// 饼图数据
				Map<String, Object> pieDetail = new HashMap<String, Object>();// 饼图支出明细
				pieDetail.put("cost", map.get("dayCost"));// 进货
				pieDetail.put("self", map.get("daySelf"));// 自销
				pieDetail.put("express", map.get("dayExpress"));// 邮费
				pieDayExpend.add(pieDetail);
			}
			// 热销产品
			List<Map<String, Object>> queryMapSaleTop = dao.querySaleTop(null);
			List<String> productNameList = new ArrayList<String>();// 产品名称
			List<String> saleNumList = new ArrayList<String>();// 销售数量
			for (Map<String, Object> map : queryMapSaleTop) {
				productNameList.add(map.get("productName") + "");
				saleNumList.add(map.get("saleNum") + "");
			}
			saleTop.put("productName", productNameList);
			saleTop.put("saleNum", saleNumList);
		} catch (Exception e) {
			logger.error("query infomation homePage", e);
		}
		reMap.put("xAxisData", xAxisData);
		reMap.put("serDayIncome", serDayIncome);
		reMap.put("serDayProfit", serDayProfit);
		reMap.put("serDayExpend", serDayExpend);
		reMap.put("pieDayExpend", pieDayExpend);
		reMap.put("saleTop", saleTop);
		return reMap;
	}

	public Map<String, Object> getTotalStatus(Map<String, Object> params) {
		Map<String, Object> reMap = new HashMap<String, Object>();// 返回结果
		try {
			reMap = dao.queryTotalStatus(params);
		} catch (Exception e) {
			logger.error("query infomation homePage", e);
		}
		return reMap;
	}

}
