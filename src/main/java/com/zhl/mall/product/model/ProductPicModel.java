package com.zhl.mall.product.model;

import com.zhl.util.Pager;

public class ProductPicModel extends Pager{

	private int id;
	private String goodsCode;//商品主键
	private String url;//地址
	private String type;//图片类型
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public ProductPicModel() {
		super();
	}
	public ProductPicModel(String goodsCode, String url, String type) {
		super();
		this.goodsCode = goodsCode;
		this.url = url;
		this.type = type;
	}
	
	
}
