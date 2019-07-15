package com.zhl.mall.order.contorller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.order.model.OrderProdModel;
import com.zhl.mall.order.service.OrderProdService;

@Controller
@RequestMapping("/orderProdController")
public class OrderProdController {

	@Autowired
	private OrderProdService orderProdService;
	
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(OrderProdModel model) {
		List<OrderProdModel> list=orderProdService.selectAll(model);
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", orderProdService.selectCount(model));
		return new JSONObject(map).toString();
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public String delete(OrderProdModel model){
		return orderProdService.deleteModel(model);
	}
}
