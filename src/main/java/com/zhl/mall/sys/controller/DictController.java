package com.zhl.mall.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.sys.model.DictModel;
import com.zhl.mall.sys.service.DictService;


@Controller
@RequestMapping("/dictController")
public class DictController {

	@Autowired
	private DictService dictService;
	
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(DictModel dictModel,String name) {
		dictModel.setName("%"+name+"%");
		List<DictModel> list=dictService.selectAll(dictModel);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", dictService.selectCount(dictModel));
//		response.setContentType("application/json;charset=utf-8");
		return new JSONObject(map).toString();
	}
	
	@RequestMapping("/addDict")
	@ResponseBody
	public String addDict(DictModel model) {
		return dictService.insertDict(model);
	}
	
	@RequestMapping(value="/selectDict",produces="application/json;charset=utf-8")
	@ResponseBody
	public String add(String parentCode,HttpServletResponse response) {
		DictModel model=new DictModel();
		model.setParentCode(parentCode);
		List<DictModel> list=dictService.selectAll(model);
		return new JSONArray(list).toString();
	}
	
	@RequestMapping(value="/selectModel",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectModel(DictModel dictModel) {
		DictModel model=dictService.selectModel(dictModel);
		return new JSONObject(model).toString();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String updateActive(DictModel model) {
		DictModel dictModel=new DictModel();
		dictModel.setCode(model.getCode());
		DictModel dt=dictService.selectModel(dictModel);
		if ("type1".equals(dt.getParentCode())) {
			return "3";
		}
		return dictService.updateActive(model);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(DictModel model) {
		return dictService.deleteModel(model);
	}
	
	@RequestMapping(value="/getListUp",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getListUp(DictModel dictModel,HttpServletResponse response) {
		List<DictModel> list=dictService.selectAll(dictModel);
		return new JSONArray(list).toString();
	}
}
