package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.YunshushoufeiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.YunshushoufeiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.YunshushoufeiView;


/**
 * 运输收费
 *
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface YunshushoufeiService extends IService<YunshushoufeiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YunshushoufeiVO> selectListVO(Wrapper<YunshushoufeiEntity> wrapper);
   	
   	YunshushoufeiVO selectVO(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
   	
   	List<YunshushoufeiView> selectListView(Wrapper<YunshushoufeiEntity> wrapper);
   	
   	YunshushoufeiView selectView(@Param("ew") Wrapper<YunshushoufeiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YunshushoufeiEntity> wrapper);
   	
}

