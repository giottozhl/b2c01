package com.zhl.mall.order.model;

public class OrderCarModel {

	private int id;
	private String userCode;//用户主键
	private String goodsCode;//商品主键
	private String number;//数量
	private String purl1;
	private String pcost;
	private String pname;
	
	
	
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPurl1() {
		return purl1;
	}
	public void setPurl1(String purl1) {
		this.purl1 = purl1;
	}
	public String getPcost() {
		return pcost;
	}
	public void setPcost(String pcost) {
		this.pcost = pcost;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "OrderCarModel [id=" + id + ", userCode=" + userCode + ", goodsCode=" + goodsCode + ", number=" + number
				+ ", purl1=" + purl1 + ", pcost=" + pcost + "]";
	}
	
	
}
