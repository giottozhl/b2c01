package com.zhl.mall.order.model;

import com.zhl.util.Pager;

public class OrderModel extends Pager{

	private int id;
	private String orderCode;//订单编号
	private String userCode;//用户主键
	private String time;//时间
	private String addrCode;//收货地址主键
	private String state;//状态
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddrCode() {
		return addrCode;
	}
	public void setAddrCode(String addrCode) {
		this.addrCode = addrCode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", orderCode=" + orderCode + ", userCode=" + userCode + ", time=" + time
				+ ", addrCode=" + addrCode + ", state=" + state + "]";
	}
	
	
}
