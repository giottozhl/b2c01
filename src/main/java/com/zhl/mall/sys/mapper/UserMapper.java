package com.zhl.mall.sys.mapper;

import java.util.List;

import com.zhl.mall.sys.model.UserModel;

public interface UserMapper {

	int insert(UserModel model);

	List<UserModel> selectAll(UserModel model);

	int selectCount(UserModel model);
	
	UserModel selectModel(UserModel model);

	int deleteModel(UserModel userModel);
	
	int update(UserModel userModel);
	
	int updateActive(UserModel userModel);
}
