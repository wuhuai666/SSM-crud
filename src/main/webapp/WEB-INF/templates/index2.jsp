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
    <title>员工信息管理</title>
    <%
        pageContext.setAttribute("APP_Path",request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_Path}/static/js/jquery-1.12.4.min.js"></script>
    <link href="${APP_Path}/static/Bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <%--    http://localhost:8080/SSM_crud/static/--%>
    <script  src="${APP_Path}/static/Bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
<%--================员工添加信息模态框=================--%>
<div class="modal fade" id="emp_addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工信息添加</h4>
            </div>
            <div class="modal-body">
<%--          =================表单提交模块==============--%>
                <form class="form-horizontal">
<%--                    ======员工姓名=====================--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
<%--    =================添加邮件============--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add" placeholder="email@guigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
<%--    ============性别=======================--%>
    <div class="form-group">
        <label class="col-sm-2 control-label">gender</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <input type="radio" name="gender" id="gender_add_male" value="1" checked="checked"> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="gender" id="gender_add_female" value="0"> 女
            </label>
        </div>
    </div>
<%--===========部门下拉列表==========--%>
    <div class="form-group">
        <label  class="col-sm-2 control-label">deptName</label>
<%--        ====部门id提交--%>
        <div class="col-sm-10">
            <select class="form-control" name="dId" id="selectDept">

            </select>
        </div>
    </div>
                </form>
            </div>
            <%--          =================表单提交模块==============--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="save">添加</button>
            </div>
        </div>
    </div>
</div>
<%--================员工修改信息模态框=================--%>
<div class="modal fade" id="emp_updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工信息修改</h4>
            </div>
            <div class="modal-body">
                <%--          =================表单提交模块==============--%>
                <form class="form-horizontal">
                    <%--                    ======员工姓名=====================--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--    =================修改邮件============--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update" placeholder="email@guigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--    ============性别=======================--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_male" value="1" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_female" value="0"> 女
                            </label>
                        </div>
                    </div>
                    <%--===========部门下拉列表==========--%>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <%--        ====部门id提交--%>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="updateDept">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%--          =================表单提交模块==============--%>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="update">更新</button>
            </div>
        </div>
    </div>
</div>
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
            <button class="btn btn-primary btn-sm" id="emp_add">新增</button>
            <button class="btn btn-danger btn-sm" id="emp_delete">删除</button>
        </div>
    </div>
    <%--    =================显示表格数据=============--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered table-striped" id="emp_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="checked_all"/>
                    </th>
                    <th>id</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
<%--                显示数据--%>
                </tbody>
            </table>
        </div>
    </div>
    <%--    ==================显示分页信息=========================--%>
    <div class="row">
        <%--        显示分页文字信息--%>
        <div class="col-md-6" style="font-size: 20px" id="pageInfo">

        </div>
        <%--   ===============分页条信息===========--%>
        <div class="col-md-6" id="page_nav">

        </div>
    </div>
</div>
<script type="text/javascript">
    //页面加载完成后,发起ajax请求,要到分页的数据,默认首页
    var totalPerson=9999,currentPage;
    $(function () {
        to_page(1)
    })
    function to_page(pn) {
        $.ajax({ //发起ajax请求
            url:"${APP_Path}/emps",//发起请求
            data:"pn="+pn,//请求参数
            type:"GET",//请求方式
            success:function(pageInfo) {
                //1 解析并显示员工信息
                build_employee_table(pageInfo);
                //2.显示分页信息
                build_pageInfo(pageInfo);
                //3.显示分页条信息
                build_page_nav(pageInfo);
            }
        })
    }
    //======================显示员工信息====================
    function build_employee_table(pageInfo) {
        //每次刷新时清空上一次的数据展示
        $("#emp_table tbody").empty();
        //=====得到员工信息集合
           var emps=pageInfo.map.pageInfo.list;
           //===遍历出员工信息并插入到td标签中
           $.each(emps,function (index,item) {
               var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>")
               var empIdTd=$("<td></td>").append(item.empId);
               var empNameTd=$("<td></td>").append(item.empName);
               var genderTd=$("<td></td>").append(item.gender=="1"?"男":"女");
               var emailTd=$("<td></td>").append(item.email);
               var deptNameTd=$("<td></td>").append(item.department.deptName);
              //===编辑按钮
               var  editBtn=$("<button></button>").addClass("btn btn-primary btn-sm editBtn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
               //为编辑按钮赋值
               editBtn.attr("edit-id",item.empId);
               //链式追加:返回的值相同,删除按钮
               var  deleteBtn=$("<button></button>").addClass("btn btn-danger btn-sm deleteBtn").append($("<span></span>").addClass("glyphicon glyphicon-remove-circle")).append("删除");
               //为删除按钮赋值
               deleteBtn.attr("delete-id",item.empId);
               var  btnTd=$("<td></td>").append(editBtn).append(" ").append(deleteBtn);
               //===加入表格中
               $("<tr></tr>").append(checkBoxTd).append(empIdTd)
                             .append(empNameTd)
                             .append(genderTd)
                             .append(emailTd)
                             .append(deptNameTd)
                             .append(btnTd)
                              .appendTo("#emp_table tbody");
           })
    }
    //=======================解析分页信息=========================
    function build_pageInfo(pageInfo) {
        //==清理上一次展示的数据
        $("#pageInfo").empty();
        //==展示页码信息
          $("#pageInfo").append(" 当前页码:"+pageInfo.map.pageInfo.pageNum+"总页数:"
              +pageInfo.map.pageInfo.pages+"共有:"+pageInfo.map.pageInfo.total+"条数据");
          totalPerson=pageInfo.map.pageInfo.total;
          currentPage=pageInfo.map.pageInfo.pageNum;
    }
    //========================解析分页条=========================
    function build_page_nav(pageInfo) {
        //==清理上一次展示的数据
        $("#page_nav").empty();
          var ul=$("<ul></ul>").addClass("pagination");
          var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
          var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
          //若没有上一页(即当前页为首页) 则不可点击
          if (pageInfo.map.pageInfo.hasPreviousPage==false){
              firstPageLi.addClass("disabled");
              prePageLi.addClass("disabled");
          }
          //为元素添加翻页事件,首页
          firstPageLi.click(function () {
              to_page(1);
          })
         //上一页
        prePageLi.click(function () {
              to_page(pageInfo.map.pageInfo.pageNum-1);
        })

          var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
          var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        //若没有下一页(即当前页为末页) 则不可点击
          if (pageInfo.map.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }
          //最后一页
        lastPageLi.click(function () {
            to_page(pageInfo.map.pageInfo.pages);
        })
        //下一页
        nextPageLi.click(function () {
            to_page(pageInfo.map.pageInfo.pageNum+1);
        })
          ul.append(firstPageLi).append(prePageLi);
          $.each(pageInfo.map.pageInfo.navigatepageNums,function (index,item) {
                  var numLi=$("<li></li>").append($("<a></a>").append(item));
                  //把当前页显示高亮
                  if (pageInfo.map.pageInfo.pageNum==item){
                      numLi.addClass("active");
                  }
                  //每个页码设置点击跳转
                  numLi.click(function () {
                        to_page(item);
                  })
                  ul.append(numLi);
          });
          ul.append(nextPageLi).append(lastPageLi);
          var navEle=$("<nav></nav>").append(ul);
          navEle.appendTo("#page_nav");
    }
    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //=============得到部门信息===========
    function getDepts(ele){
        $(ele).empty();
        $.ajax({
            url: "${APP_Path}/depts",
            type:"GET",
            success:function (depts) {
                $("#selectDept").empty();
                //遍历显示部门信息
                $.each(depts.map.depts,function () {
                    var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                })
            }
        })
    }
     //====================员工添加事件===============
     $("#emp_add").click(function () {
         //每次点击添加时,先清空样式
         reset_form("#emp_addModal form");
         //发送ajax请求,查出部门信息,显示下拉列表
          getDepts("#emp_addModal select");

         $("#emp_addModal").modal({
             backdrop:"static"
         });
     })
    //校验数据是否合法
    function test_data(){
        var empName=$("#empName_add").val();
        var empNameTest=/(^[a-z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
        var email=$("#email_add").val();
        var emailTest=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
       //检验姓名是否正确
        if (!empNameTest.test(empName)){
            show_validate_msg("#empName_add", "error", "用户名可以是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_validate_msg("#empName_add", "success", "");
        }
        //检验邮箱格式是否正确
        if (!emailTest.test(email)){
            show_validate_msg("#email_add", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_add", "success", "");
        }
        return true;
    }
    //显示校验结果的提示信息
    function show_validate_msg(ele,status,msg){
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
    //校验用户名是否可用=======================
    $("#empName_add").change(function(){
        //发送ajax请求校验用户名是否可用
        var empName = this.value;
        $.ajax({
            url:"${APP_Path}/checkuser",
            data:"empName="+empName,
            type:"POST",
            success:function(result){
                if(result.code==1){
                    show_validate_msg("#empName_add","success","用户名可用");
                    $("#save").attr("ajax-va","success");
                }else{
                    show_validate_msg("#empName_add","error",result.map.fail);
                    $("#save").attr("ajax-va","error");
                }
            }
        });
    });
//    ==============点击保存新增数据====================,
    $("#save").click(function () {
        //如果校验不成功,则不提交
       if (!test_data()){
           return false;
       }
      if( $(this).attr("ajax-va")=="error"){
          return false;
      }
        $.ajax({
            url:"${APP_Path}/emps",
            type:"POST",
            data: $("#emp_addModal form").serialize(),
            success:function (result) {
                if (result.code==1){
                    alert(result.msg);
                    //隐藏模态框
                    $("#emp_addModal").modal('hide');
                    //跳转至最后一页
                    to_page(totalPerson);
                }else{
                    //显示失败信息
                    //有哪个字段的错误信息就显示哪个字段的；
                    if(undefined != result.map.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add", "error", result.map.errorFields.email);
                    }
                    if(undefined != result.map.errorFields.empName){
                        //显示员工名字的错误信息
                        show_validate_msg("#empName_add", "error", result.map.errorFields.empName);
                    }
                }
            }
        })
    })
//    ============员工更新===============
    $(document).on("click",".editBtn",function () {
        //发送ajax请求,查出部门信息,显示下拉列表
        getDepts("#emp_updateModal select");
        //2、查出员工信息，显示员工信息
        getEmp($(this).attr("edit-id"))
        //3、把员工的id传递给模态框的更新按钮
        $("#update").attr("edit-id",$(this).attr("edit-id"));
        $("#emp_updateModal").modal({
            backdrop:"static"
        });
    })
    //点击更新，更新员工信息
    $("#update").click(function(){
        //验证邮箱是否合法
        //1、校验邮箱信息
        var email = $("#email_update").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update", "error", "邮箱格式不正确");
            return false;
        }else{
            show_validate_msg("#email_update", "success", "");
        }
        //2、发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${APP_Path}/emps/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#emp_updateModal form").serialize(),
            success:function(result){
                //1、关闭对话框
                $("#emp_updateModal").modal("hide");
                //2、回到本页面
                to_page(currentPage);
            }
        });
    });
    //======回显信息到更新模态框=============
    function getEmp(id){
        $.ajax({
            url:"${APP_Path}/emps/"+id,
            type:"GET",
            success:function(result){
                //console.log(result);
                var empData = result.map.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update").val(empData.email);
                $("#emp_updateModal input[name=gender]").val([empData.gender]);
                $("#emp_updateModal select").val([empData.dId]);
            }
        });
    }
    //=================================单个删除==============
    $(document).on("click",".deleteBtn",function(){
        //1、弹出是否确认删除对话框
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete-id");
        if(confirm("确认删除【"+empName+"】吗？")){
            //确认，发送ajax请求删除即可
            $.ajax({
                url:"${APP_Path}/emps/"+empId,
                type:"DELETE",
                success:function(result){
                    //回到本页
                    to_page(currentPage);
                }
            });
        }
    });
    //==============================完成全选/全不选功能================
    $("#checked_all").click(function(){
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    //check_item
    $(document).on("click",".check_item",function(){
        //判断当前选择中的元素是否5个
        var flag = $(".check_item:checked").length==$(".check_item").length;
        $("#checked_all").prop("checked",flag);
    });
    //====================点击全部删除，就批量删除================
    $("#emp_delete").click(function(){
        //
        var empNames = "";
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            //this
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除empNames多余的,
        empNames = empNames.substring(0, empNames.length-1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"${APP_Path}/emps/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    //回到当前页面
                    to_page(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>
