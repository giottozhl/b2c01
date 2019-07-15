package com.zhl.mall.sys.mapper;

import java.util.List;

import com.zhl.mall.sys.model.AddrModel;

public interface AddrMapper {

	int delete(AddrModel model);
	
	AddrModel selectId(AddrModel model);
	
	AddrModel selectModel(AddrModel model);
	
	List<AddrModel> selectAll(AddrModel model);
	
	int update(AddrModel model);
	
	int insert(AddrModel model);
	
}
