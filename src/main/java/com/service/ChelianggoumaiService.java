package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ChelianggoumaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ChelianggoumaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ChelianggoumaiView;


/**
 * 车辆购买
 *
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface ChelianggoumaiService extends IService<ChelianggoumaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ChelianggoumaiVO> selectListVO(Wrapper<ChelianggoumaiEntity> wrapper);
   	
   	ChelianggoumaiVO selectVO(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
   	
   	List<ChelianggoumaiView> selectListView(Wrapper<ChelianggoumaiEntity> wrapper);
   	
   	ChelianggoumaiView selectView(@Param("ew") Wrapper<ChelianggoumaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ChelianggoumaiEntity> wrapper);
   	
}

