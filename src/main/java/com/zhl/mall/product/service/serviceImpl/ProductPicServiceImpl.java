package com.zhl.mall.product.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.product.mapper.ProductPicMapper;
import com.zhl.mall.product.model.ProductPicModel;
import com.zhl.mall.product.service.ProductPicService;
import com.zhl.util.FmtEmpty;
@Service
public class ProductPicServiceImpl implements ProductPicService{

	@Autowired
	private ProductPicMapper productPicMapper;
	
	@Override
	public String insertPic(ProductPicModel productPicModel) {
			if (!FmtEmpty.isEmpty(insert(productPicModel))) {
				return "0";
			}
		return "1";
	}

	private int insert(ProductPicModel productPicModel) {
		return productPicMapper.insert(productPicModel);
	}

	@Override
	public List<ProductPicModel> selectAll(ProductPicModel productPicModel) {
		return productPicMapper.selectAll(productPicModel);
	}

	@Override
	public String deleteModel(ProductPicModel productPicModel) {
		if (!FmtEmpty.isEmpty(productPicMapper.deleteModel(productPicModel))) {
			return "1";//删除成功
		}
		return "2";
	}

	@Override
	public String updateActive(ProductPicModel productPicModel) {
		if (!FmtEmpty.isEmpty(productPicMapper.updateActive(productPicModel))) {
			return "1";//删除成功
		}
		return "2";
	}
	
	public ProductPicModel selectModel(ProductPicModel model) {
		ProductPicModel productPicModel=new ProductPicModel();
		productPicModel.setGoodsCode(model.getGoodsCode());
		List<ProductPicModel> list=productPicMapper.selectAll(productPicModel);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	@Override
	public List<ProductPicModel> selectList(ProductPicModel productPicModel) {
		return productPicMapper.selectList(productPicModel);
	}

}
