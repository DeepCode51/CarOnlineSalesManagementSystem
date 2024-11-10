package com.entity.view;

import com.entity.QicheyanseEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 汽车颜色
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2020-11-02 18:40:15
 */
@TableName("qicheyanse")
public class QicheyanseView  extends QicheyanseEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public QicheyanseView(){
	}
 
 	public QicheyanseView(QicheyanseEntity qicheyanseEntity){
 	try {
			BeanUtils.copyProperties(this, qicheyanseEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
