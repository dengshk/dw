package com.dw.web.model;

public class ProductType implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Integer typeId;
	private String typeName;
	private String typeInfo;

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

	public String getTypeInfo() {
		return typeInfo;
	}

	public void setTypeInfo(String typeInfo) {
		this.typeInfo = typeInfo;
	}

}
