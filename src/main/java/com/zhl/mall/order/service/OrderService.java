package com.zhl.mall.order.service;

import java.util.List;

import com.zhl.mall.order.model.OrderModel;

public interface OrderService {

	List<OrderModel> selectAll(OrderModel model);

	int selectCount(OrderModel model);

	String delete(OrderModel model);

	OrderModel selectModel(OrderModel model);

	String updateActive(OrderModel model);

	String insert(OrderModel model);
	
	int updateAddr(OrderModel model);
}
