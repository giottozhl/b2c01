package com.zhl.mall.order.mapper;

import java.util.List;

import com.zhl.mall.order.model.OrderCarModel;

public interface OrderCarMapper {

	List<OrderCarModel> selectAll(OrderCarModel model);
	
	int insert(OrderCarModel model);
	
	int delete(OrderCarModel model);

	int updateActive(OrderCarModel orderCarModel);

	OrderCarModel selectModel(OrderCarModel orderCarModel);

	int update(OrderCarModel orderCarModel);

	OrderCarModel selectId(OrderCarModel model);
	
	

}
