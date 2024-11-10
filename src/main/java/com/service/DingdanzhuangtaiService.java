package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DingdanzhuangtaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DingdanzhuangtaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DingdanzhuangtaiView;


/**
 * 订单状态
 *
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface DingdanzhuangtaiService extends IService<DingdanzhuangtaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DingdanzhuangtaiVO> selectListVO(Wrapper<DingdanzhuangtaiEntity> wrapper);
   	
   	DingdanzhuangtaiVO selectVO(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
   	
   	List<DingdanzhuangtaiView> selectListView(Wrapper<DingdanzhuangtaiEntity> wrapper);
   	
   	DingdanzhuangtaiView selectView(@Param("ew") Wrapper<DingdanzhuangtaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DingdanzhuangtaiEntity> wrapper);
   	
}

