package com.wangxinwei.Mgr;

import java.util.List;
import com.wangxinwei.model.*;
import com.wangxinwei.dao.*;

public class DepartmentMgr {
	//����ģʽ
	//����һ����̬�Ķ���
	private static DepartmentMgr dm=null;
	DepartmentDAO dao=null;
	//��̬�鹹��һ�� sm
	static {
		if(dm==null)
		{
			dm=new DepartmentMgr();
			//you should read the config file to set the specific dao object
			dm.setDAO(new DepartmentMySqlDAO());
		}
	}
	//����һ��˽�еĹ��췽��
	private DepartmentMgr() {}
	//�õ�StudentMgr
	public static DepartmentMgr getInstance() {
		return dm;
	}
	//����DAO
	public void setDAO(DepartmentDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * ��������רҵ
	 * @return
	 */
	public List<Department> getDepartment()
	{
		return dao.getDepartment();
	}
	
	/**
	 * �޸�רҵ����
	 * @param department
	 */
	public void updateDepartmrnt(Department department)
	{
		dao.updateDepartmrnt(department);
	}
	
}
