package com.entity.view;

import com.entity.DingdanzhuangtaiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 订单状态
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
@TableName("dingdanzhuangtai")
public class DingdanzhuangtaiView  extends DingdanzhuangtaiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DingdanzhuangtaiView(){
	}
 
 	public DingdanzhuangtaiView(DingdanzhuangtaiEntity dingdanzhuangtaiEntity){
 	try {
			BeanUtils.copyProperties(this, dingdanzhuangtaiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
