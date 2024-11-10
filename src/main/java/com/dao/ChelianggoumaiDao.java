package com.dao;

import com.entity.ChelianggoumaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ChelianggoumaiVO;
import com.entity.view.ChelianggoumaiView;


/**
 * 车辆购买
 * 
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface ChelianggoumaiDao extends BaseMapper<ChelianggoumaiEntity> {
	
	List<ChelianggoumaiVO> selectListVO(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
	
	ChelianggoumaiVO selectVO(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
	
	List<ChelianggoumaiView> selectListView(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);

	List<ChelianggoumaiView> selectListView(Pagination page,@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
	
	ChelianggoumaiView selectView(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
	
}
