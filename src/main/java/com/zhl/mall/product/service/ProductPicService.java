package com.zhl.mall.product.service;

import java.util.List;

import com.zhl.mall.product.model.ProductPicModel;

public interface ProductPicService {

	String insertPic(ProductPicModel productPicModel);

	List<ProductPicModel> selectAll(ProductPicModel productPicModel);

	String deleteModel(ProductPicModel productPicModel);

	String updateActive(ProductPicModel ppm);

	List<ProductPicModel> selectList(ProductPicModel productPicModel);
}
