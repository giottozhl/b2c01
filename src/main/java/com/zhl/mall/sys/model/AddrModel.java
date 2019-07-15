package com.zhl.mall.sys.model;

public class AddrModel {

	private int id;
	private String userCode;//用户主键
	private String user;//收件人
	private String tel;//电话
	private String province;//省
	private String city;//市
	private String district;//区
	private String detailedAddr;//详细地址
	
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDetailedAddr() {
		return detailedAddr;
	}
	public void setDetailedAddr(String detailedAddr) {
		this.detailedAddr = detailedAddr;
	}
	@Override
	public String toString() {
		return "AddrModel [id=" + id + ", userCode=" + userCode + ", user=" + user + ", tel=" + tel + ", province="
				+ province + ", city=" + city + ", district=" + district + ", detailedAddr=" + detailedAddr + "]";
	}
	
}
