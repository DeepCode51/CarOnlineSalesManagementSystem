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


import com.dao.QichepinpaiDao;
import com.entity.QichepinpaiEntity;
import com.service.QichepinpaiService;
import com.entity.vo.QichepinpaiVO;
import com.entity.view.QichepinpaiView;

@Service("qichepinpaiService")
public class QichepinpaiServiceImpl extends ServiceImpl<QichepinpaiDao, QichepinpaiEntity> implements QichepinpaiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QichepinpaiEntity> page = this.selectPage(
                new Query<QichepinpaiEntity>(params).getPage(),
                new EntityWrapper<QichepinpaiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QichepinpaiEntity> wrapper) {
		  Page<QichepinpaiView> page =new Query<QichepinpaiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<QichepinpaiVO> selectListVO(Wrapper<QichepinpaiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public QichepinpaiVO selectVO(Wrapper<QichepinpaiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<QichepinpaiView> selectListView(Wrapper<QichepinpaiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QichepinpaiView selectView(Wrapper<QichepinpaiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
