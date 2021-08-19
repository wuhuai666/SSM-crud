package com.atguigu.dao;

import com.atguigu.bean.Employee;
import com.atguigu.bean.EmployeeExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 吴淮
 */
public interface EmployeeMapper {
    /**
     * 根据不同的条件统计总数
     * @param example 例子类
     * @return 总数
     */
    long countByExample(EmployeeExample example);

    /**
     * 根据指定条件删除
     * @param example 例子类
     * @return 删除的行数
     */
    int deleteByExample(EmployeeExample example);

    /**
     * 根据主键删除
     * @param empId tb1_emp的主键
     * @return 删除的行数
     */
    int deleteByPrimaryKey(Integer empId);

    /**
     * 每个值都插入
     * @param record 插入表记录
     * @return 影响的行数
     */
    int insert(Employee record);

    /**
     * 选择性的插入值
     * @param record  插入表记录
     * @return 影响的行数
     */
    int insertSelective(Employee record);

    /**
     *动态查询 包含排序
     * @param example 模板
     * @return 员工信息
     */
    List<Employee> selectByExample(EmployeeExample example);
    /**
     *根据主键id查询
     * @param empId 模板
     * @return 员工信息
     */
    Employee selectByPrimaryKey(Integer empId);
//=============================================================
    /**
     * 联合查询
     * @param example 模板
     * @return  员工信息
     */
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    /**
     *根据主键id联合查询
     * @param empId 模板
     * @return 员工信息
     */
    Employee selectByPrimaryKeyWithDept(Integer empId);
    //=============================================================
    /**
     * 动态的更新
     * @param record 更新的数据
     * @param example 模板
     * @return 影响的行数
     */
    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     * 更新全部
     * @param record 更新的数据
     * @param example 模板
     * @return 影响的行数
     */
    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    /**
     * 根据主键动态更新
     * @param record  更新的数据
     * @return  影响的行数
     */
    int updateByPrimaryKeySelective(Employee record);

    /**
     * 根据主键更新全部
     * @param record 更新的数据
     * @return 影响的行数
     */
    int updateByPrimaryKey(Employee record);

}