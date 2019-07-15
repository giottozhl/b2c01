package com.zhl.mall.sys.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhl.mall.sys.mapper.DictMapper;
import com.zhl.mall.sys.model.DictModel;
import com.zhl.mall.sys.service.DictService;
import com.zhl.util.FmtEmpty;
@Service
public class DictServiceImpl implements DictService{

	@Autowired
	private DictMapper dictMapper;

	@Override
	public List<DictModel> selectAll(DictModel model) {
		return dictMapper.selectAll(model);
	}

	@Override
	public int selectCount(DictModel model) {
		return dictMapper.selectCount(model);
	}

	@Override
	public DictModel selectModle(DictModel model) {
		DictModel dictModel=new DictModel();
		dictModel.setCode(model.getCode());
		List<DictModel> list=dictMapper.selectAll(dictModel);
		return FmtEmpty.isEmpty(list) ? null : list.get(0);
	}

	@Override
	public String deleteModel(DictModel model) {
		if (!FmtEmpty.isEmpty(dictMapper.deleteModel(model))) {
			return "1";//删除成功
		}
		return "2";
	}

	@Override
	public String insertDict(DictModel model) {
		DictModel Model=new DictModel();
		Model.setName(model.getName());
		List<DictModel> list=dictMapper.selectByName(Model);
		for (int i = 0; i <= list.size()-1; i++) {
			if (!FmtEmpty.isEmpty(list.get(i))) {
				return "名称已存在";
			}
		}
		if (selectModle(model)==null) {
				if (!FmtEmpty.isEmpty(insert(model))) {
					return "0";
				}else {
				return "2";
			}
		}
		return "1";
	}

	private int insert(DictModel model) {
		return dictMapper.insert(model);
	}

	@Override
	public String updateActive(DictModel dictModel) {
		if (1==dictMapper.updateActive(dictModel)) {
			return "1";//修改成功
		}
		return "2";//修改失败
	}

	@Override
	public DictModel selectModel(DictModel dictModel) {
		return dictMapper.selectModel(dictModel);
	}
}
