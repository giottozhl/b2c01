package com.zhl.mall.product.mapper;

import java.util.List;

import com.zhl.mall.product.model.ProductPicModel;

public interface ProductPicMapper {

	int insert(ProductPicModel productPicModel);

	List<ProductPicModel> selectAll(ProductPicModel productPicModel);

	int deleteModel(ProductPicModel productPicModel);

	int updateActive(ProductPicModel productPicModel);

	List<ProductPicModel> selectList(ProductPicModel productPicModel);

}
