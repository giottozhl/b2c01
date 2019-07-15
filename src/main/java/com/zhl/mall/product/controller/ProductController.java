package com.zhl.mall.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhl.mall.product.model.ProductModel;
import com.zhl.mall.product.model.ProductPicModel;
import com.zhl.mall.product.service.ProductPicService;
import com.zhl.mall.product.service.ProductService;
import com.zhl.mall.sys.model.DictModel;
import com.zhl.mall.sys.service.DictService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/prodController")
public class ProductController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private DictService dictService;
	
	@Autowired
    private ProductPicService productPicService;
	
	@RequestMapping(value="/select",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectAll(ProductModel productModel,String name) {
		productModel.setName("%"+(name==null?"":name)+"%");
		List<ProductModel> list=productService.selectAll(productModel);
		Map<String, Object> map=new HashMap<>();
		map.put("list", list);
		map.put("count", productService.selectCount(productModel));
		return JSONObject.fromObject(map).toString();
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(ProductModel model,String productType) {
		model.setParentCode(productType);
		return productService.insertPro(model);
	}
	
	@RequestMapping(value="/selectModel",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectModel(ProductModel productModel) {
		ProductModel pm=productService.selectByCode(productModel);
		return JSONObject.fromObject(pm).toString();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(ProductModel productModel,String productType) {
		productModel.setParentCode(productType);
		return productService.update(productModel);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(ProductModel productModel) {
		return productService.deleteModel(productModel);
	}
	
	@RequestMapping(value="/selectType",produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectType(String parentCode,String name,String type,int pageLimit,int pageIndex) {
//		MediaType.APPLICATION_JSON_VALUE
		if ("2".equals(type)) {
			ProductModel productModel=new ProductModel();
			productModel.setName("%"+name+"%");
			productModel.setPageIndex(pageIndex);
			productModel.setPageLimit(pageLimit);
			List<ProductModel> list=productService.selectAll(productModel);
			Map<String, Object> map=new HashMap<>();
			map.put("list", list);
			map.put("count", productService.selectCount(productModel));
			ProductPicModel productPicModel=new ProductPicModel();
			List<ProductPicModel> pList=new ArrayList<ProductPicModel>();
			for (int i = 0; i <list.size(); i++) {
				productPicModel.setGoodsCode(list.get(i).getGoodsCode());
				List<ProductPicModel> picList=productPicService.selectAll(productPicModel);
				for (int j = 0; j < picList.size(); j++) {
					if ("1".equals(picList.get(j).getType())) {
						ProductPicModel model=new ProductPicModel();
						model.setGoodsCode(picList.get(j).getGoodsCode());
						model.setUrl(picList.get(j).getUrl());
						pList.add(model);
						break;
					}
				}
			}
	        map.put("pic",pList);
			return JSONObject.fromObject(map).toString();
		}else {
			DictModel dictModel=new DictModel();
			dictModel.setParentCode(parentCode);
			List<DictModel> dictList=dictService.selectAll(dictModel);
			List<String> prodList=new ArrayList<String>();
			for (DictModel l:dictList) {
				prodList.add(l.getCode());
			}
			List<ProductModel> list=new ArrayList<ProductModel>();
			Map<String, Object> map=new HashMap<>();
			int count=0;
			for (int i = 0; i < prodList.size(); i++) {
				
				ProductModel productModel=new ProductModel();
				productModel.setParentCode(prodList.get(i));
				List<ProductModel> tList=productService.selectAll(productModel);
				for (ProductModel p:tList) {
					list.add(p);
					count++;
				}
			}
			map.put("list", list);
			map.put("count", count);
			ProductPicModel productPicModel=new ProductPicModel();
			List<ProductPicModel> pList=new ArrayList<ProductPicModel>();
			for (int i = 0; i <list.size(); i++) {
				productPicModel.setGoodsCode(list.get(i).getGoodsCode());
				List<ProductPicModel> picList=productPicService.selectAll(productPicModel);
				for (int j = 0; j < picList.size(); j++) {
					if ("1".equals(picList.get(j).getType())) {
						ProductPicModel model=new ProductPicModel();
						model.setGoodsCode(picList.get(j).getGoodsCode());
						model.setUrl(picList.get(j).getUrl());
						pList.add(model);
						break;
					}
				}
			}
			map.put("pic",pList);
			return JSONObject.fromObject(map).toString();
		}
	}
	
	@RequestMapping(value="/selectPro",produces="application/json;charset=utf-8")
	public String selectProd(String goodsCode,String parentCode,String type,Model model) {
		ProductModel productModel=new ProductModel();
		ProductModel Model=new ProductModel();
		if ("1".equals(type)) {
			productModel.setParentCode(parentCode);
			ProductModel pModel=productService.selectByCode(productModel);
			Model=pModel;
			model.addAttribute("list", pModel);
		}else {
			productModel.setGoodsCode(goodsCode);
			ProductModel pModel=productService.selectByCode(productModel);
			Model=pModel;
			model.addAttribute("list", pModel);
		}
		ProductPicModel picModel=new ProductPicModel();
		picModel.setGoodsCode(Model.getGoodsCode());
		List<ProductPicModel> list=productPicService.selectAll(picModel);
		for (int i = 0; i < list.size(); i++) {
			if (!"1".equals(list.get(i).getType())) {
				model.addAttribute("pic", list.get(i));
				break;
			}
		}
		return "user/xiangqing";
	}
}
