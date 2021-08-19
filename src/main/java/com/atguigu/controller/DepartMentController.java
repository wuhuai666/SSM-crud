package com.atguigu.controller;

import com.atguigu.bean.Department;
import com.atguigu.bean.Msg;
import com.atguigu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description 部门信息控制方法
 * @create 2021-08-17 10:47
 **/
@Controller
public class DepartMentController {
    @Autowired
    private DepartmentService service;
    @ResponseBody
    @RequestMapping("/depts")
    public Msg depts(){
        List<Department> depts = service.depts();
        return Msg.success().add("depts",depts);
    }
}
