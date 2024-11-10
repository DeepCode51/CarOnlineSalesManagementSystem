
/**
 * 轮播图配置
 */
var swiper = {
	// 设定轮播容器宽度，支持像素和百分比
	width: '100%',
	height: '400px',
	// hover（悬停显示）
	// always（始终显示）
	// none（始终不显示）
	arrow: 'none',
	// default（左右切换）
	// updown（上下切换）
	// fade（渐隐渐显切换）
	anim: 'default',
	// 自动切换的时间间隔
	// 默认3000
	interval: 2000,
	// 指示器位置
	// inside（容器内部）
	// outside（容器外部）
	// none（不显示）
	indicator: 'outside'
}

/**
 * 个人中心菜单
 */
var centerMenu = [{
	name: '个人中心',
	url: '../' + localStorage.getItem('userTable') + '/center.jsp'
}, 
{
	name: '我的收藏',
	url: '../storeup/list.jsp'
}
]


var indexNav = [

{
	name: '车辆信息',
	url: './pages/cheliangxinxi/list.jsp'
}, 

{
	name: '新闻资讯',
	url: './pages/news/list.jsp'
},
{
	name: '留言反馈',
	url: './pages/messages/list.jsp'
}
]

var adminurl =  "http://localhost:8080/jspHacDz/index.jsp";

var cartFlag = false

var chatFlag = false




var menu = [{"backMenu":[{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"用户列表","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"buttons":["新增","查看","修改","删除","入库","出库","订购"],"menu":"车辆信息列表","menuJump":"列表","tableName":"cheliangxinxi"}],"menu":"车辆信息管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"汽车品牌列表","menuJump":"列表","tableName":"qichepinpai"}],"menu":"汽车品牌管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"汽车类型列表","menuJump":"列表","tableName":"qicheleixing"}],"menu":"汽车类型管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"汽车颜色列表","menuJump":"列表","tableName":"qicheyanse"}],"menu":"汽车颜色管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"入库记录列表","menuJump":"列表","tableName":"rukujilu"}],"menu":"入库记录管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"出库记录列表","menuJump":"列表","tableName":"chukujilu"}],"menu":"出库记录管理"},{"child":[{"buttons":["新增","查看","修改","删除","审核","支付","收费"],"menu":"车辆购买列表","menuJump":"列表","tableName":"chelianggoumai"}],"menu":"车辆购买管理"},{"child":[{"buttons":["新增","查看","修改","删除","支付","状态"],"menu":"运输收费列表","menuJump":"列表","tableName":"yunshushoufei"}],"menu":"运输收费管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"订单状态列表","menuJump":"列表","tableName":"dingdanzhuangtai"}],"menu":"订单状态管理"},{"child":[{"buttons":["查看","修改","回复","删除"],"menu":"留言板管理","tableName":"liuyanbanguanli"}],"menu":"留言板管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"轮播图管理","tableName":"lunbotuguanli"},{"buttons":["新增","查看","修改","删除"],"menu":"新闻资讯列表","tableName":"news"}],"menu":"系统管理"},{"child":[{"buttons":["新增","查看","修改","删除"],"menu":"管理员管理","tableName":"users"}],"menu":"管理员管理"}],"frontMenu":[{"child":[{"buttons":["查看","订购"],"menu":"车辆信息列表","menuJump":"列表","tableName":"cheliangxinxi"}],"menu":"车辆信息模块"}],"roleName":"管理员","tableName":"users"},{"backMenu":[{"child":[{"buttons":["查看","支付"],"menu":"车辆购买列表","menuJump":"列表","tableName":"chelianggoumai"}],"menu":"车辆购买管理"},{"child":[{"buttons":["查看","支付"],"menu":"运输收费列表","menuJump":"列表","tableName":"yunshushoufei"}],"menu":"运输收费管理"},{"child":[{"buttons":["查看"],"menu":"订单状态列表","menuJump":"列表","tableName":"dingdanzhuangtai"}],"menu":"订单状态管理"},{"child":[{"buttons":["查看","删除"],"menu":"收藏列表","tableName":"storeup"}],"menu":"我的收藏管理"}],"frontMenu":[{"child":[{"buttons":["查看","订购"],"menu":"车辆信息列表","menuJump":"列表","tableName":"cheliangxinxi"}],"menu":"车辆信息模块"}],"roleName":"用户","tableName":"yonghu"}]


var isAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].backMenu.length;j++){
                for(let k=0;k<menus[i].backMenu[j].child.length;k++){
                    if(tableName==menus[i].backMenu[j].child[k].tableName){
                        let buttons = menus[i].backMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}

var isFrontAuth = function (tableName,key) {
    let role = localStorage.getItem("userTable");
    let menus = menu;
    for(let i=0;i<menus.length;i++){
        if(menus[i].tableName==role){
            for(let j=0;j<menus[i].frontMenu.length;j++){
                for(let k=0;k<menus[i].frontMenu[j].child.length;k++){
                    if(tableName==menus[i].frontMenu[j].child[k].tableName){
                        let buttons = menus[i].frontMenu[j].child[k].buttons.join(',');
                        return buttons.indexOf(key) !== -1 || false
                    }
                }
            }
        }
    }
    return false;
}
