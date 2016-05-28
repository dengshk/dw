package com.dw.web.model;

public class QueryBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String queryTime;// 查询时间段
	private Integer customerId;// 顾客姓名
	private String customerName;// 顾客姓名
	private Integer customerLevel;// 顾客等级
	private String productName;// 产品名称

	private Integer typeId;// 产品类型ID
	private Integer nums;// 库存数量

	public String getQueryTime() {
		return queryTime;
	}

	public void setQueryTime(String queryTime) {
		this.queryTime = queryTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/**
	 * @return the typeId
	 */
	public Integer getTypeId() {
		return typeId;
	}

	/**
	 * @param typeId
	 *            the typeId to set
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	/**
	 * @return the nums
	 */
	public Integer getNums() {
		return nums;
	}

	/**
	 * @param nums
	 *            the nums to set
	 */
	public void setNums(Integer nums) {
		this.nums = nums;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}

	public Integer getCustomerLevel() {
		return customerLevel;
	}

	public void setCustomerLevel(Integer customerLevel) {
		this.customerLevel = customerLevel;
	}

}
