<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单商品信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/commodity/orderCommodity/">订单商品信息列表</a></li>
		<shiro:hasPermission name="commodity:orderCommodity:edit"><li><a href="${ctx}/commodity/orderCommodity/form">订单商品信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="orderCommodity" action="${ctx}/commodity/orderCommodity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商品名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商品名称</th>
				<shiro:hasPermission name="commodity:orderCommodity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="orderCommodity">
			<tr>
				<td><a href="${ctx}/commodity/orderCommodity/form?id=${orderCommodity.id}">
					${orderCommodity.name}
				</a></td>
				<shiro:hasPermission name="commodity:orderCommodity:edit"><td>
    				<a href="${ctx}/commodity/orderCommodity/form?id=${orderCommodity.id}">修改</a>
					<a href="${ctx}/commodity/orderCommodity/delete?id=${orderCommodity.id}" onclick="return confirmx('确认要删除该订单商品信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>