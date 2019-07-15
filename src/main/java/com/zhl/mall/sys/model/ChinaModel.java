package com.zhl.mall.sys.model;

import com.zhl.util.Pager;

public class ChinaModel extends Pager{

	private int id;
	private String name;
	private int pId;
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
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	@Override
	public String toString() {
		return "ChinaModel [id=" + id + ", name=" + name + ", pId=" + pId + "]";
	}
	
	
}
