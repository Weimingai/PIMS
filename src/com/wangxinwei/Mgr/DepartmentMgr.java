package com.wangxinwei.Mgr;

import java.util.List;
import com.wangxinwei.model.*;
import com.wangxinwei.dao.*;

public class DepartmentMgr {
	//单例模式
	//设置一个静态的对象
	private static DepartmentMgr dm=null;
	DepartmentDAO dao=null;
	//静态块构造一个 sm
	static {
		if(dm==null)
		{
			dm=new DepartmentMgr();
			//you should read the config file to set the specific dao object
			dm.setDAO(new DepartmentMySqlDAO());
		}
	}
	//构造一个私有的构造方法
	private DepartmentMgr() {}
	//得到StudentMgr
	public static DepartmentMgr getInstance() {
		return dm;
	}
	//设置DAO
	public void setDAO(DepartmentDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * 返回所有专业
	 * @return
	 */
	public List<Department> getDepartment()
	{
		return dao.getDepartment();
	}
	
	/**
	 * 修改专业设置
	 * @param department
	 */
	public void updateDepartmrnt(Department department)
	{
		dao.updateDepartmrnt(department);
	}
	
}
