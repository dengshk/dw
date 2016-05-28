/**     
 * @文件名称: SaleInfo.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年4月20日 下午3:56:38  
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
 * @创建时间：2016年4月20日 下午3:56:38
 * @版本：V1.0
 */
public class ProSaleInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String flowId;
	private Integer state;
	private Integer pay;
	private Integer customerId;
	private String customerName;
	private String customerTel;
	private String address;
	private Integer type;
	private String express;
	private String expressNo;
	private String expressPrice;
	private Integer saleNum;
	private String tatalCost;
	private String originPay;
	private String reallyPay;
	private String profit;
	private String orderDate;
	private String saleDate;
	private String createTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFlowId() {
		return flowId;
	}

	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getPay() {
		return pay;
	}

	public void setPay(Integer pay) {
		this.pay = pay;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerTel() {
		return customerTel;
	}

	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	public String getExpressPrice() {
		return expressPrice;
	}

	public void setExpressPrice(String expressPrice) {
		this.expressPrice = expressPrice;
	}

	public String getTatalCost() {
		return tatalCost;
	}

	public void setTatalCost(String tatalCost) {
		this.tatalCost = tatalCost;
	}

	public String getOriginPay() {
		return originPay;
	}

	public void setOriginPay(String originPay) {
		this.originPay = originPay;
	}

	public String getReallyPay() {
		return reallyPay;
	}

	public void setReallyPay(String reallyPay) {
		this.reallyPay = reallyPay;
	}

	public String getProfit() {
		return profit;
	}

	public void setProfit(String profit) {
		this.profit = profit;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	/**
	 * @return the customerId
	 */
	public Integer getCustomerId() {
		return customerId;
	}

	/**
	 * @param customerId the customerId to set
	 */
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getSaleNum() {
		return saleNum;
	}

	public void setSaleNum(Integer saleNum) {
		this.saleNum = saleNum;
	}

}
