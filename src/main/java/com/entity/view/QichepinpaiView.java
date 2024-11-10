package com.entity.view;

import com.entity.QichepinpaiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 汽车品牌
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-11-02 18:40:14
 */
@TableName("qichepinpai")
public class QichepinpaiView  extends QichepinpaiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public QichepinpaiView(){
	}
 
 	public QichepinpaiView(QichepinpaiEntity qichepinpaiEntity){
 	try {
			BeanUtils.copyProperties(this, qichepinpaiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
