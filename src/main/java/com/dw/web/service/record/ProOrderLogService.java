package com.dw.web.service.record;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dw.support.PageBean;
import com.dw.web.dao.record.ProOrderLogDao;
import com.dw.web.model.ProOrderLog;
import com.dw.web.service.commManager.BaseService;

@Service("proOrderLogService")
public class ProOrderLogService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProOrderLogService.class);
	@Autowired
	public ProOrderLogDao dao;

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public PageBean queryPage(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProOrderLogDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	public ProOrderLog queryById(Map<String, Object> params) {
		try {
			ProOrderLog proOrderLog = dao.queryById(params);
			return proOrderLog;
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
	@Transactional
	public Integer deleteOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.deleteOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
	
	public Integer deleteFlowId(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = dao.deleteFlowId(params);
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
	 * 
	* 功能说明: 返回一条流水的总计
	* 修改者名字: dsk
	* 修改日期 2016年5月9日
	* 修改内容 
	* @参数： @return   
	* @throws
	 */
	public Map<String,Object> queryFlowIdTotal(Map<String, Object> params){
		try {
			Map<String,Object> flowTotal = dao.queryFlowIdTotal(params);
			return flowTotal;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
}
