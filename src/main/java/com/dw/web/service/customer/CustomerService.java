package com.dw.web.service.customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.support.PageBean;
import com.dw.web.dao.customer.CustomerDao;
import com.dw.web.model.CustomerInfo;
import com.dw.web.service.commManager.BaseService;

@Service("customerService")
public class CustomerService extends BaseService {

	private static Logger logger = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;

	/**
	 * 分页查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public PageBean queryCustomer(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(CustomerDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public CustomerInfo queryById(Map<String, Object> params) {
		try {
			CustomerInfo customerInfo = customerDao.queryById(params);
			return customerInfo;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public CustomerInfo queryByName(Map<String, Object> params) {
		try {
			CustomerInfo customerInfo = customerDao.queryByName(params);
			return customerInfo;
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
			re = customerDao.deleteOne(params);
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
			re = customerDao.addOne(params);
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
			re = customerDao.updOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
	
	public List<CustomerInfo> searchCustomersByName(String customerName){
		List<CustomerInfo> list = new ArrayList<CustomerInfo>();
		Map<String ,Object> param = new HashMap<String ,Object>();
		param.put("customerName", customerName);
		list = customerDao.searchCustomersByName(param);
		return list;
	}
	
	public List<CustomerInfo> searchCustomersById(Integer customerId){
		try {
			List<CustomerInfo> list = new ArrayList<CustomerInfo>();
			list = customerDao.searchCustomersById(customerId);
			return list;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
}
