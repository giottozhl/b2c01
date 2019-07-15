package com.zhl.mall.product.model;

import com.zhl.util.Pager;

public class ProductModel extends Pager{

	private int id;
	private String goodsCode;//商品编号
	private String name;//商品名称
	private String price;//单价
	private String descr;//描述
	private String number;//库存量
	private String state;//状态（上架or下架）
	private String parentCode;//商品分类主键
	private String parentName;//子查询自定义列
	private String parent;
	
	
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", goodsCode=" + goodsCode + ", name=" + name + ", price=" + price
				+ ", descr=" + descr + ", number=" + number + ", state=" + state + ", parentCode=" + parentCode
				+ ", parentName=" + parentName + ", parent=" + parent + "]";
	}
	
	
}
