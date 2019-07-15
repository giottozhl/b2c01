package com.zhl.mall.sys.service;

import java.util.List;

import com.zhl.mall.sys.model.DictModel;

public interface DictService {

	List<DictModel> selectAll(DictModel model);

	int selectCount(DictModel model);

	DictModel selectModle(DictModel model);
	
	String deleteModel(DictModel model);
	
	String insertDict(DictModel model);

	String updateActive(DictModel dictModel);

	DictModel selectModel(DictModel dictModel);

}
