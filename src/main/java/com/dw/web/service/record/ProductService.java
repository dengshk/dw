package com.dw.web.service.record;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dw.support.PageBean;
import com.dw.web.dao.record.ProductDao;
import com.dw.web.model.Product;
import com.dw.web.model.ProductType;
import com.dw.web.service.commManager.BaseService;

@Service("productService")
public class ProductService extends BaseService {

	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Autowired
	private ProductDao productDao;

	/**
	 * 分页查询信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public PageBean queryProduct(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProductDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 查询产品分类
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public List<ProductType> queryProductTypes(Map<String, Object> params) {
		try {
			List<ProductType> productTyps = productDao.queryProductTypes(params);
			return productTyps;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 查询信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public Product queryById(Map<String, Object> params) {
		try {
			Product product = productDao.queryById(params);
			return product;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 查询信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public Product queryByName(Map<String, Object> params) {
		try {
			Product product = productDao.queryByName(params);
			return product;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 修改状态
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer changeState(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = productDao.updState(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
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
			re = productDao.deleteOne(params);
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
			re = productDao.addOne(params);
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
			re = productDao.updOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	public List<Map<String, Object>> queryInventoryByCondition(Map<String, Object> params) {
		try {
			List<Map<String, Object>> products = productDao.queryInventoryByCondition(params);
			return products;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	public List<Product> queryAll() {
		try {
			List<Product> products = productDao.queryAll();
			return products;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 
	* 功能说明: 更新库存
	* 修改者名字: dsk
	* 修改日期 2016年5月6日
	* 修改内容 
	* @参数： @param params
	* @参数： @return   
	* @throws
	 */
	public Integer updInventory(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = productDao.updInventory(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
	
	/**
	 * 
	* 功能说明: 查询库存量
	* 修改者名字: dsk
	* 修改日期 2016年5月6日
	* 修改内容 
	* @参数： @param params
	* @参数： @return   
	* @throws
	 */
	public Integer queryInventory(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = productDao.queryInventory(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
}
