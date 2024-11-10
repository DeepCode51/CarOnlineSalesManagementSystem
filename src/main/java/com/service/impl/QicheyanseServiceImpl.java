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


import com.dao.QicheyanseDao;
import com.entity.QicheyanseEntity;
import com.service.QicheyanseService;
import com.entity.vo.QicheyanseVO;
import com.entity.view.QicheyanseView;

@Service("qicheyanseService")
public class QicheyanseServiceImpl extends ServiceImpl<QicheyanseDao, QicheyanseEntity> implements QicheyanseService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<QicheyanseEntity> page = this.selectPage(
                new Query<QicheyanseEntity>(params).getPage(),
                new EntityWrapper<QicheyanseEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<QicheyanseEntity> wrapper) {
		  Page<QicheyanseView> page =new Query<QicheyanseView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<QicheyanseVO> selectListVO(Wrapper<QicheyanseEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public QicheyanseVO selectVO(Wrapper<QicheyanseEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<QicheyanseView> selectListView(Wrapper<QicheyanseEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public QicheyanseView selectView(Wrapper<QicheyanseEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}

}
