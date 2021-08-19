package com.atguigu.controller;

import com.atguigu.bean.Employee;
import com.atguigu.bean.Msg;
import com.atguigu.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description 操作员工信息的控制器
 * @create 2021-08-15 15:14
 **/
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService service;

    @ResponseBody
    @RequestMapping("/emps")
    public Msg empList(@RequestParam(value = "pn",defaultValue ="1") int pn){
        //引入PageHelper分页,pn是想要去的页数,5表示每页展示的数据.
        PageHelper.startPage(pn,5);
        //查询所有的员信息.
        List<Employee> employees = service.queryAllEmp();
        //将分页的相关信息放入pageINfo中.
        PageInfo pageInfo = new PageInfo(employees,5);
        //将信息交给json字符串进行处理
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 、支持JSR303校验
     * @return 信息
     */
    @PostMapping("/emps")
    @ResponseBody
    public Msg addEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            service.addEmp(employee);
            return Msg.success();
        }

    }

    /**
     * 判断姓名是否合法
     * @param empName 员工姓名
     * @return msg
     */
    @ResponseBody
    @PostMapping("/checkuser")
    public  Msg checkUser(@RequestParam("empName") String empName){
        //判断用户名是否符合规则
        String rex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        System.out.println(empName.matches(rex));
        if(!empName.matches(rex)){
            return Msg.fail().add("fail","用户名可以是2-5位中文或者6-16位英文和数字");
        }
            boolean bool= service.checkUser(empName);
            System.out.println(bool);
            if (!bool){
                return Msg.fail().add("fail","用户名已经存在");
            }else{
                return Msg.success();
            }
        }

    /**
     * 根据员工id查询员工信息
     * @param id 员工id
     * @return msg
     */
    @ResponseBody
        @GetMapping("/emps/{id}")
    public Msg findEmpById(@PathVariable("id")Integer id){
       Employee employee= service.findEmpById(id);
        return Msg.success().add("emp",employee);
        }

    /**
     * 根据主键更新员工信息
     * @param employee 员工信息
     * @return  msg
     */
    @ResponseBody
     @PutMapping("/emps/{empId}")
    public Msg updateEmpById(Employee employee){
        service.updateEmp(employee);
        System.out.println(employee);
        return Msg.success();
        }

    @ResponseBody
    @DeleteMapping(value="/emps/{ids}")
    public Msg deleteEmp(@PathVariable("ids")String ids){
        //批量删除
        if(ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                del_ids.add(Integer.parseInt(string));
            }
            service.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            service.deleteEmp(id);
        }
        return Msg.success();
    }
    }

