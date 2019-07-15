package com.zhl.mall.order.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.order.mapper.OrderMapper;
import com.zhl.mall.order.model.OrderModel;
import com.zhl.mall.order.service.OrderService;
import com.zhl.util.FmtEmpty;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderMapper;

	@Override
	public List<OrderModel> selectAll(OrderModel model) {
		return orderMapper.selectAll(model);
	}

	@Override
	public int selectCount(OrderModel model) {
		return orderMapper.selectCount(model);
	}

	@Override
	public String delete(OrderModel model) {
		if (1==orderMapper.deleteModel(model)) {
			return "1";//删除成功
		}
		return "2";//删除失败
	}

	@Override
	public OrderModel selectModel(OrderModel model) {
		OrderModel orderModel=new OrderModel();
		orderModel.setOrderCode(model.getOrderCode());
		List<OrderModel> list=orderMapper.selectAll(orderModel);
		return FmtEmpty.isEmpty(list)?null:list.get(0);
	}

	@Override
	public String updateActive(OrderModel model) {
		if (1==orderMapper.updateActive(model)) {
			return "1";
		}
		return "2";
	}

	@Override
	public String insert(OrderModel model) {
		if (1==orderMapper.insert(model)) {
			return "1";//插入成功
		}
		return "2";//插入失败
	}

	@Override
	public int updateAddr(OrderModel model) {
		return orderMapper.updateAddr(model);
	}
}
