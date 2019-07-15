package com.zhl.mall.order.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.order.mapper.OrderProdMapper;
import com.zhl.mall.order.model.OrderProdModel;
import com.zhl.mall.order.service.OrderProdService;
@Service
public class OrderProdServiceImpl implements OrderProdService{

	@Autowired
	private OrderProdMapper orderProdMapper;

	@Override
	public List<OrderProdModel> selectAll(OrderProdModel model) {
		return orderProdMapper.selectAll(model);
	}

	@Override
	public int selectCount(OrderProdModel model) {
		return orderProdMapper.selectCount(model);
	}

	@Override
	public String deleteModel(OrderProdModel model) {
		if (1==orderProdMapper.deleteModel(model)) {
			return "1";
		}
		return "2";
	}

	@Override
	public String insert(OrderProdModel orderProdModel) {
		if (1==orderProdMapper.insert(orderProdModel)) {
			return "1";
		}
		return "2";
	}
}
