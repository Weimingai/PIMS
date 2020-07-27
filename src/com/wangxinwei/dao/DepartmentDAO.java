package com.wangxinwei.dao;

import java.util.List;

import com.wangxinwei.model.Department;

public interface DepartmentDAO {

	List<Department> getDepartment();

	void updateDepartmrnt(Department department);
	
}
