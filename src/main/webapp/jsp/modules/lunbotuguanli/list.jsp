<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
	<%@ include file="../../static/head.jsp"%>
	<link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
		rel="stylesheet">
</head>

<body>
	<div class="wrapper compact-wrapper">
		<%@ include file="../../static/mainHeader.jsp"%>
		<!-- Sidebar -->
		<%@ include file="../../static/sidebar.jsp"%>
		<!--面包屑-->
		<div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<ul class="breadcrumbs">
							<li class="nav-home">
								<a href="#">
									<i class="flaticon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="flaticon-right-arrow"></i>
							</li>
							<li class="nav-item">
								<a href="#">轮播图管理</a>
							</li>
						</ul>
					</div>

					<div class="col-md-12">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">轮播图管理</h4>
										<button id="add-btn" onclick="add()"
											class="btn btn-primary btn-round ml-auto 新增" data-toggle="modal"
											data-target="#addRowModal">
											<i class="fa fa-plus"></i>
											添加
										</button>
										<button id="delete-btn" onclick="deleteMore()"
											class="btn btn-danger btn-round 删除">批量删除</button>
									</div>
								</div>
								<div class="card-body">
									<div class="table-responsive">
										<div id="add-row_wrapper"
											class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
											<div class="row">
												<div class="col-sm-12 col-md-6">
													<div class="dataTables_length" id="add-row_length">
														<label>
															<select name="add-row_length" id="selectPageSize"
																onchange="changePageSize()" aria-controls="add-row"
																class="form-control form-control-sm">
																<option value="10">10</option>
																<option value="25">25</option>
																<option value="50">50</option>
																<option value="100">100</option>
															</select>
															条每页</label>
													</div>
												</div>
												<div class="col-sm-12 col-md-6">
													<div id="add-row_filter" class="dataTables_filter">
														<label>name <input type="text" id="nameSearch"
																class="form-control form-control-sm"
																aria-controls="add-row"></label>
														<button onclick="search()">查询</button>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-12">
													<table id="add-row"
														class="display table table-striped table-hover dataTable no-footer"
														role="grid" aria-describedby="add-row_info">
														<thead>
															<!-- 升序图标class="sorting_asc" 降序改为desc -->
															<tr role="row">
																<th style="width: 10px;"><input type="checkbox"
																		onclick="chooseAll()"></th>
																<th tabindex="0" aria-controls="add-row" rowspan="1"
																	colspan="1">name</th>
																<th tabindex="0" aria-controls="add-row" rowspan="1"
																	colspan="1">value</th>
																<th style="width: 100px;" tabindex="0"
																	aria-controls="add-row" rowspan="1" colspan="1">
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
													<div class="dataTables_info" id="add-row_info" role="status"
														aria-live="polite">当前第 1 页，共 1 页</div>
												</div>
												<div class="col-sm-12 col-md-7">
													<div class="dataTables_paginate paging_simple_numbers"
														id="add-row_paginate">
														<ul class="pagination">
															<li class="paginate_button page-item previous disabled"
																id="add-row_previous">
																<a href="#" onclick="pageNumChange('pre')"
																	aria-controls="add-row" data-dt-idx="0" tabindex="0"
																	class="page-link">上一页</a>
															</li>
															<li class="paginate_button page-item next disabled"
																id="add-row_next">
																<a href="#" onclick="pageNumChange('next')"
																	aria-controls="add-row" data-dt-idx="" tabindex="0"
																	class="page-link">下一页</a>
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
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugin/datatables/datatables.min.js"></script>
	<!-- Atlantis JS -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/atlantis.min.js"></script>
	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<!--<script src="${pageContext.request.contextPath}/resources/assets/js/setting-demo2.js"></script> -->
	<script type="text/javascript" charset="utf-8"
		src="${pageContext.request.contextPath}/resources/assets/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script>
		<%@include file = "../../utils/menu.jsp" %>
		<%@include file = "../../static/setMenu.js" %>
		<%@include file = "../../utils/baseUrl.jsp" %>
		<%@include file = "../../static/getRoleButtons.js" %>
		var tableName = "peizhiguanli";
		var pageType = "list";
		var searchForm = { key: "" };
		var pageIndex = 1;
		var pageSize = 10;
		var totalPage = 0;
		var dataList = [];
		var sortColumn = '';
		var sortOrder = '';
		var ids = [];

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
		function sort(columnName) {
			if (sortColumn == '' || sortColumn != columnName) {
				sortColumn = columnName;
				sortOrder = 'asc';
			}
			if (sortColumn == columnName) {
				if (sortOrder == 'asc') {
					sortOrder = 'desc';
				} else {
					sortOrder = 'asc';
				}
			}
			pageIndex = 1;
			getDataList();
		}

		// 查询
		function search() {
			searchForm.name = "%" + $('#nameSearch').val() + "%";
			getDataList();
		}
		// 获取数据列表
		function getDataList() {
			http("config/page", "GET", {
				page: pageIndex,
				limit: pageSize,
				sort: sortColumn,
				order: sortOrder,
				name: searchForm.name,
			}, (res) => {
				if (res.code == 0) {
					clear();
					dataList = res.data.list;
					totalPage = res.data.totalPage;
					//var tbody = document.getElementById('tbMain');
					for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
						var trow = setDataRow(dataList[i]); //定义一个方法,返回tr数据 
						$('tbody').append(trow);
					}
					pagination(); //渲染翻页组件
				}
			});
		}
		// 渲染表格数据
		function setDataRow(item) {
			//创建行 
			var row = document.createElement('tr');
			row.setAttribute('class', 'useOnce');
			row.setAttribute('role', 'row');
			// 创建 勾选框 列
			var checkbox = document.createElement('td');
			checkbox.innerHTML = "<input type='checkbox' 'name'='chk' 'onclick'= " + 'clickCheckbox(' + item.id + ')' + ">";
			row.appendChild(checkbox);

			var nameCell = document.createElement('td');
			nameCell.innerHTML = item.name;
			row.appendChild(nameCell);

			var valueCell = document.createElement('td');
			var valueImg = document.createElement('img');
			valueImg.setAttribute('height', 100);
			valueImg.setAttribute('width', 100);
			valueImg.setAttribute('src', item.value);
			valueCell.appendChild(valueImg);
			row.appendChild(valueCell);

			// 每行 按钮
			var btnGroup = document.createElement('div');
			btnGroup.setAttribute("class", "form-button-action");

			//编辑按钮
			var editBtn = document.createElement('button');
			var editAttr = 'edit(' + item.id + ')';
			editBtn.setAttribute('onclick', editAttr);
			editBtn.setAttribute("type", "button");
			editBtn.setAttribute("data-toggle", "tooltip");
			editBtn.setAttribute("title", "");
			editBtn.setAttribute("class", "btn btn-link btn-primary btn-lg");
			editBtn.setAttribute("data-original-title", "修改");
			editBtn.innerHTML = "<i class=\"fa fa-edit\"></i>";
			btnGroup.appendChild(editBtn);
			//删除按钮
			var deleteBtn = document.createElement('button');
			var deleteAttr = 'remove(' + item.id + ')';
			deleteBtn.setAttribute('onclick', deleteAttr);
			deleteBtn.setAttribute("type", "button");
			deleteBtn.setAttribute("data-toggle", "tooltip");
			deleteBtn.setAttribute("title", "");
			deleteBtn.setAttribute("class", "btn btn-link btn-danger");
			deleteBtn.setAttribute("data-original-title", "删除");
			deleteBtn.innerHTML = "<i class=\"fa fa-times\"></i>";
			btnGroup.appendChild(deleteBtn);
			var btnsTd = document.createElement('td');
			btnsTd.appendChild(btnGroup);
			row.appendChild(btnsTd);
			return row;
		}
		// 翻页
		function pageNumChange(val) {
			if (val == 'pre') {
				pageIndex--;
			} else if (val == 'next') {
				pageIndex++;
			} else {
				pageIndex = val;
			}
			getDataList();
		}
		// 渲染翻页组件
		function pagination() {
			var beginIndex = pageIndex;
			var endIndex = pageIndex;
			var point = 4;
			//计算页码
			for (var i = 0; i < 3; i++) {
				if (endIndex == totalPage) { break; }
				endIndex++;
				point--;
			}
			for (var i = 0; i < 3; i++) {
				if (beginIndex == 1) { break; }
				beginIndex--;
				point--;
			}
			if (point > 0) {
				while (point > 0) {
					if (endIndex == totalPage) { break; }
					endIndex++;
					point--;
				}
				while (point > 0) {
					if (beginIndex == 1) { break; }
					beginIndex--;
					point--
				}
			}
			// 是否显示 前一页 按钮
			if (beginIndex > 1) {
				$('#add-row_previous').show();
			} else {
				$('#add-row_previous').hide();
			}
			// 渲染页码按钮
			for (var i = beginIndex; i <= endIndex; i++) {
				var pageNum = document.createElement('li');
				pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
				if (pageIndex == i) {
					pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
				} else {
					pageNum.setAttribute('class', 'paginate_button page-item useOnce');
				}
				var pageHref = document.createElement('a');
				pageHref.setAttribute('href', '#');
				pageHref.setAttribute('aria-controls', 'add-row');
				pageHref.setAttribute("data-dt-idx", i);
				pageHref.setAttribute("tabindex", "0");
				pageHref.setAttribute("class", "page-link");
				pageHref.innerHTML = i;
				pageNum.appendChild(pageHref);
				$("#add-row_next").before(pageNum);
			}
			// 是否显示 下一页 按钮
			if (endIndex != totalPage) {
				$('#add-row_next').show();
			} else {
				$('#add-row_next').hide();
			}
			var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
			document.getElementById("add-row_info").innerHTML = pageNumInfo;
		}
		// 跳转到指定页
		function toThatPage() {
			//var index = document.getElementById('pageIndexInput').value;
			if (index < 0 || index > totalPage) {
				alert('请输入正确的页码');
			} else {
				pageNumChange(index);
			}
		}
		// 全选/全不选
		function chooseAll() {
			var boxs = document.getElementsByName("chk");
			for (var i = 0; i < boxs.length; i++) {
				boxs[i].click()
			}
		}
		// 勾选
		function clickCheckbox(id) {
			var index = ids.indexOf(id);
			if (index == -1) {
				ids.push(id);
			} else {
				ids.splice(index, 1);
			}
		}
		// 批量删除
		function deleteMore() {
			if (ids.length == 0) {
				alert('请勾选要删除的记录');
			} else {
				remove(ids);
			}
		}
		// 删除
		function remove(id) {
			var mymessage = confirm("真的要删除吗？");
			if (mymessage == true) {
				var paramArray = [];
				if (id.length > 1) {
					paramArray = id;
				} else {
					paramArray.push(id);
				}
				httpJson("config/delete", "POST", paramArray, (res) => {
					if (res.code == 0) {
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
        <%@include file = "../../static/logout.jsp" %>

			//修改
			function edit(id) {
				window.sessionStorage.setItem('id', id)
				window.location.href = "add-or-update.jsp"
			}

		//清除会重复渲染的节点
		function clear() {
			var elements = document.getElementsByClassName('useOnce');
			for (var i = elements.length - 1; i >= 0; i--) {
				elements[i].parentNode.removeChild(elements[i]);
			}
		}
		//添加
		function add() {
			window.location.href = "add-or-update.jsp"
		}

		$(document).ready(function () {
			$('#projectName').html(projectName)
			//设置左上角系统名
			if (projectName.length > 14) {
				$('.logo-header h2').html(projectName.substring(0, 13) + '..')
			} else {
				$('.logo-header h2').html(projectName)
			}
			//设置右上角用户名
			$('.user-box .u-text h4').html(window.sessionStorage.getItem('username'))
			setMenu();
			<%@include file = "../../static/color.js" %>
			<%@include file = "../../static/style.jsp" %>
				getRoleButtons();
			getDataList();
		});
	</script>
</body>

</html>