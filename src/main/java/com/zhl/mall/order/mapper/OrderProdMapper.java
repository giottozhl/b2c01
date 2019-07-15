package com.zhl.mall.order.mapper;

import java.util.List;

import com.zhl.mall.order.model.OrderProdModel;

public interface OrderProdMapper {

	List<OrderProdModel> selectAll(OrderProdModel model);

	int selectCount(OrderProdModel model);

	int deleteModel(OrderProdModel model);

	int insert(OrderProdModel orderProdModel);

}
