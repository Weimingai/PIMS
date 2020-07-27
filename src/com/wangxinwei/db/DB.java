package com.wangxinwei.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private static DB db;
	//静态执行
	static{
		//因为每次都需要CLass.forname所以放在静态区
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private DB() {}
	/**
	 * 返回一个数据库连接
	 * @return
	 */
	public static Connection getConn() {
		//返回一个数据库的链接，供我使用
		Connection conn=null;
		try {
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pims?useSSL=false&&serverTimezone=Hongkong",
					"username","password");
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return conn;
	}
	
	/**
	 * 关闭数据库连接
	 * @param conn
	 */
	public static void closeConn(Connection conn)
	{
		if(conn!=null)
		{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn=null;
		}
	}
	
	/**
	 * 返回一个Stmt
	 * @param conn
	 * @return
	 */
	public static Statement getStmt(Connection conn)
	{
		Statement stmt=null;
		try {
			stmt=conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	/**
	 * 返回一个PStmt
	 * @param conn
	 * @param sql
	 * @return
	 */
	public static PreparedStatement prepPStmt(Connection conn,String sql)
	{
		PreparedStatement pStmt=null;
		try {
			pStmt=conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pStmt;
	}
	
	/**
	 * 关闭一个Stmt
	 * @param stmt
	 */
	public static void closeStmt(Statement stmt)
	{
		if(stmt!=null)
		{
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt=null;
		}
	}
	
	/**
	 * 查询语句，返回RS
	 * @param stmt
	 * @param sql
	 * @return
	 */
	public static ResultSet executeQuery(Statement stmt,String sql)
	{
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 查询语句重载
	 * @param conn
	 * @param sql
	 * @return
	 */
	public static ResultSet executeQuery(Connection conn,String sql)
	{
		ResultSet rs=null;
		try {
			rs=conn.createStatement().executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/**
	 * 更新语句执行
	 * @param conn
	 * @param sql
	 */
	public static void executeUpdate(Connection conn,String sql)
	{
		try {
			conn.createStatement().executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 关闭一个RS
	 * @param rs
	 */
	public static void closeRS(ResultSet rs)
	{
		if(rs!=null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs=null;
		}
	}
	
}
