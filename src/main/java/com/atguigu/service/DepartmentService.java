package com.atguigu.service;

import com.atguigu.bean.Department;
import com.atguigu.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 吴淮
 * @program SSM-crud
 * @description
 * @create 2021-08-17 10:49
 **/
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper mapper;

    /**
     * 查询部门信息
     * @return 部门信息
     */
    public List<Department> depts(){
        return mapper.selectByExample(null);
    }
}
