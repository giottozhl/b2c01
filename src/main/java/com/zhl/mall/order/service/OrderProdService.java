package com.zhl.mall.order.service;

import java.util.List;

import com.zhl.mall.order.model.OrderProdModel;

public interface OrderProdService {

	List<OrderProdModel> selectAll(OrderProdModel model);

	int selectCount(OrderProdModel model);

	String deleteModel(OrderProdModel model);

	String insert(OrderProdModel orderProdModel);

}
