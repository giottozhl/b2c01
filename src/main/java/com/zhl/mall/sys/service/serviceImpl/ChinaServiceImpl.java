package com.zhl.mall.sys.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.sys.mapper.ChinaMapper;
import com.zhl.mall.sys.model.ChinaModel;
import com.zhl.mall.sys.service.ChinaService;
@Service
public class ChinaServiceImpl implements ChinaService{

	@Autowired
	private ChinaMapper chinaMapper;

	@Override
	public List<ChinaModel> selectAll(ChinaModel model) {
		return chinaMapper.selectAll(model);
	}
}
