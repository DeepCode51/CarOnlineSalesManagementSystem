package com.dao;

import com.entity.QicheyanseEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.QicheyanseVO;
import com.entity.view.QicheyanseView;


/**
 * 汽车颜色
 * 
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface QicheyanseDao extends BaseMapper<QicheyanseEntity> {
	
	List<QicheyanseVO> selectListVO(@Param("ew") Wrapper<QicheyanseEntity> wrapper);
	
	QicheyanseVO selectVO(@Param("ew") Wrapper<QicheyanseEntity> wrapper);
	
	List<QicheyanseView> selectListView(@Param("ew") Wrapper<QicheyanseEntity> wrapper);

	List<QicheyanseView> selectListView(Pagination page,@Param("ew") Wrapper<QicheyanseEntity> wrapper);
	
	QicheyanseView selectView(@Param("ew") Wrapper<QicheyanseEntity> wrapper);
	
}
