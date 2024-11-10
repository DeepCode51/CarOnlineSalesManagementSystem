package com.dao;

import com.entity.DingdanzhuangtaiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DingdanzhuangtaiVO;
import com.entity.view.DingdanzhuangtaiView;


/**
 * 订单状态
 * 
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface DingdanzhuangtaiDao extends BaseMapper<DingdanzhuangtaiEntity> {
	
	List<DingdanzhuangtaiVO> selectListVO(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
	
	DingdanzhuangtaiVO selectVO(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
	
	List<DingdanzhuangtaiView> selectListView(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);

	List<DingdanzhuangtaiView> selectListView(Pagination page,@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
	
	DingdanzhuangtaiView selectView(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
	
}
