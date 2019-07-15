package com.zhl.mall.order.service;

import java.util.List;

import com.zhl.mall.order.model.OrderCarModel;
import com.zhl.mall.product.model.ProductPicModel;

public interface OrderCarService {

	String insertGoods(OrderCarModel orderCarModel);

	List<OrderCarModel> selectAll(OrderCarModel orderCarModel);

	OrderCarModel selectModel(OrderCarModel orderCarModel);

	OrderCarModel selectByCode(OrderCarModel carModel);

	String update(OrderCarModel model);

	String delete(OrderCarModel model);

	OrderCarModel selectId(OrderCarModel model);

}
