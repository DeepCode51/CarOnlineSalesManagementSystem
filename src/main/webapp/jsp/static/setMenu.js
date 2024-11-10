		function setMenu(){
			$('#navUl').append("<li class=\"nav-item\" style=\"background: white;\"><a data-toggle=\"collapse\" href=\"#table0\" class=\"collapsed\" aria-expanded=\"false\"><i class=\"fas fa-table\" style=\"\"></i><p style=\"\">个人中心</p><span class=\"caret\"></span></a><div class=\"collapse\" id=\"table0\" style=\"\"><ul class=\"nav nav-collapse\"><li><a href="+baseUrl+"jsp/modules/center/updatePassword.jsp"+"><span class=\"sub-item\">修改密码</span></a></li><li><a id=\"myinfo\" href="+baseUrl+"jsp/modules/center/info.jsp"+"><span class=\"sub-item\">个人信息</span></a></li></ul></div></li>")
			var role = window.sessionStorage.getItem('role');
			for(var i=0;i<menus.length;i++){
				// 找到当前登录角色的菜单
				if(menus[i].roleName == role){
					var menu = menus[i].backMenu;
					for(var j=0;j<menu.length;j++){  
						// 一级菜单
						var menuItem = document.createElement('li');
						menuItem.setAttribute('class','nav-item');
						menuItem.setAttribute('style','background: white;');
						
						var itemHref = document.createElement('a');
						var count = j+1
						itemHref.setAttribute('data-toggle','collapse');
						itemHref.setAttribute('href','#table'+count);
						itemHref.innerHTML = "<i class=\"fas fa-table\" style=\"\"></i><p style=\"\">"+menu[j].menu + "</p><span class=\"caret\"></span>";		
						
						menuItem.appendChild(itemHref);
						
						var menuChildDiv = document.createElement('div');
						menuChildDiv.setAttribute('class','collapse');
						menuChildDiv.setAttribute('id','table'+count);
						
						var menuChild = menu[j].child;
						
						var menuChildUl = document.createElement('ul');
						menuChildUl.setAttribute('class','nav nav-collapse');
						//menuChildUl.setAttribute('style','display: block;');
						var secondMenuName = "";
						var count = 0;
						for(var k=0;k<menuChild.length;k++){  
							// 二级菜单
							var menuChildLi = document.createElement('li');
							var menuChildHref = document.createElement('a');
							
							if(secondMenuName == menuChild[k].tableName && secondMenuName != ""){
								var childHrefAttr = "${pageContext.request.contextPath}/jsp/modules/" + menuChild[k].tableName + "/graph.jsp" ;
								
								
							}else{
								var childHrefAttr = "${pageContext.request.contextPath}/jsp/modules/" + menuChild[k].tableName + "/list.jsp" ;
								secondMenuName = menuChild[k].tableName;
								count = 1;
							}
							menuChildHref.setAttribute('href',childHrefAttr);
							menuChildHref.innerHTML = "<span class=\"sub-item\">" + menuChild[k].menu + '</span>';
							menuChildLi.appendChild(menuChildHref);
							menuChildUl.appendChild(menuChildLi);
						}
						menuChildDiv.appendChild(menuChildUl);
						menuItem.appendChild(menuChildDiv);
						$('#navUl').append(menuItem);
					}
				}
			}
			if(hasMessage != null && hasMessage == '是'  && role == '管理员'){
				$('#navUl').append("<li class=\"nav-item\" style=\"background: white;\"><a data-toggle=\"collapse\" href=\"#table50\" class=\"collapsed\" aria-expanded=\"false\"><i class=\"fas fa-table\" style=\"\"></i><p style=\"\">留言管理</p><span class=\"caret\"></span></a><div class=\"collapse\" id=\"table50\" style=\"\"><ul class=\"nav nav-collapse\"><li><a href="+baseUrl+"jsp/modules/messages/list.jsp"+"><span class=\"sub-item\">留言列表</span></a></li></ul></div></li>");
			}
		}