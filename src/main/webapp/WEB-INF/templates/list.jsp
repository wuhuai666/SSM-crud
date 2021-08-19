<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 吴淮
  Date: 2021/8/15
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SSMCRUD</title>
    <%
      pageContext.setAttribute("APP_Path",request.getContextPath());
    %>
    <link href="${APP_Path}/static/Bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<%--    http://localhost:8080/SSM_crud/static/--%>
    <script  src="${APP_Path}/static/Bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${APP_Path}/static/js/jquery-1.12.4.min.js"></script>
</head>
<body>
<%--===================搭建界面===================--%>
<div class="container">
<%--    ==============标题================--%>
<div class="row">
    <div class="col-md-12">
        <h1>员工信息管理</h1>
    </div>
</div>
<%--    ================按钮================--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary btn-sm">新增</button>
            <button class="btn btn-danger btn-sm">删除</button>
        </div>
    </div>
<%--    =================显示表格数据=============--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered table-striped">
                <tr>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="page">
                <tr>
                    <th>${page.empId}</th>
                    <th>${page.empName}</th>
                    <th>${page.gender=="1"?"男":"女"}</th>
                    <th>${page.email}</th>
                    <th>${page.department.deptName}</th>
                    <th>
                        <button class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;编辑
                        </button>
                        <button class="btn btn-danger btn-sm">
                            <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>&nbsp;删除
                        </button>
                    </th>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
<%--    ==================显示分页信息=========================--%>
    <div class="row">
<%--        显示分页文字信息--%>
      <div class="col-md-6" style="font-size: 20px">
          当前页码:<span style="color: red">${pageInfo.pageNum}</span>，
          共<span style="color: red">${pageInfo.pages}</span>页，
          共<span style="color: red">${pageInfo.total}</span>条记录.
      </div>
<%--        分页信息--%>
    <div class="col-md-6">
        <nav>
            <ul class="pagination">
                    <li><a href="${APP_Path}/list?pn=1">首页</a>
                    </li>
                <li>
                    <c:if test="${pageInfo.pageNum==1}">
                        <a href="${APP_Path}/list?pn=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span></a>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=1}">
                              <a href="${APP_Path}/list?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span></a>
                    </c:if>
                </li>
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                <li><a href="${APP_Path}/list?pn=${page}">${page}</a></li>
                </c:forEach>
                <li>
<%--                    ======若为末页,则跳转的就是末页--%>
                    <c:if test="${pageInfo.pageNum==pageInfo.pages}">
                    <a href="${APP_Path}/list?pn=${pageInfo.pages}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span></a>
                        </c:if>
                    <c:if test="${pageInfo.pageNum!=pageInfo.pages}">
                    <a href="${APP_Path}/list?pn=${pageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </c:if>
                </li>
                    <li><a href="${APP_Path}/list?pn=${pageInfo.pages}">末页</a></li>
            </ul>
        </nav>
    </div>
    </div>
</div>
</body>
</html>
