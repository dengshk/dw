/**     
 * @文件名称: Product.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年4月18日 下午3:44:18  
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
 * @创建时间：2016年4月18日 下午3:44:18
 * @版本：V1.0
 */
public class Product implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private String describe;
	private Integer typeId;
	private String typeName;
	private Integer state;
	private String agent1Price;
	private String agent2Price;
	private String agent3Price;
	private String agent4Price;
	private Integer agent1Num;
	private Integer agent2Num;
	private Integer agent3Num;
	private Integer agent4Num;
	private Integer nums;
	private Integer accNums;

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

	/**
	 * @return the accNums
	 */
	public Integer getAccNums() {
		return accNums;
	}

	/**
	 * @param accNums
	 *            the accNums to set
	 */
	public void setAccNums(Integer accNums) {
		this.accNums = accNums;
	}

	private String salePrice;
	private Integer grammage;
	private Integer expiration;
	private String brand;
	private String place;
	private String taste;
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}

	/**
	 * @param describe
	 *            the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
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
	 * @return the typeName
	 */
	public String getTypeName() {
		return typeName;
	}

	/**
	 * @param typeName
	 *            the typeName to set
	 */
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
	 * @return the state
	 */
	public Integer getState() {
		return state;
	}

	/**
	 * @param state
	 *            the state to set
	 */
	public void setState(Integer state) {
		this.state = state;
	}

	/**
	 * @return the agent1Price
	 */
	public String getAgent1Price() {
		return agent1Price;
	}

	/**
	 * @param agent1Price
	 *            the agent1Price to set
	 */
	public void setAgent1Price(String agent1Price) {
		this.agent1Price = agent1Price;
	}

	/**
	 * @return the agent2Price
	 */
	public String getAgent2Price() {
		return agent2Price;
	}

	/**
	 * @param agent2Price
	 *            the agent2Price to set
	 */
	public void setAgent2Price(String agent2Price) {
		this.agent2Price = agent2Price;
	}

	/**
	 * @return the agent3Price
	 */
	public String getAgent3Price() {
		return agent3Price;
	}

	/**
	 * @param agent3Price
	 *            the agent3Price to set
	 */
	public void setAgent3Price(String agent3Price) {
		this.agent3Price = agent3Price;
	}

	/**
	 * @return the agent4Price
	 */
	public String getAgent4Price() {
		return agent4Price;
	}

	/**
	 * @param agent4Price
	 *            the agent4Price to set
	 */
	public void setAgent4Price(String agent4Price) {
		this.agent4Price = agent4Price;
	}

	/**
	 * @return the agent1Num
	 */
	public Integer getAgent1Num() {
		return agent1Num;
	}

	/**
	 * @param agent1Num
	 *            the agent1Num to set
	 */
	public void setAgent1Num(Integer agent1Num) {
		this.agent1Num = agent1Num;
	}

	/**
	 * @return the agent2Num
	 */
	public Integer getAgent2Num() {
		return agent2Num;
	}

	/**
	 * @param agent2Num
	 *            the agent2Num to set
	 */
	public void setAgent2Num(Integer agent2Num) {
		this.agent2Num = agent2Num;
	}

	/**
	 * @return the agent3Num
	 */
	public Integer getAgent3Num() {
		return agent3Num;
	}

	/**
	 * @param agent3Num
	 *            the agent3Num to set
	 */
	public void setAgent3Num(Integer agent3Num) {
		this.agent3Num = agent3Num;
	}

	/**
	 * @return the agent4Num
	 */
	public Integer getAgent4Num() {
		return agent4Num;
	}

	/**
	 * @param agent4Num
	 *            the agent4Num to set
	 */
	public void setAgent4Num(Integer agent4Num) {
		this.agent4Num = agent4Num;
	}

	/**
	 * @return the salePrice
	 */
	public String getSalePrice() {
		return salePrice;
	}

	/**
	 * @param salePrice
	 *            the salePrice to set
	 */
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}

	/**
	 * @return the grammage
	 */
	public Integer getGrammage() {
		return grammage;
	}

	/**
	 * @param grammage
	 *            the grammage to set
	 */
	public void setGrammage(Integer grammage) {
		this.grammage = grammage;
	}

	/**
	 * @return the expiration
	 */
	public Integer getExpiration() {
		return expiration;
	}

	/**
	 * @param expiration
	 *            the expiration to set
	 */
	public void setExpiration(Integer expiration) {
		this.expiration = expiration;
	}

	/**
	 * @return the brand
	 */
	public String getBrand() {
		return brand;
	}

	/**
	 * @param brand
	 *            the brand to set
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}

	/**
	 * @return the place
	 */
	public String getPlace() {
		return place;
	}

	/**
	 * @param place
	 *            the place to set
	 */
	public void setPlace(String place) {
		this.place = place;
	}

	/**
	 * @return the taste
	 */
	public String getTaste() {
		return taste;
	}

	/**
	 * @param taste
	 *            the taste to set
	 */
	public void setTaste(String taste) {
		this.taste = taste;
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

}
