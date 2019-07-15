package com.zhl.mall.sys.service;

import java.util.List;

import com.zhl.mall.sys.model.AddrModel;

public interface AddrService {

	List<AddrModel> selectAll(AddrModel model);

	AddrModel selectId(AddrModel model);

	String insertAddr(AddrModel model);

	String delete(AddrModel model);

	String update(AddrModel model);
}
