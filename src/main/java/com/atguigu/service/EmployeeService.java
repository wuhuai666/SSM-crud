package com.atguigu.service;

import com.atguigu.bean.Employee;
import com.atguigu.bean.EmployeeExample;
import com.atguigu.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description  业务层
 * @create 2021-08-15 15:16
 **/
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper mapper;

    /**
     * 联合查询所有的员工信息
     * @return 员工信息.
     */
    public List<Employee> queryAllEmp() {
        return  mapper.selectByExampleWithDept(null);
    }

    /**
     * 添加员工
     * @param employee
     */
    public void addEmp(Employee employee) {
        mapper.insertSelective(employee);
    }

    /**
     * 查询是否存在
     * @param empName 用户名
     * @return  true or false
     */
    public Boolean checkUser(String empName) {
        EmployeeExample example=new EmployeeExample();
       EmployeeExample.Criteria criteria = example.createCriteria();
       criteria.andEmpNameEqualTo(empName);
        long l = mapper.countByExample(example);
        return l==0;
    }

    /**
     * 根据员工id查询员工信息
     * @param id 员工id
     * @return  员工对象
     */
    public Employee findEmpById(Integer id) {
       return mapper.selectByPrimaryKey(id);
    }

    /**
     * 根据主键更新员工信息
     * @param employee 员工信息
     */
    public void updateEmp(Employee employee) {
        mapper.updateByPrimaryKeySelective(employee);
    }

    /**
     * 根据主键id删除用户
     * @param id 用户id
     */
    public void deleteEmp(Integer id) {
        mapper.deleteByPrimaryKey(id);
    }

    /**
     * 批量删除
     * @param id
     */
    public void deleteBatch(List<Integer> id) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(id);
        mapper.deleteByExample(example);
    }
}
