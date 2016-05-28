package com.dw.web.service.record;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.support.PageBean;
import com.dw.web.dao.record.ProStockInfoDao;
import com.dw.web.model.ProStockInfo;
import com.dw.web.service.commManager.BaseService;

@Service("proStockInfoService")
public class ProStockInfoService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoService.class);
	@Autowired
	public ProStockInfoDao proStockInfoDao;

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public PageBean queryPage(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProStockInfoDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
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
			re = proStockInfoDao.deleteOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 根据流水号查询
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public ProStockInfo queryByFlowId(String flowId) {
		try {
			ProStockInfo proStockInfo = proStockInfoDao.queryByFlowId(flowId);
			return proStockInfo;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
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
			re = proStockInfoDao.addOne(params);
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
			re = proStockInfoDao.updOne(params);
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
	public void updOrderData(String flowId) {
		try {
			proStockInfoDao.updOrderData(flowId);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}
}
