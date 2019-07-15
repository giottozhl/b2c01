package com.zhl.mall.product.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.product.mapper.ProductMapper;
import com.zhl.mall.product.model.ProductModel;
import com.zhl.mall.product.service.ProductService;
import com.zhl.util.FmtEmpty;
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper productMapper;

	@Override
	public List<ProductModel> selectAll(ProductModel productModel) {
		return productMapper.selectAll(productModel);
	}

	@Override
	public int selectCount(ProductModel productModel) {
		return productMapper.selectCount(productModel);
	}

	@Override
	public String insertPro(ProductModel model) {
		ProductModel prodModel=new ProductModel();
		prodModel.setName(model.getName());
		List<ProductModel> list=productMapper.selectByName(prodModel);
		for (int i = 0; i <= list.size()-1; i++) {
			if (!FmtEmpty.isEmpty(list.get(i))) {
				return "名称已存在";
			}
		}
		if (selectModel(model)==null) {
				if (!FmtEmpty.isEmpty(insert(model))) {
					return "0";
				}
				return "2";
		}
		return "1";
	}

	public int insert(ProductModel model) {
		return productMapper.insert(model);
	}

	public ProductModel selectModel(ProductModel model) {
		ProductModel productModel=new ProductModel();
		productModel.setGoodsCode(model.getGoodsCode());
		List<ProductModel> list=productMapper.selectAll(productModel);
		return FmtEmpty.isEmpty(list)?null:list.get(0);
	}

	@Override
	public String update(ProductModel productModel) {
		if (1==productMapper.updateActive(productModel)) {
			return "1";//修改成功
		}
		return "2";//修改失败
	}

	@Override
	public String deleteModel(ProductModel productModel) {
		if (1==productMapper.deleteModel(productModel)) {
			return "1";//删除成功
		}
		return "2";//删除失败
	}

	@Override
	public ProductModel selectByCode(ProductModel productModel) {
		return productMapper.selectModel(productModel);
	}


	
}
