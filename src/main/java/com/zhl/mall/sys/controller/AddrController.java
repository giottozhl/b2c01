package com.zhl.mall.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.order.model.OrderModel;
import com.zhl.mall.order.model.OrderProdModel;
import com.zhl.mall.order.service.OrderService;
import com.zhl.mall.sys.model.AddrModel;
import com.zhl.mall.sys.model.UserModel;
import com.zhl.mall.sys.service.AddrService;

@Controller
@RequestMapping("/addrController")
public class AddrController {

	@Autowired
	private AddrService addrService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value="/selectAll",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(String userCode) {
		AddrModel model=new AddrModel();
		model.setUserCode(userCode);
		List<AddrModel> list=addrService.selectAll(model);
		System.out.println(new JSONArray(list).toString());
		return new JSONArray(list).toString();
	}
	
	@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insertAddr(AddrModel model) {
		return addrService.insertAddr(model);
	}
	
	@RequestMapping(value="/delete",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteById(AddrModel model,String userCode) {
//		AddrModel addrModel=addrService.selectId(model);
//		String add="收件人："+addrModel.getUser()+"\\ 电话："+addrModel.getTel()+"\\ 省："+addrModel.getProvince()+"\\ 市："+addrModel.getCity()+"\\ 区："+addrModel.getDistrict()+"\\ 详细地址:"+addrModel.getDetailedAddr();
//		OrderModel orderMode=new OrderModel();
//		orderMode.setAddrCode(add);
//		if ("1".equals(addrService.delete(model))) {
//			OrderModel orderModel=new OrderModel();
//			orderModel.setAddrCode(model.getId()+"");
//			orderModel.setUserCode(userCode);
//			List<OrderModel> list=orderService.selectAll(orderModel);
//			for (int i = 0; i < list.size(); i++) {
//				orderMode.setOrderCode(list.get(i).getOrderCode());
//				orderService.updateAddr(orderMode);
//			}
//			return "1";
//		}
//		return "2";
		return addrService.delete(model);
	}
	
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectById(AddrModel model) {
		AddrModel addrModel=addrService.selectId(model);
		return new JSONObject(addrModel).toString();
	}
	
	@RequestMapping(value="/update",produces="application/json;charset=utf-8")
	@ResponseBody
	public String UpdateById(AddrModel model) {
		return addrService.update(model);
	}
}
