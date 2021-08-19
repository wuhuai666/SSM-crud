package com.atguigu.test;

import com.atguigu.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description 测试CRUD的正确性
 * @create 2021-08-15 15:33
 **/
@WebAppConfiguration
@RunWith( SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml","file:src/main/resources/SpringMVC.xml"})
public class SpringMVCTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;
    @Before
    public void inintMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();

    }
    @Test
    public  void testPage() throws Exception {
       //得到请求对象.
        MvcResult pn = mockMvc.perform(MockMvcRequestBuilders.get("/list").param("pn", "2")).andReturn();
        MockHttpServletRequest request = pn.getRequest();
        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码:"+pageInfo.getPageNum());
        System.out.println("总页码:"+pageInfo.getPages());
        System.out.println("总记录数:"+pageInfo.getTotal());
        System.out.println("需要显示的5个页码:");
        int[] navigatepageNums = pageInfo.getNavigatepageNums();
        for (int navigatepageNum : navigatepageNums) {
            System.out.print("  "+navigatepageNum);
        }
        List<Employee> list=pageInfo.getList();
        for (Employee employee : list) {
            System.out.println("员工id为:"+employee.getEmpId());
            System.out.println("员工姓名为:"+employee.getEmpName());
        }
    }
}
