package com.dw.web.model;

public class ProOrderLog implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String flowId;
	private Integer typeId;
	private String typeName;
	private Integer productId;
	private String productName;
	private String costPrice;
	private String salePrice;
	private String orderNum;
	private Integer type;
	private String orderDate;
	private String modifyTime;
	private String createTime;
	private String subtotalCost;// 成本小计
	private String subtotalReally;// 应收款小计
	private String subtotalProfit;// 利润小计

	/**
	 * @return the subtotalCost
	 */
	public String getSubtotalCost() {
		return subtotalCost;
	}

	/**
	 * @param subtotalCost
	 *            the subtotalCost to set
	 */
	public void setSubtotalCost(String subtotalCost) {
		this.subtotalCost = subtotalCost;
	}

	/**
	 * @return the subtotalReally
	 */
	public String getSubtotalReally() {
		return subtotalReally;
	}

	/**
	 * @param subtotalReally
	 *            the subtotalReally to set
	 */
	public void setSubtotalReally(String subtotalReally) {
		this.subtotalReally = subtotalReally;
	}

	/**
	 * @return the subtotalProfit
	 */
	public String getSubtotalProfit() {
		return subtotalProfit;
	}

	/**
	 * @param subtotalProfit
	 *            the subtotalProfit to set
	 */
	public void setSubtotalProfit(String subtotalProfit) {
		this.subtotalProfit = subtotalProfit;
	}

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

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(String costPrice) {
		this.costPrice = costPrice;
	}

	public String getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}

}
