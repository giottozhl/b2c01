package com.zhl.mall.product.service;

import java.util.List;

import com.zhl.mall.product.model.ProductModel;

public interface ProductService {

	List<ProductModel> selectAll(ProductModel productModel);

	int selectCount(ProductModel productModel);

	String insertPro(ProductModel model);

	ProductModel selectModel(ProductModel productModel);

	String update(ProductModel productModel);

	String deleteModel(ProductModel productModel);

	ProductModel selectByCode(ProductModel productModel);
	
}
