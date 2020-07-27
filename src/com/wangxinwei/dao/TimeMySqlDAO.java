package com.wangxinwei.dao;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.wangxinwei.db.DB;
import com.wangxinwei.model.*;

public class TimeMySqlDAO implements TimeDAO{

	/**
	 * 设置时间
	 */
	@Override
	public boolean setTime(Timestamp startTime, Timestamp endTime) {
		Connection conn=null;
		conn=DB.getConn();
		String sql="update time set startTime ='"+startTime+"',endTime='"+endTime+"' where id=1 ;";
		DB.executeUpdate(conn,sql);
		DB.closeConn(conn);
		return true;
	}

	/**
	 * 返回时间
	 */
	@Override
	public void getTime(Time time) {
		Connection conn=null;
		ResultSet rs=null;
		try {
			conn=DB.getConn();
			String sql="select * from time where id=1;";
			//System.out.println(sql);
			rs=DB.executeQuery(conn,sql);
			if(rs.next())
			{
				time.setId(rs.getInt("id"));
				time.setStartTime(rs.getTimestamp("startTime"));
				time.setEndTime(rs.getTimestamp("endTime"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
	}

}
