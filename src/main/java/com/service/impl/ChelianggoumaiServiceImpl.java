package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.ChelianggoumaiDao;
import com.entity.ChelianggoumaiEntity;
import com.service.ChelianggoumaiService;
import com.entity.vo.ChelianggoumaiVO;
import com.entity.view.ChelianggoumaiView;

@Service("chelianggoumaiService")
public class ChelianggoumaiServiceImpl extends ServiceImpl<ChelianggoumaiDao, ChelianggoumaiEntity> implements ChelianggoumaiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ChelianggoumaiEntity> page = this.selectPage(
                new Query<ChelianggoumaiEntity>(params).getPage(),
                new EntityWrapper<ChelianggoumaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ChelianggoumaiEntity> wrapper) {
		  Page<ChelianggoumaiView> page =new Query<ChelianggoumaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ChelianggoumaiVO> selectListVO(Wrapper<ChelianggoumaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ChelianggoumaiVO selectVO(Wrapper<ChelianggoumaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ChelianggoumaiView> selectListView(Wrapper<ChelianggoumaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ChelianggoumaiView selectView(Wrapper<ChelianggoumaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
