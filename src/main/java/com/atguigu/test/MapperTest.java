package com.atguigu.test;

import com.atguigu.bean.Department;
import com.atguigu.bean.Employee;
import com.atguigu.bean.EmployeeExample;
import com.atguigu.dao.DepartmentMapper;

import com.atguigu.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description 测试增删改查
 * @create 2021-08-14 10:45
 * 使用RunWith实现Spring的单元测试
 * 使用ContextConfiguration注解加入Spring的配置文件applicationContext.xml
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper deptMapper;
    @Autowired
    EmployeeMapper  employee;
    @Autowired
    SqlSession sqlSession;
    @Test
    public  void testDepartment(){
//批量生成employee
//        for (int i = 0; i <1000 ; i++) {
//           String uuId= UUID.randomUUID().toString().substring(0,5)+i;
//           employee.insertSelective(new Employee(null,uuId,"1",uuId+"@guigu.com",1));
//        }
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 1000; i < 2000; i++) {
//            String uuId= UUID.randomUUID().toString().substring(0,5)+i;
//           mapper.insertSelective(new Employee(null,uuId,"1",uuId+"@guigu.com",1));

    }
}
