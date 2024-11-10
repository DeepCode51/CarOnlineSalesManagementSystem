<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>首页</title>
		<link rel="stylesheet" href="../../layui/css/layui.css">
		<!-- 样式 -->
		<link rel="stylesheet" href="../../css/style.css" />
		<!-- 主题（主要颜色设置） -->
		<link rel="stylesheet" href="../../css/theme.css" />
		<!-- 通用的css -->
		<link rel="stylesheet" href="../../css/common.css" />
	</head>
	<body>

		<div id="app">
			<!-- 轮播图 -->
			<div class="layui-carousel" id="swiper">
				<div carousel-item id="swiper-item">
					<div v-for="(item,index) in swiperList" v-bind:key="index">
						<img class="swiper-item" :src="item.img">
					</div>
				</div>
			</div>
			<!-- 轮播图 -->

			
                                                                                                                                                                                                                                                                                                                                                                        
            
			
																																																																											<!-- 新闻资讯 -->
			<div class="news-home-container">
				<h2 class="index-title"> HOME NEWS </h2>
				<div class="line-container">
					<p class="line"> 新闻资讯 </p>
				</div>
				<div class="layui-row">
					<div class="layui-col-md4 layui-col-md-offset2">
						<div class="layui-collapse" lay-accordion>
							<div class="layui-colla-item" v-for="(item,index) in leftNewsList" v-bind:key="index">
								<h2 @click="jump('../news/detail.jsp?id='+item.id)"  class="layui-colla-title">{{item.title}}</h2>
								<div @click="jump('../news/detail.jsp?id='+item.id)" class="layui-colla-content" :class="index==0?'layui-show':''">
									{{item.content|newsDesc}}...
								</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md4">
						<div class="card-container" v-for="(item,index) in rightNewsList" v-bind:key="index" v-if="item">
							<div @click="jump('../news/detail.jsp?id='+item.id)" class="layui-card">
								<div class="layui-card-header">{{item.title}}</div>
							</div>
						</div>
					</div>
				</div>
				<div style="text-align: center;margin-top: 20px;">
					<button @click="jump('../news/list.jsp')" type="button" class="layui-btn layui-btn-primary">查看更多>></button>
				</div>
			</div>
			<!-- 新闻资讯 -->
																					
			
			
															<!-- 图文列表 -->
			<div class="data-container layui-row">
				<h2 class="index-title"> DATA SHOW </h2>
				<div class="line-container">
					<p class="line"> 车辆信息展示 </p>
				</div>
				<div style="text-align: center;margin-top: 20px;">
					<button @click="jump('../cheliangxinxi/list.jsp')" type="button" class="layui-btn layui-btn-primary">查看更多>></button>
				</div>
				<div class="data-list layui-col-md8 layui-col-md-offset2">
					<div @click="jump('../cheliangxinxi/detail.jsp?id='+item.id)" class="data-item layui-col-md3"  v-for="(item,index) in cheliangxinxiList" v-bind:key="index" v-if="item">
																																																																		
						<img class="cover" :src="item.qichetupian?item.qichetupian.split(',')[0]:''">
						
																																																																																																																																				
																														
						<h3 class="title">{{item.cheliangmingcheng}}</h3>
						
																																																																																																																																																																								
						<div v-if="item.price" class="data">
							<span  class="item price">{{item.price}} RMB</span>
						</div>
					</div>
				</div>
			</div>
			<!-- 图文列表 -->
																																																																																	

		</div>

		<script src="../../layui/layui.js"></script>
		<script src="../../js/vue.js"></script>
		<!-- 组件配置信息 -->
		<script src="../../js/config.js"></script>
		<!-- 扩展插件配置信息 -->
		<script src="../../modules/config.js"></script>
		<!-- 工具方法 -->
		<script src="../../js/utils.js"></script>

		<script>
			var vue = new Vue({
				el: '#app',
				data: {
                    
                    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

                    
					                                                                                cheliangxinxiList: [],
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

                    // 轮播图
					swiperList: [{
						img: '../../img/banner.jpg'
					}],
					// 新闻资讯
					leftNewsList: [],
					rightNewsList: []
				},
				filters: {
					newsDesc: function(val) {
						if (val) {
							if (val.length > 60) {
								return val.substring(0, 60).replace(/<[^>]*>/g).replace(/undefined/g, '');
							} else {
								return val.replace(/<[^>]*>/g).replace(/undefined/g, '');
							}
						}
						return '';
					}
				},
				methods: {
					jump(url) {
						jump(url)
					}
				}
			})

			layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var form = layui.form;
				var carousel = layui.carousel;
				var http = layui.http;
				var jquery = layui.jquery;

				// 获取轮播图 数据
				http.request('config/list', 'get', {
					page: 1,
					limit: 5
				}, function(res) {
					if (res.data.list.length > 0) {
						var swiperItemHtml = '';
						for (let item of res.data.list) {
							if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
								swiperItemHtml +=
									'<div>' +
									'<img class="swiper-item" src="' + item.value + '">' +
									'</div>';
							}
						}
						jquery('#swiper-item').html(swiperItemHtml);
						// 轮播图
						carousel.render({
							elem: '#swiper',
							width: swiper.width,height:swiper.height,
							arrow: swiper.arrow,
							anim: swiper.anim,
							interval: swiper.interval,
							indicator: swiper.indicator
						});
					}
				});
                
                
				                                                                                                                                                                                                                                                                                                                                                                                                // 新闻资讯
				http.request('news/list', 'get', {
					page: 1,
					limit: 8
				}, function(res) {
					var newsList = res.data.list;
					if (newsList.length > 0 && newsList.length <= 2) {
						vue.leftNewsList = res.data.list
					} else {
						var leftNewsList = []
						for (let i = 0; i <= 2; i++) {
							leftNewsList.push(newsList[i]);
						}
						vue.leftNewsList = leftNewsList
					}
					if (newsList.length > 2 && newsList.length <= 8) {
						var rightNewsList = []
						for (let i = 3; i <= newsList.length; i++) {
							rightNewsList.push(newsList[i]);
						}
						vue.rightNewsList = rightNewsList
						console.log('rightNewsList',rightNewsList,vue.rightNewsList)
					}
				});
                                                                                                                
                
                
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
				
                
                                                                                http.request(`cheliangxinxi/list?limit=4`, 'get', {
					page: 1,
					limit: 4
				}, function(res) {
					vue.cheliangxinxiList = res.data.list
				});
                                                                                                                                                                                                                                                                                                                                                                                                                                                
				
			});
		</script>
	</body>
</html>
