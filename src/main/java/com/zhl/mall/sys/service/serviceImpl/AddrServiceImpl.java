package com.zhl.mall.sys.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.sys.mapper.AddrMapper;
import com.zhl.mall.sys.model.AddrModel;
import com.zhl.mall.sys.service.AddrService;
@Service
public class AddrServiceImpl implements AddrService{

	@Autowired
	private AddrMapper addrMapper;
	
	@Override
	public List<AddrModel> selectAll(AddrModel model) {
		return addrMapper.selectAll(model);
	}

	@Override
	public AddrModel selectId(AddrModel model) {
		return addrMapper.selectId(model);
	}

	@Override
	public String insertAddr(AddrModel model) {
		if (1==addrMapper.insert(model)) {
			return "1";//添加成功
		}
		return "2";
	}

	@Override
	public String delete(AddrModel model) {
		if (1==addrMapper.delete(model)) {
			return "1";
		}
		return "2";
	}

	@Override
	public String update(AddrModel model) {
		if (1==addrMapper.update(model)) {
			return "1";
		}
		return "2";
	}

}
