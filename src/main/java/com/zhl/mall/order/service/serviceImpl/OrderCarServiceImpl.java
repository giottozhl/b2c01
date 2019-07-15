package com.zhl.mall.order.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.order.mapper.OrderCarMapper;
import com.zhl.mall.order.model.OrderCarModel;
import com.zhl.mall.order.service.OrderCarService;
import com.zhl.mall.product.model.ProductPicModel;
import com.zhl.util.FmtEmpty;
@Service
public class OrderCarServiceImpl implements OrderCarService{

	@Autowired
	private OrderCarMapper orderCarMapper;
	
	@Override
	public String insertGoods(OrderCarModel orderCarModel) {
		OrderCarModel model=new OrderCarModel();
		model.setUserCode(orderCarModel.getUserCode());
		model.setGoodsCode(orderCarModel.getGoodsCode());
		OrderCarModel carModel=selectModel(model);
		if (carModel==null) {
			if (1==orderCarMapper.insert(orderCarModel)) {
				return "1";//添加成功
			}
			return "2";//添加失败
		}else {
			carModel.setNumber((Integer.parseInt(carModel.getNumber())+1)+"");
			if (!FmtEmpty.isEmpty(update(carModel))) {
				return "1";//添加成功
			}
		}
		return "2";//添加失败
	}

	public OrderCarModel selectModel(OrderCarModel orderCarModel) {
		List<OrderCarModel> list=orderCarMapper.selectAll(orderCarModel);
		return FmtEmpty.isEmpty(list)?null:list.get(0);
	}
	
	public String update(OrderCarModel orderCarModel) {
		if (1==orderCarMapper.update(orderCarModel)) {
			return "1";
		}
		return "2";
	}

	@Override
	public List<OrderCarModel> selectAll(OrderCarModel orderCarModel) {
		return orderCarMapper.selectAll(orderCarModel);
	}

	@Override
	public OrderCarModel selectByCode(OrderCarModel orderCarModel) {
		return orderCarMapper.selectModel(orderCarModel);
	}

	@Override
	public String delete(OrderCarModel model) {
		if (1==orderCarMapper.delete(model)) {
			return "1";
		}
		return "2";
	}

	@Override
	public OrderCarModel selectId(OrderCarModel model) {
		return orderCarMapper.selectId(model);
	}

}
