package com.zhl.mall.product.mapper;

import java.util.List;

import com.zhl.mall.product.model.ProductModel;

public interface ProductMapper {

	List<ProductModel> selectAll(ProductModel productModel);

	int selectCount(ProductModel productModel);

	ProductModel selectModel(ProductModel productModel);
	
	int insert(ProductModel productModel);

	int updateActive(ProductModel productModel);

	int deleteModel(ProductModel productModel);

	List<ProductModel> selectByName(ProductModel model);
}
