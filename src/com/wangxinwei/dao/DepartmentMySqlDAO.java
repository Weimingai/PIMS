package com.wangxinwei.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wangxinwei.db.DB;
import com.wangxinwei.model.Department;

public class DepartmentMySqlDAO implements DepartmentDAO {

	/**
	 * 返回专业
	 */
	public List<Department> getDepartment() {
		Connection conn=null;
		ResultSet rs=null;
		List<Department> departments=new ArrayList<Department>();
		try {
			conn=DB.getConn();
			String sql="select * from department order by id asc;";
			//System.out.println(sql);
			rs=DB.executeQuery(conn,sql);
			while(rs.next())
			{
				Department department=new Department();
				department.setId(rs.getInt("id"));
				department.setDeparment(rs.getString("department"));
				department.setStuCount(rs.getInt("stuCount"));
				departments.add(department);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return departments;
	}

	/**
	 * 设置专业
	 */
	public void updateDepartmrnt(Department department) {
		Connection conn=null;
		conn=DB.getConn();
		String sql="update department set department='"+department.getDeparment()+"',stuCount="+department.getStuCount()+" where id="+department.getId();
		System.out.println(sql);
		DB.executeUpdate(conn,sql);
		DB.closeConn(conn);
	}

}
