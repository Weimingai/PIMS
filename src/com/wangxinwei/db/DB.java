package com.wangxinwei.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
	private static DB db;
	//��ִ̬��
	static{
		//��Ϊÿ�ζ���ҪCLass.forname���Է��ھ�̬��
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private DB() {}
	/**
	 * ����һ�����ݿ�����
	 * @return
	 */
	public static Connection getConn() {
		//����һ�����ݿ�����ӣ�����ʹ��
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
	 * �ر����ݿ�����
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
	 * ����һ��Stmt
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
	 * ����һ��PStmt
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
	 * �ر�һ��Stmt
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
	 * ��ѯ��䣬����RS
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
	 * ��ѯ�������
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
	 * �������ִ��
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
	 * �ر�һ��RS
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
