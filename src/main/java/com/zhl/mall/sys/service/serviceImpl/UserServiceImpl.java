package com.zhl.mall.sys.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.sys.mapper.UserMapper;
import com.zhl.mall.sys.model.UserModel;
import com.zhl.mall.sys.service.UserService;
import com.zhl.util.FmtEmpty;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public String insertByUQCode(UserModel model) {
		if (selectModel(model) == null) {
        	if (FmtEmpty.isEmpty(insert(model))) {
        		return "2";
			}else {
//				addCount(employeeModel);
		        return "0";
			}
        }else {
        	return "1";
		}
	}

	public int insert(UserModel model) {
		return userMapper.insert(model);
	}

	@Override
	public List<UserModel> selectAll(UserModel model) {
		return userMapper.selectAll(model);
	}

	@Override
	public UserModel selectModel(UserModel model) {
		UserModel um=new UserModel();
		um.setCode(model.getCode());
		List<UserModel> list=userMapper.selectAll(um);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	@Override
	public int selectCount(UserModel model) {
		return userMapper.selectCount(model);
	}

	@Override
	public String delete(UserModel userModel) {
		if (!FmtEmpty.isEmpty(userMapper.deleteModel(userModel))) {
			return "1";//删除成功
		}
		return "2";
	}

	@Override
	public String updateActive(UserModel userModel) {
		if (1==userMapper.updateActive(userModel)) {
			return "1";//修改成功
		}
		return "2";//修改失败
	}
	
	
}
