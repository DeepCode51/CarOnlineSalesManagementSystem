package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QichepinpaiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QichepinpaiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QichepinpaiView;


/**
 * 汽车品牌
 *
 * @author 
 * @email 
 * @date 2020-11-02 18:40:14
 */
public interface QichepinpaiService extends IService<QichepinpaiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QichepinpaiVO> selectListVO(Wrapper<QichepinpaiEntity> wrapper);
   	
   	QichepinpaiVO selectVO(@Param("ew") Wrapper<QichepinpaiEntity> wrapper);
   	
   	List<QichepinpaiView> selectListView(Wrapper<QichepinpaiEntity> wrapper);
   	
   	QichepinpaiView selectView(@Param("ew") Wrapper<QichepinpaiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QichepinpaiEntity> wrapper);
   	
}

