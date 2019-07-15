package com.zhl.mall.order.contorller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.javassist.expr.NewArray;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.order.model.OrderCarModel;
import com.zhl.mall.order.model.OrderModel;
import com.zhl.mall.order.model.OrderProdModel;
import com.zhl.mall.order.service.OrderCarService;
import com.zhl.mall.order.service.OrderProdService;
import com.zhl.mall.order.service.OrderService;
import com.zhl.mall.product.model.ProductModel;
import com.zhl.mall.product.model.ProductPicModel;
import com.zhl.mall.product.service.ProductPicService;
import com.zhl.mall.product.service.ProductService;
import com.zhl.mall.sys.model.AddrModel;
import com.zhl.mall.sys.service.AddrService;

@Controller
@RequestMapping("/orderCarController")
public class OrderCarController {

	@Autowired
	private OrderCarService orderCarService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderProdService orderProdService;
	
	@Autowired
	private AddrService addrService;
	
	@RequestMapping(value="/selectCart",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(OrderCarModel orderCarModel) {
		List<OrderCarModel> list=orderCarService.selectAll(orderCarModel);
		Map<Object, Object> map=new HashMap<Object, Object>();
		List<OrderCarModel> pList=new ArrayList<OrderCarModel>();
		for (int i = 0; i < list.size(); i++) {
			OrderCarModel carModel=new OrderCarModel();
			carModel.setGoodsCode(list.get(i).getGoodsCode());
			pList.add(orderCarService.selectByCode(carModel));
			
		}
		map.put("list",pList);
		return new JSONObject(map).toString();
	}
	
	@RequestMapping(value="/insert",produces="application/json;charset=utf-8")
	@ResponseBody
	public String insert(OrderCarModel orderCarModel) {
		return orderCarService.insertGoods(orderCarModel);
	}
	
	@RequestMapping(value="/sum",produces="application/json;charset=utf-8")
	@ResponseBody
	public String changeNum(int id,String sum) {
		OrderCarModel model=new OrderCarModel();
		model.setId(id);
		model.setNumber(sum);
		return orderCarService.update(model);
	}
	
	@RequestMapping(value="/del",produces="application/json;charset=utf-8")
	@ResponseBody
	public String delete(int id) {
		OrderCarModel model=new OrderCarModel();
		model.setId(id);
		return orderCarService.delete(model);
	}
	
	@RequestMapping(value="/getList",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getList(String ids) {
		String[] id=ids.split(",");
		List<OrderCarModel> list=new ArrayList<OrderCarModel>();
		for (int i = 0; i < id.length; i++) {
			OrderCarModel model=new OrderCarModel();
			model.setId(Integer.parseInt(id[i]));
			OrderCarModel orderCarModel=orderCarService.selectId(model);
			list.add(orderCarModel);
		}
		return new JSONArray(list).toString();
	}
	
	@RequestMapping(value="/input",produces="application/json;charset=utf-8")
	@ResponseBody
	public String input(String addrCode,String ids,String userCode) {
		 //随机生成一位整数
        int random = (int) (Math.random()*9+1);
        String valueOf = String.valueOf(random);
        //生成uuid的hashCode值
        int hashCode = UUID.randomUUID().toString().hashCode();
        //可能为负数
        if(hashCode<0){
            hashCode = -hashCode;
        }
        String value = valueOf + String.format("%015d", hashCode);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String time=df.format(new Date());// new Date()为获取当前系统时间
        AddrModel addrModel=new AddrModel();
        addrModel.setId(Integer.parseInt(addrCode));
        AddrModel addrModel2=addrService.selectId(addrModel);
        String addrString="收件人:"+addrModel2.getUser()+"\\电话:"+addrModel2.getTel()+"\\省:"+addrModel2.getProvince()+"\\市:"+addrModel2.getCity()+"\\区:"+addrModel2.getDistrict()+"\\详细地址:"+addrModel2.getDetailedAddr();
        OrderModel model=new OrderModel();
        model.setUserCode(userCode);
        model.setOrderCode(value);
        model.setTime(time);
        model.setAddrCode(addrString);
        model.setState("未发货");
        if ("1".equals(orderService.insert(model))) {
        	String[] id=ids.split(",");
        	List<OrderCarModel> list=new ArrayList<OrderCarModel>();
    		for (int i = 0; i < id.length; i++) {
    			OrderCarModel orderCarModel=new OrderCarModel();
    			orderCarModel.setId(Integer.parseInt(id[i]));
    			OrderCarModel orderCar=orderCarService.selectId(orderCarModel);
    			list.add(orderCar);
    		}
    		OrderProdModel orderProdModel=new OrderProdModel();
    		OrderCarModel orderCarModel=new OrderCarModel();
    		orderProdModel.setOrderCode(value);
    		for (int j = 0; j < list.size(); j++) {
    			
				orderProdModel.setGoodsCode(list.get(j).getGoodsCode());
				orderProdModel.setNumber(list.get(j).getNumber());
				orderProdModel.setPrice(((Integer.parseInt(list.get(j).getPcost()))*(Integer.parseInt(list.get(j).getNumber())))+"");
				if ("1".equals(orderProdService.insert(orderProdModel))) {
					orderCarModel.setId(list.get(j).getId());
					orderCarService.delete(orderCarModel);
				}else {
					return "3";//订单商品添加失败
				}
			}
    		return "1";//生成订单成功
		}
		
		return "2";//生成订单失败
	}
}
