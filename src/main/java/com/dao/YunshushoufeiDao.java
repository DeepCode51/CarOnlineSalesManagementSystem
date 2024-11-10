package com.dao;

import com.entity.YunshushoufeiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YunshushoufeiVO;
import com.entity.view.YunshushoufeiView;


/**
 * 运输收费
 * 
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface YunshushoufeiDao extends BaseMapper<YunshushoufeiEntity> {
	
	List<YunshushoufeiVO> selectListVO(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
	
	YunshushoufeiVO selectVO(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
	
	List<YunshushoufeiView> selectListView(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);

	List<YunshushoufeiView> selectListView(Pagination page,@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
	
	YunshushoufeiView selectView(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
	
}
