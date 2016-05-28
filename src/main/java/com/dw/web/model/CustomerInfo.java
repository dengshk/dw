/**     
 * @文件名称: CustomerInfo.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年4月28日 下午2:13:01  
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
 * @创建时间：2016年4月28日 下午2:13:01
 * @版本：V1.0
 */
public class CustomerInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer id;
	private String customerName;
	private String customerTel;
	private Integer customerLevel;
	private String customerLevelName;
	private String address;
	private String modifyTime;
	private String createTime;
	private String totalOrder;
	private String totalCost;

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
	 * @return the customerName
	 */
	public String getCustomerName() {
		return customerName;
	}

	/**
	 * @param customerName
	 *            the customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/**
	 * @return the customerTel
	 */
	public String getCustomerTel() {
		return customerTel;
	}

	/**
	 * @param customerTel
	 *            the customerTel to set
	 */
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the modifyTime
	 */
	public String getModifyTime() {
		return modifyTime;
	}

	/**
	 * @param modifyTime
	 *            the modifyTime to set
	 */
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
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

	public String getTotalOrder() {
		return totalOrder;
	}

	public void setTotalOrder(String totalOrder) {
		this.totalOrder = totalOrder;
	}

	public String getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}

	/**
	 * @return the customerLevel
	 */
	public Integer getCustomerLevel() {
		return customerLevel;
	}

	/**
	 * @param customerLevel the customerLevel to set
	 */
	public void setCustomerLevel(Integer customerLevel) {
		this.customerLevel = customerLevel;
	}

	/**
	 * @return the customerLevelName
	 */
	public String getCustomerLevelName() {
		return customerLevelName;
	}

	/**
	 * @param customerLevelName the customerLevelName to set
	 */
	public void setCustomerLevelName(String customerLevelName) {
		this.customerLevelName = customerLevelName;
	}

}
