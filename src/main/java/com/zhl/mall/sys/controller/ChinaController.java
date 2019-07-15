package com.zhl.mall.sys.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.sys.model.ChinaModel;
import com.zhl.mall.sys.service.ChinaService;

@Controller
@RequestMapping("/chinaController")
public class ChinaController {

	@Autowired
	private ChinaService chinaService;
	
	@RequestMapping(value="/getListUp",produces="application/json;charset=utf-8")
	@ResponseBody
	public String getListUp(ChinaModel model) {
		System.out.println(model);
		List<ChinaModel> list=chinaService.selectAll(model);
		System.out.println(new JSONArray(list).toString());
		return new JSONArray(list).toString();
	}
}
