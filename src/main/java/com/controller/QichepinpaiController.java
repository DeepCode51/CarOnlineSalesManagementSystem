package com.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.QichepinpaiEntity;
import com.entity.view.QichepinpaiView;

import com.service.QichepinpaiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.CommonUtil;


/**
 * 汽车品牌
 * 后端接口
 * @author 
 * @email 
 * @date 2020-11-02 18:40:14
 */
@RestController
@RequestMapping("/qichepinpai")
public class QichepinpaiController {
    @Autowired
    private QichepinpaiService qichepinpaiService;
    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,QichepinpaiEntity qichepinpai, HttpServletRequest request){

        EntityWrapper<QichepinpaiEntity> ew = new EntityWrapper<QichepinpaiEntity>();
    	PageUtils page = qichepinpaiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qichepinpai), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,QichepinpaiEntity qichepinpai, HttpServletRequest request){
        EntityWrapper<QichepinpaiEntity> ew = new EntityWrapper<QichepinpaiEntity>();
    	PageUtils page = qichepinpaiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, qichepinpai), params), params));
		request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( QichepinpaiEntity qichepinpai){
       	EntityWrapper<QichepinpaiEntity> ew = new EntityWrapper<QichepinpaiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( qichepinpai, "qichepinpai")); 
        return R.ok().put("data", qichepinpaiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QichepinpaiEntity qichepinpai){
        EntityWrapper< QichepinpaiEntity> ew = new EntityWrapper< QichepinpaiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( qichepinpai, "qichepinpai")); 
		QichepinpaiView qichepinpaiView =  qichepinpaiService.selectView(ew);
		return R.ok("查询汽车品牌成功").put("data", qichepinpaiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
        QichepinpaiEntity qichepinpai = qichepinpaiService.selectById(id);
        return R.ok().put("data", qichepinpai);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") String id){
        QichepinpaiEntity qichepinpai = qichepinpaiService.selectById(id);
        return R.ok().put("data", qichepinpai);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QichepinpaiEntity qichepinpai, HttpServletRequest request){
    	qichepinpai.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qichepinpai);

        qichepinpaiService.insert(qichepinpai);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QichepinpaiEntity qichepinpai, HttpServletRequest request){
    	qichepinpai.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(qichepinpai);

        qichepinpaiService.insert(qichepinpai);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody QichepinpaiEntity qichepinpai, HttpServletRequest request){
        //ValidatorUtils.validateEntity(qichepinpai);
        qichepinpaiService.updateById(qichepinpai);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        qichepinpaiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null && !map.get("remindstart").toString().equals("")) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null && !map.get("remindend").toString().equals("")) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<QichepinpaiEntity> wrapper = new EntityWrapper<QichepinpaiEntity>();
		if(map.get("remindstart")!=null && !map.get("remindstart").toString().equals("")) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null && !map.get("remindend").toString().equals("")) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = qichepinpaiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	


}
