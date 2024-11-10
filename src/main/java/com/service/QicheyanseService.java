package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.QicheyanseEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.QicheyanseVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.QicheyanseView;


/**
 * 汽车颜色
 *
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
public interface QicheyanseService extends IService<QicheyanseEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<QicheyanseVO> selectListVO(Wrapper<QicheyanseEntity> wrapper);
   	
   	QicheyanseVO selectVO(@Param("ew") Wrapper<QicheyanseEntity> wrapper);
   	
   	List<QicheyanseView> selectListView(Wrapper<QicheyanseEntity> wrapper);
   	
   	QicheyanseView selectView(@Param("ew") Wrapper<QicheyanseEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<QicheyanseEntity> wrapper);
   	
}

