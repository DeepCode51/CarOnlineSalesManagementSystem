<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<%@ include file="../../static/head.jsp"%>
</head>
<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="../../static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!--面包屑-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner" style="padding-left: 10px; padding-right: 10px;">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="${pageContext.request.contextPath}/index.jsp">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">车辆信息</a>
							</li>
						</ul>
					</div>

					<div class="col-md-12">
						<div class="col-md-12" style="padding-left: 0; padding-right: 0;">
						<div class="card">
							<div class="card-header">
								<div class="d-flex align-items-center">
									<h4 class="card-title">车辆信息</h4>
									<button id="add-btn" onclick="add()" class="btn btn-primary btn-round ml-auto 新增" data-toggle="modal" data-target="#addRowModal">
										<i class="fa fa-plus"></i>
										添加
									</button>
									<button id="delete-btn" onclick="deleteMore()" class="btn btn-danger btn-round 删除">批量删除</button>
																	</div>
							</div>
							<div class="card-body" style="padding-left: 0; padding-right: 0;">
																<div class="table-responsive">
									<div id="add-row_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
										<div class="row">
											<div class="col-sm-12 col-md-6" id="pageSizeSetting">
												<div class="dataTables_length" id="add-row_length">
													<label>
														<select name="add-row_length" id="selectPageSize" onchange="changePageSize()" aria-controls="add-row" class="form-control form-control-sm" >
															<option value="5">5</option>
															<option value="10">10</option>
															<option value="25">25</option>
															<option value="50">50</option>
														</select> 
													条每页</label>
												</div>
											</div>
										<div class="col-sm-12">
											<div id="add-row_filter" class="dataTables_filter">
																																																																															<label>车辆名称 <input type="text" id="cheliangmingchengSearch" class="form-control form-control-sm" placeholder="" aria-controls="add-row"></label>
																																																																																	<label>车辆品牌</label>
																<select name="cheliangpinpai" id="cheliangpinpaiSelect">
																																</select>
																																																																																	<label>车辆类型</label>
																<select name="cheliangleixing" id="cheliangleixingSelect">
																																</select>
																																																																																																																																																																																																																																																																																																																																						<button onclick="search()">查询</button>
											</div>
										</div>
									</div>
										<div class="row"><div class="col-sm-12"><table id="add-row" class="display table table-striped table-hover dataTable no-footer" role="grid" aria-describedby="add-row_info">
										<thead>
											<!-- 升序图标class="sorting_asc" 降序改为desc -->
											<tr role="row">
													<th style="width: 10px;"><input type="checkbox" onclick="chooseAll()"></th>
																																						<th id="cheliangbianhaoTh" class="sorting" onclick="sort('cheliangbianhao')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆编号</th>
																																																			<th id="cheliangmingchengTh" class="sorting" onclick="sort('cheliangmingcheng')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆名称</th>
																																																			<th id="cheliangpinpaiTh" class="sorting" onclick="sort('cheliangpinpai')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆品牌</th>
																																																			<th id="cheliangleixingTh" class="sorting" onclick="sort('cheliangleixing')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆类型</th>
																																																			
																													<th tabindex="0" aria-controls="add-row" rowspan="1" colspan="1" style="min-width: 100px;">汽车图片</th>
																																																																	<th id="cheliangyanseTh" class="sorting" onclick="sort('cheliangyanse')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆颜色</th>
																																																			<th id="huandangfangshiTh" class="sorting" onclick="sort('huandangfangshi')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">换挡方式</th>
																																																			<th id="cheliangtianchuangTh" class="sorting" onclick="sort('cheliangtianchuang')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆天窗</th>
																																																			<th id="chezuoTh" class="sorting" onclick="sort('chezuo')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车座</th>
																																																			<th id="qichepailiangTh" class="sorting" onclick="sort('qichepailiang')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">汽车排量</th>
																																																			<th id="cheliangjiageTh" class="sorting" onclick="sort('cheliangjiage')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆价格</th>
																																																			<th id="cheliangkucunTh" class="sorting" onclick="sort('cheliangkucun')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆库存</th>
																																																			<th id="cheliangxiangqingTh" class="sorting" onclick="sort('cheliangxiangqing')" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">车辆详情</th>
																																						
																																						
																																					<th style="width: 100px;" tabindex="0" aria-controls="add-row" rowspan="1" colspan="1">
													操作
												</th>
											</tr>
										</thead>
										<tbody>							
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="add-row_info" role="status" aria-live="polite">当前第 1 页，共 1 页</div>
								</div>
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers" id="add-row_paginate">
										<ul class="pagination">
											<li class="paginate_button page-item previous disabled" id="add-row_previous">
												<a href="#" onclick="pageNumChange('pre')" aria-controls="add-row" data-dt-idx="0" tabindex="0" class="page-link">上一页</a>
											</li>
											<li class="paginate_button page-item next disabled" id="add-row_next">
												<a href="#" onclick="pageNumChange('next')" aria-controls="add-row" data-dt-idx="" tabindex="0" class="page-link">下一页</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
								</div>
								</div>
							</div>
						</div>
					</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- End Custom template -->
	
	<!--   Core JS Files   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/core/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	
	<!-- jQuery Scrollbar -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Atlantis JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script> -->
	<script language="javascript" type="text/javascript" src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
	<script >
		<%@ include file="../../utils/menu.jsp"%>
		<%@ include file="../../static/setMenu.js"%>
		<%@ include file="../../utils/baseUrl.jsp"%>
		<%@ include file="../../static/getRoleButtons.js"%>
		<%@ include file="../../static/crossBtnControl.js"%>
		var tableName = "cheliangxinxi";
		var pageType = "list";
	  	var searchForm = { key: ""};
		var pageIndex = 1;
		var pageSize = 10;
		var totalPage = 0;
		var dataList = [];
		var sortColumn = '';
		var sortOrder= '';
		var ids = [];
		var checkAll = false;
		
					      				      							var cheliangpinpaiOptions = [];
			      							var cheliangleixingOptions = [];
			      				      							var cheliangyanseOptions = [];
			      				      				      				      				      				      				      				      				      				      			  
		function init() {
			// 满足条件渲染提醒接口
																																																																																																														}
		// 改变每页记录条数
		function changePageSize() {
		    var selection = document.getElementById('selectPageSize');
		    var index = selection.selectedIndex;
			pageSize = selection.options[index].value;
			getDataList();
        }
		//排序
		function sort(columnName){
			var iconId = '#'+columnName+'Th'
			$('.sorting_asc').attr('class','sorting')
			$('.sorting_desc').attr('class','sorting')
			if(sortColumn == '' || sortColumn != columnName){
				sortColumn = columnName;
				sortOrder = 'asc';
				$(iconId).attr('class','sorting_asc');
			}
			if(sortColumn == columnName){
				if(sortOrder == 'asc'){
					sortOrder = 'desc';
					$(iconId).attr('class','sorting_desc');
				}else{
					sortOrder = 'asc';
					$(iconId).attr('class','sorting_asc');
				}
			}
			pageIndex = 1;
			getDataList();
		}
			
		// 查询
		function search(){
			searchForm = { key: ""};
																								if($('#cheliangmingchengSearch').val() != null && $('#cheliangmingchengSearch').val() != ''){
						searchForm.cheliangmingcheng ="%" +  $('#cheliangmingchengSearch').val() + "%";
					}				
																										var cheliangpinpaiIndex = document.getElementById("cheliangpinpaiSelect").selectedIndex;
					var cheliangpinpaiOptions = document.getElementById("cheliangpinpaiSelect").options;
					var cheliangpinpaiSelectedOption = cheliangpinpaiOptions[cheliangpinpaiIndex]
					if(cheliangpinpaiSelectedOption.text != null &&  cheliangpinpaiSelectedOption.text != ''){
						searchForm.cheliangpinpai = "%" + cheliangpinpaiSelectedOption.text + "%";
					}		
																										var cheliangleixingIndex = document.getElementById("cheliangleixingSelect").selectedIndex;
					var cheliangleixingOptions = document.getElementById("cheliangleixingSelect").options;
					var cheliangleixingSelectedOption = cheliangleixingOptions[cheliangleixingIndex]
					if(cheliangleixingSelectedOption.text != null &&  cheliangleixingSelectedOption.text != ''){
						searchForm.cheliangleixing = "%" + cheliangleixingSelectedOption.text + "%";
					}		
																																																																																												getDataList();
		}
		// 获取数据列表
        function getDataList() {
			http("cheliangxinxi/page","GET",{
				page: pageIndex,
				limit: pageSize,
				sort: sortColumn,
				order: sortOrder,
																															cheliangmingcheng : searchForm.cheliangmingcheng,	
																																	cheliangpinpai : searchForm.cheliangpinpai,	
																																	cheliangleixing : searchForm.cheliangleixing,	
																																																																																																																					},(res)=>{
				if(res.code == 0){
					clear();
					dataList = res.data.list;
					totalPage = res.data.totalPage;
					//var tbody = document.getElementById('tbMain');
					for(var i = 0;i < dataList.length; i++){ //遍历一下表格数据  
						var trow = setDataRow(dataList[i]); //定义一个方法,返回tr数据 
						$('tbody').append(trow); 
					}
					pagination(); //渲染翻页组件
					getRoleButtons();//按钮权限控制
				}
			});
        }
		// 渲染表格数据
		function setDataRow(item){
			//创建行 
			var row = document.createElement('tr'); 
			row.setAttribute('class','useOnce');
			row.setAttribute('role','row');
			// 创建 勾选框 列
			var checkbox = document.createElement('td');
			checkbox.innerHTML = "<input type='checkbox' name='chk' value=" + item.id +">";
			row.appendChild(checkbox);

							var cheliangbianhaoCell  = document.createElement('td');

												 cheliangbianhaoCell.innerHTML = item.cheliangbianhao;

                
													row.appendChild(cheliangbianhaoCell);
				
            				var cheliangmingchengCell  = document.createElement('td');

												 cheliangmingchengCell.innerHTML = item.cheliangmingcheng;

                
													row.appendChild(cheliangmingchengCell);
				
            				var cheliangpinpaiCell  = document.createElement('td');

												  cheliangpinpaiCell.innerHTML = item.cheliangpinpai; 
				  
                
													row.appendChild(cheliangpinpaiCell);
				
            				var cheliangleixingCell  = document.createElement('td');

												  cheliangleixingCell.innerHTML = item.cheliangleixing; 
				  
                
													row.appendChild(cheliangleixingCell);
				
            				var qichetupianCell  = document.createElement('td');

								                  var qichetupianImg = document.createElement('img');
				  qichetupianImg.setAttribute('src',item.qichetupian);
				  qichetupianImg.setAttribute('height','100px');
				  qichetupianImg.setAttribute('width','100px');
				  qichetupianCell.appendChild(qichetupianImg);

				
													row.appendChild(qichetupianCell);
				
            				var cheliangyanseCell  = document.createElement('td');

												  cheliangyanseCell.innerHTML = item.cheliangyanse; 
				  
                
													row.appendChild(cheliangyanseCell);
				
            				var huandangfangshiCell  = document.createElement('td');

												  huandangfangshiCell.innerHTML = item.huandangfangshi; 
				  
                
													row.appendChild(huandangfangshiCell);
				
            				var cheliangtianchuangCell  = document.createElement('td');

												  cheliangtianchuangCell.innerHTML = item.cheliangtianchuang; 
				  
                
													row.appendChild(cheliangtianchuangCell);
				
            				var chezuoCell  = document.createElement('td');

												  chezuoCell.innerHTML = item.chezuo; 
				  
                
													row.appendChild(chezuoCell);
				
            				var qichepailiangCell  = document.createElement('td');

												 qichepailiangCell.innerHTML = item.qichepailiang;

                
													row.appendChild(qichepailiangCell);
				
            				var cheliangjiageCell  = document.createElement('td');

												 cheliangjiageCell.innerHTML = item.cheliangjiage;

                
													row.appendChild(cheliangjiageCell);
				
            				var cheliangkucunCell  = document.createElement('td');

												 cheliangkucunCell.innerHTML = item.cheliangkucun;

                
													row.appendChild(cheliangkucunCell);
				
            				var cheliangxiangqingCell  = document.createElement('td');

												  //如果图文详情包含图片
				  if(item.cheliangxiangqing && item.cheliangxiangqing.indexOf('img') != -1){
					//暂时只考虑图片+文字 和 文字+图片的情况
					var beginIndex = item.cheliangxiangqing.indexOf('<img');
					var endIndex = item.cheliangxiangqing.indexOf('>');				
					cheliangxiangqingCell.innerHTML = item.cheliangxiangqing.substring(beginIndex, endIndex+1).replace("img","img width='100' height='100'");				
				  }else{
				  	 if(item.cheliangxiangqing != null && item.cheliangxiangqing != "" && item.cheliangxiangqing.length >= 11){
				  		cheliangxiangqingCell.innerHTML = item.cheliangxiangqing.substring(0, 10) + "..."; 
				  	}else{
				  		cheliangxiangqingCell.innerHTML = item.cheliangxiangqing;
				 	}
				  }

                
													row.appendChild(cheliangxiangqingCell);
				
            				var thumbsupnumCell  = document.createElement('td');

								
                
								
				
            				var crazilynumCell  = document.createElement('td');

								
                
								
				
            			// 每行 按钮
			var btnGroup = document.createElement('div');
			btnGroup.setAttribute("class","form-button-action");
			
			
				//跨表按钮
				var crossBtn = document.createElement('button');
				crossBtn.innerHTML = "入库"
				crossBtn.setAttribute("type","button")
				crossBtn.setAttribute("class","btn btn-secondary btn-xs");
				crossBtn.setAttribute("data-original-title","入库");
				crossBtn.setAttribute("onclick","crossTable(" + item.id +",\"rukujilu\")");
				if(crossBtnControl('入库') == true){
					btnGroup.appendChild(crossBtn);
				}   
				var crossBtn = document.createElement('button');
				crossBtn.innerHTML = "出库"
				crossBtn.setAttribute("type","button")
				crossBtn.setAttribute("class","btn btn-secondary btn-xs");
				crossBtn.setAttribute("data-original-title","出库");
				crossBtn.setAttribute("onclick","crossTable(" + item.id +",\"chukujilu\")");
				if(crossBtnControl('出库') == true){
					btnGroup.appendChild(crossBtn);
				}   
				var crossBtn = document.createElement('button');
				crossBtn.innerHTML = "订购"
				crossBtn.setAttribute("type","button")
				crossBtn.setAttribute("class","btn btn-secondary btn-xs");
				crossBtn.setAttribute("data-original-title","订购");
				crossBtn.setAttribute("onclick","crossTable(" + item.id +",\"chelianggoumai\")");
				if(crossBtnControl('订购') == true){
					btnGroup.appendChild(crossBtn);
				}   

			//编辑按钮
			var editBtn = document.createElement('button');
			var editAttr = 'edit(' +  item.id + ')';
			editBtn.setAttribute('onclick',editAttr);
			editBtn.setAttribute("type","button");
			editBtn.setAttribute("class","btn btn-warning btn-xs 修改");
			editBtn.innerHTML = "修改";
			btnGroup.appendChild(editBtn);
			//删除按钮
			var deleteBtn = document.createElement('button');
			var deleteAttr = 'remove(' +  item.id + ')';
			deleteBtn.setAttribute('onclick',deleteAttr);
			deleteBtn.setAttribute("type","button");
			deleteBtn.setAttribute("class","btn btn-danger btn-xs 删除");
			deleteBtn.innerHTML = "删除";
			btnGroup.appendChild(deleteBtn);
			var btnsTd = document.createElement('td');
			btnsTd.appendChild(btnGroup);
			row.appendChild(btnsTd);
			return row;
		}
		// 翻页
        function pageNumChange(val) {
            if(val == 'pre') {
                pageIndex--;
            }else if(val == 'next'){
                pageIndex++;
            }else{
                pageIndex = val;
            }
			getDataList();
        }
		// 下载
		function download(url){
			window.open(url);
		}
		// 打开新窗口播放媒体
		function mediaPlay(url){
			window.open(url);
		}
		// 渲染翻页组件
		function pagination() {
			var beginIndex = pageIndex;
			var endIndex = pageIndex;
			var point = 4;
			//计算页码
			for(var i=0;i<3;i++){
				if(endIndex==totalPage){ break;}
				endIndex++;
				point--;
			}
			for(var i=0;i<3;i++){
				if(beginIndex==1){break;}
				beginIndex--;
				point--;
			}
			if(point>0){
				while (point>0){
					if(endIndex==totalPage){ break;}
					endIndex++;
					point--;
				}
				while (point>0){
					if(beginIndex==1){ break;}
					beginIndex--;
					point--
				}
			}
			// 是否显示 前一页 按钮
			if(pageIndex>1){
				$('#add-row_previous').show();
			}else{
				$('#add-row_previous').hide();
			}
			// 渲染页码按钮
			for(var i=beginIndex;i<=endIndex;i++){
				var pageNum = document.createElement('li');
				pageNum.setAttribute('onclick',"pageNumChange("+i+")");
				if(pageIndex == i){
					pageNum.setAttribute('class','paginate_button page-item active useOnce');
				}else{
					pageNum.setAttribute('class','paginate_button page-item useOnce');
				}
				var pageHref = document.createElement('a');
				pageHref.setAttribute('href','#');
				pageHref.setAttribute('aria-controls','add-row');
				pageHref.setAttribute("data-dt-idx",i);
				pageHref.setAttribute("tabindex","0");
				pageHref.setAttribute("class","page-link");
				pageHref.innerHTML = i;
				pageNum.appendChild(pageHref);
				$("#add-row_next").before(pageNum);
			}
			// 是否显示 下一页 按钮
			if(pageIndex < totalPage){
				$('#add-row_next').show();
			}else{
				$('#add-row_next').hide();
			}
			var pageNumInfo = "当前第 "+ pageIndex + " 页，共 "+ totalPage + " 页";
			document.getElementById("add-row_info").innerHTML = pageNumInfo;
		}
		// 跳转到指定页
		function toThatPage(){
			//var index = document.getElementById('pageIndexInput').value;
			if(index<0 || index>totalPage){
				alert('请输入正确的页码');
			}else {
				pageNumChange(index);
			}
		}
		// 全选/全不选
		function chooseAll(){
			checkAll = !checkAll;
			var boxs = document.getElementsByName("chk");
			for(var i=0;i<boxs.length;i++){
				boxs[i].checked= checkAll;
			}
		}
		// 批量删除
		function deleteMore(){
			ids = []
			var boxs = document.getElementsByName("chk");
			for(var i=0;i<boxs.length;i++){
				if(boxs[i].checked){
					ids.push(boxs[i].value)
				}
			}
			if(ids.length == 0){
				alert('请勾选要删除的记录');
			}else{
				remove(ids);
			}
		}
		// 删除
        function remove(id) { 
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
				var paramArray = [];
				if (id == ids){
					paramArray = id;
				}else{
					paramArray.push(id);
				}             
				httpJson("cheliangxinxi/delete","POST",paramArray,(res)=>{
					if(res.code == 0){
						alert('删除成功');
						getDataList();		
					}
				});
            }
            else {
                alert("已取消操作");
            }
        }
		// 用户登出
        <%@ include file="../../static/logout.jsp"%>

		//修改
        function edit(id) {
            window.sessionStorage.setItem('id', id)
            window.location.href = "add-or-update.jsp"
        }

		//清除会重复渲染的节点
        function clear(){
        	var elements = document.getElementsByClassName('useOnce');
        	for(var i = elements.length - 1; i >= 0; i--) { 
        	  elements[i].parentNode.removeChild(elements[i]); 
        	}
        }
		//添加
		function add(){
			window.location.href = "add-or-update.jsp"
		}
		//单列求和
		function getSum(colName){
			http("cheliangxinxi" + colName,"GET",{
				tableName: "cheliangxinxi",
				columnName: colName
			},(res)=>{
				if(res.code == 0){
					return res.data.sum;
				}
			});
		}
																																																																													
		// 查看详情
		function detail(id){
			window.sessionStorage.setItem("id", id);
			//window.sessionStorage.setItem("ifView", true);
			window.location.href = "info.jsp";
		}

																			function cheliangpinpaiSelect(){
					//填充下拉框选项
					http("option/qichepinpai/cheliangpinpai","GET",{},(res)=>{
						if(res.code == 0){
							cheliangpinpaiOptions = res.data;
							var nullOption = document.createElement('option');
							var cheliangpinpaiSelect = document.getElementById('cheliangpinpaiSelect');
							cheliangpinpaiSelect.appendChild(nullOption);
							for(var i=0;i<cheliangpinpaiOptions.length;i++){
								var cheliangpinpaiOption = document.createElement('option');
								cheliangpinpaiOption.setAttribute('name','cheliangpinpaiOption');
								cheliangpinpaiOption.setAttribute('value',cheliangpinpaiOptions[i]);
								cheliangpinpaiOption.innerHTML = cheliangpinpaiOptions[i];
								cheliangpinpaiSelect.appendChild(cheliangpinpaiOption);
							}
						}
					});
				}
												function cheliangleixingSelect(){
					//填充下拉框选项
					http("option/qicheleixing/cheliangleixing","GET",{},(res)=>{
						if(res.code == 0){
							cheliangleixingOptions = res.data;
							var nullOption = document.createElement('option');
							var cheliangleixingSelect = document.getElementById('cheliangleixingSelect');
							cheliangleixingSelect.appendChild(nullOption);
							for(var i=0;i<cheliangleixingOptions.length;i++){
								var cheliangleixingOption = document.createElement('option');
								cheliangleixingOption.setAttribute('name','cheliangleixingOption');
								cheliangleixingOption.setAttribute('value',cheliangleixingOptions[i]);
								cheliangleixingOption.innerHTML = cheliangleixingOptions[i];
								cheliangleixingSelect.appendChild(cheliangleixingOption);
							}
						}
					});
				}
																																																												
		function crossTable(id,crossTabName){
			window.sessionStorage.setItem('crossTableId',id);
			window.sessionStorage.setItem('crossTableName',"cheliangxinxi");
			var url = "../"+crossTabName+"/add-or-update.jsp";
			window.location.href = url;
        }

        
				$(document).ready(function() { 			
			$('#projectName').html(projectName)
			setMenu();
			//设置左上角系统名
			if(projectName.length >14){
				$('.logo-header h2').html(projectName.substring(0,13)+'..')
			}else{
				$('.logo-header h2').html(projectName)
			}
			//设置右上角用户名
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			<%@ include file="../../static/color.js"%>
			<%@ include file="../../static/style.jsp"%>
			init();
            getDataList();
																						cheliangpinpaiSelect();	
													cheliangleixingSelect();	
																																																																											<%@ include file="../../static/myInfo.js"%>
		});
	</script>
</body>
</html>