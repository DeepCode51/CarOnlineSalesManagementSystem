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


import com.dao.DingdanzhuangtaiDao;
import com.entity.DingdanzhuangtaiEntity;
import com.service.DingdanzhuangtaiService;
import com.entity.vo.DingdanzhuangtaiVO;
import com.entity.view.DingdanzhuangtaiView;

@Service("dingdanzhuangtaiService")
public class DingdanzhuangtaiServiceImpl extends ServiceImpl<DingdanzhuangtaiDao, DingdanzhuangtaiEntity> implements DingdanzhuangtaiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DingdanzhuangtaiEntity> page = this.selectPage(
                new Query<DingdanzhuangtaiEntity>(params).getPage(),
                new EntityWrapper<DingdanzhuangtaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DingdanzhuangtaiEntity> wrapper) {
		  Page<DingdanzhuangtaiView> page =new Query<DingdanzhuangtaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<DingdanzhuangtaiVO> selectListVO(Wrapper<DingdanzhuangtaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DingdanzhuangtaiVO selectVO(Wrapper<DingdanzhuangtaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DingdanzhuangtaiView> selectListView(Wrapper<DingdanzhuangtaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DingdanzhuangtaiView selectView(Wrapper<DingdanzhuangtaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
