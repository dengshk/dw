/**     
 * @文件名称: ProStockInfo.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年5月12日 上午10:27:24  
 * @版本：V1.0     
 */
package com.dw.web.model;

/**
 * @类功能说明：
 * @类修改者：
 * @修改日期：
 * @修改说明：
 * @公司名称：
 * @作者：dsk
 * @创建时间：2016年5月12日 上午10:27:24
 * @版本：V1.0
 */
public class ProStockInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String flowId;
	private String reallyPay;
	private Integer stockNum;
	private String subtotalCost;
	private String express;
	private String expressNo;
	private String expressPrice;
	private String stockDate;
	private String modifyTime;
	private String createTime;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the flowId
	 */
	public String getFlowId() {
		return flowId;
	}

	/**
	 * @param flowId
	 *            the flowId to set
	 */
	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	/**
	 * @return the reallyPay
	 */
	public String getReallyPay() {
		return reallyPay;
	}

	/**
	 * @param reallyPay
	 *            the reallyPay to set
	 */
	public void setReallyPay(String reallyPay) {
		this.reallyPay = reallyPay;
	}

	/**
	 * @return the stockNum
	 */
	public Integer getStockNum() {
		return stockNum;
	}

	/**
	 * @param stockNum
	 *            the stockNum to set
	 */
	public void setStockNum(Integer stockNum) {
		this.stockNum = stockNum;
	}

	/**
	 * @return the express
	 */
	public String getExpress() {
		return express;
	}

	/**
	 * @param express
	 *            the express to set
	 */
	public void setExpress(String express) {
		this.express = express;
	}

	/**
	 * @return the expressNo
	 */
	public String getExpressNo() {
		return expressNo;
	}

	/**
	 * @param expressNo
	 *            the expressNo to set
	 */
	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	/**
	 * @return the expressPrice
	 */
	public String getExpressPrice() {
		return expressPrice;
	}

	/**
	 * @param expressPrice
	 *            the expressPrice to set
	 */
	public void setExpressPrice(String expressPrice) {
		this.expressPrice = expressPrice;
	}

	/**
	 * @return the stockDate
	 */
	public String getStockDate() {
		return stockDate;
	}

	/**
	 * @param stockDate
	 *            the stockDate to set
	 */
	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}

	/**
	 * @return the createTime
	 */
	public String getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 *            the createTime to set
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

	/**
	 * @return the subtotalCost
	 */
	public String getSubtotalCost() {
		return subtotalCost;
	}

	/**
	 * @param subtotalCost the subtotalCost to set
	 */
	public void setSubtotalCost(String subtotalCost) {
		this.subtotalCost = subtotalCost;
	}

}
