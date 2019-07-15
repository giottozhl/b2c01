package com.zhl.mall.order.contorller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.order.model.OrderModel;
import com.zhl.mall.order.service.OrderService;

@Controller
@RequestMapping("/orderController")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(OrderModel orderModel,int pageLimit,int pageIndex,HttpServletResponse response) {
		System.out.println(orderModel);
		orderModel.setPageLimit(pageLimit);
		orderModel.setPageIndex(pageIndex);
		List<OrderModel> list=orderService.selectAll(orderModel);
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", orderService.selectCount(orderModel));
//		List<AddrModel> addrModels = null;
//		for (int i = 0; i < list.size(); i++) {
//			addrModels=new ArrayList<AddrModel>();
//			AddrModel addrModel=new AddrModel();
//			addrModel.setId(Integer.parseInt(list.get(i).getAddrCode()));
//			addrModels.add(addrService.selectId(addrModel));
//			
//		}
//		map.put("addr", addrModels);
		return new JSONObject(map).toString();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(OrderModel model) {
		return orderService.delete(model);
	}
	
	@RequestMapping("/selectModel")
	public String selectModel(OrderModel orderModel,Model model) {
		model.addAttribute("user",orderService.selectModel(orderModel));
		return "order/orderupd";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String udpate(OrderModel model) {
		return orderService.updateActive(model);
	}
}
