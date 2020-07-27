package com.wangxinwei.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wangxinwei.db.DB;
import com.wangxinwei.model.*;

public class AdminMySqlDAO implements AdminDAO {
	/**
	 * 登录检查
	 */
	public Admin validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException
	{
		Connection conn=null;
		ResultSet rs=null;//抛出异常返回值为控制
		Admin admin=null;
		try {
			conn=DB.getConn();
			String sql="select * from admin where username= '"+username+"' ";
			rs=DB.executeQuery(conn,sql);
			if(!rs.next())
			{
				throw new UserNotFoundException();
			}
			else if(!rs.getString("password").equals(password))
			{
				throw new PasswordNotCorrectException();
			}
			else {
				admin=new Admin();
				admin.setId(rs.getInt("id"));
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return admin;
	}

	/**
	 * 修改密码
	 * @throws UserNotFoundException 
	 */
	public void updatePasssword(Admin admin, String newPassword1) throws UserNotFoundException {
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			String sqlquery="select * from admin where username='"+admin.getUsername()+"';";
			System.out.println(sqlquery);
			rs=DB.executeQuery(conn,sqlquery);
			if(rs.next())
			{
				admin.setUsername(rs.getString("username"));
				admin.setPassword(rs.getString("password"));
			}else {
				throw new UserNotFoundException();
			}

			String sql="update admin set password='"+newPassword1+"' where username='"+admin.getUsername()+"';";
			pstmt=DB.prepPStmt(conn,sql);
			pstmt.executeUpdate();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
		}
	}
}
