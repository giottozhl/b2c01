package com.zhl.mall.sys.model;

import com.zhl.util.Pager;

public class DictModel extends Pager{

	private int id;
	private String code;//类型编号
	private String name;//类型名称
	private String descr;//类别描述
	private String parentCode;//上级code
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	@Override
	public String toString() {
		return "DictModel [id=" + id + ", code=" + code + ", name=" + name + ", descr=" + descr + ", parentCode="
				+ parentCode + "]";
	}
	
	
}
