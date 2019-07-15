package com.zhl.mall.sys.service;

import java.util.List;

import com.zhl.mall.sys.model.UserModel;

public interface UserService {

	String insertByUQCode(UserModel model);

	List<UserModel> selectAll(UserModel model);
	
	UserModel selectModel(UserModel model);
	
	int selectCount(UserModel model);

	String delete(UserModel userModel);

	String updateActive(UserModel userModel);
	
}
