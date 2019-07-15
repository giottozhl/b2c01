package com.zhl.mall.sys.model;

import com.zhl.util.Pager;

public class UserModel extends Pager{

	private int id;
	private String name;//用户名
	private String code;//账号
	private String pass;//密码
	private String state;//状态（是否为管理员）
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", name=" + name + ", code=" + code + ", pass=" + pass + ", state=" + state
				+ "]";
	}
	
	
}
