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


import com.dao.YunshushoufeiDao;
import com.entity.YunshushoufeiEntity;
import com.service.YunshushoufeiService;
import com.entity.vo.YunshushoufeiVO;
import com.entity.view.YunshushoufeiView;

@Service("yunshushoufeiService")
public class YunshushoufeiServiceImpl extends ServiceImpl<YunshushoufeiDao, YunshushoufeiEntity> implements YunshushoufeiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YunshushoufeiEntity> page = this.selectPage(
                new Query<YunshushoufeiEntity>(params).getPage(),
                new EntityWrapper<YunshushoufeiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YunshushoufeiEntity> wrapper) {
		  Page<YunshushoufeiView> page =new Query<YunshushoufeiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<YunshushoufeiVO> selectListVO(Wrapper<YunshushoufeiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YunshushoufeiVO selectVO(Wrapper<YunshushoufeiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YunshushoufeiView> selectListView(Wrapper<YunshushoufeiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YunshushoufeiView selectView(Wrapper<YunshushoufeiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
