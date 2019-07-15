package com.zhl.mall.sys.mapper;

import java.util.List;

import com.zhl.mall.sys.model.DictModel;

public interface DictMapper {

	List<DictModel> selectAll(DictModel model);

	int selectCount(DictModel model);
	
	DictModel selectModel(DictModel model);
	
	List<DictModel> selectByName(DictModel model);

	int insert(DictModel model);

	int updateActive(DictModel dictModel);

	int deleteModel(DictModel model);

}
