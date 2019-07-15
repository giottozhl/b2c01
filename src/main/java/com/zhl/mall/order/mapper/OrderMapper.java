package com.zhl.mall.order.mapper;

import java.util.List;

import com.zhl.mall.order.model.OrderModel;

public interface OrderMapper {

	List<OrderModel> selectAll(OrderModel model);
	
	OrderModel selectModel(OrderModel model);
	
	int deleteModel(OrderModel model);
	
	int updateActive(OrderModel model);
	
	int insert(OrderModel model);
	
	int selectCount(OrderModel model);

	int updateAddr(OrderModel model);
}
