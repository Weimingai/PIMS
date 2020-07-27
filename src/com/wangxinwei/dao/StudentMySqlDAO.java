package com.wangxinwei.dao;

import java.util.*;

import com.wangxinwei.Mgr.DepartmentMgr;
import com.wangxinwei.db.DB;
import com.wangxinwei.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

public class StudentMySqlDAO implements StudentDAO{
	/**
	 * 登录检查
	 */
	public Student validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException
	{
		Connection conn=null;
		ResultSet rs=null;//抛出异常返回值为控制
		Student student=null;
		try {
			conn=DB.getConn();
			String sql="select * from student where stuNo= '"+username+"' ";
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
				student=new Student();
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return student;
	}
	
	/**
	 * 返回所有学生的信息
	 */
	public int getStudents(List<Student> students,int pageNo,int pageSize,String grade) {
		Connection conn=null;
		ResultSet rsCount=null;
		ResultSet rs=null;
		int pageCount=0;
		try {
			conn=DB.getConn();
			String pagesql="select count(*) from student where stuGrade = '"+grade+"';";
			rsCount=DB.executeQuery(conn,pagesql);
			System.out.println(pagesql);
			rsCount.next();
			pageCount=(rsCount.getInt(1)+pageSize-1)/pageSize;
			
			String sql="select * from student where stuGrade = '"+grade+"' order by id asc limit "+(pageNo-1)*pageSize+", "+pageSize;
			System.out.println(sql);
			rs=DB.executeQuery(conn,sql);
			while(rs.next()) {
				Student student=new Student();
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
				students.add(student);
			}	
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rsCount);
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return pageCount;
	}

	/**
	 * 返回指定范围查找
	 */
	public int searchStudents(List<Student> students, int pageNo, int pageSize, String strStuGrade,
			String strDepartment, String strStuName) {
		int pageCount=1;
		Connection conn=null;
		ResultSet rs=null;
		ResultSet rsCount=null;

		try {
			conn=DB.getConn();
			String sql="select * from student where 1=1";
			
			if(strStuGrade!=null&&!strStuGrade.trim().equals(""))
			{
				sql+=" and stuGrade = '"+strStuGrade+"'";
			}
			
			if(strDepartment!=null&&!strDepartment.trim().equals("")&&!strDepartment.trim().equals("所有专业"))
			{
				sql+=" and newDeparment = '"+strDepartment+"'";
			}
			
			if(strStuName!=null&&!strStuName.trim().equals("")&&!strStuName.trim().equals("null"))
			{
				sql+=" and stuName = '"+strStuName+"'";
			}
			
			
			String sqlCount=sql.replaceFirst("select \\*","select count(*)");
			sql+=" limit "+(pageNo-1)*pageSize+", "+pageSize;
			System.out.println(sql);

			System.out.println(sqlCount);
			
			rsCount=DB.executeQuery(conn,sqlCount);
			rsCount.next();
			pageCount=(rsCount.getInt(1)+pageSize-1)/pageSize;
			
			rs=DB.executeQuery(conn,sql);
			while(rs.next())
			{
				Student student=new Student();
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
				students.add(student);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return pageCount;
	}

	/**
	 * 返回年级
	 */
	public List<String> getGrade() {
		Connection conn=null;
		ResultSet rs=null;
		List<String> grades=new ArrayList<String>();
		try {
			conn=DB.getConn();
			String sql="select stuGrade from student group by stuGrade order by stuGrade desc;";
			//System.out.println(sql);
			rs=DB.executeQuery(conn,sql);
			while(rs.next())
			{
				String grade=rs.getString("stuGrade");
				grades.add(grade);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return grades;
	}

	/**
	 * 初始化学生密码
	 * @throws UserNotFoundException 
	 */
	public void initPassword(Student student,String stuNo) throws UserNotFoundException {
		Connection conn=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			conn=DB.getConn();
			String sqlquery="select * from student where stuNo='"+stuNo+"';";
			//System.out.println(sqlquery);
			rs=DB.executeQuery(conn,sqlquery);
			if(rs.next())
			{
				System.out.println(rs.getString("stuNo"));
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
			}else {
				throw new UserNotFoundException();
			}

			String sql="update student set password='123456' where stuNo='"+stuNo+"';";
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

	/**
	 * 学生端修改密码
	 */
	public void updatePassword(Student student, String newpwd) {
		Connection conn=null;
		String sql="update student set password='"+newpwd+"' where stuNo='"+student.getStuNo()+"';";
		conn=DB.getConn();
		DB.executeUpdate(conn,sql);
		DB.closeConn(conn);
	}

	/**
	 * 学生填报志愿
	 */
	@Override
	public void updateDep(Student student, String[] writewish) {
		Connection conn=null;
		String sql="update student set department1='"+writewish[0]+"' ";
		
		for(int i=1;i<writewish.length;i++)
		{
			if(writewish[i]!=null&&!writewish[i].equals(""))
			{
				sql+=",department"+(i+1)+"='"+writewish[i]+"'";
			}
		}
		sql+=" ,updateTime='"+new Timestamp(System.currentTimeMillis())+"' where stuNo='"+student.getStuNo()+"';";
		conn=DB.getConn();	
		System.out.println(sql);
		DB.executeUpdate(conn,sql);
		DB.closeConn(conn);
	}

	/**
	 * 根据学号，返回一个学生的对象
	 */
	@Override
	public Student getStudent(String stuNo) {
		Connection conn=null;
		ResultSet rs=null;
		Student student=new Student();
		try {
			conn=DB.getConn();
			String sql="select * from student where stuNo='"+stuNo+"';";
			//System.out.println(sql);
			rs=DB.executeQuery(conn,sql);
			if(rs.next())
			{
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return student;
	}

	/**
	 * 管理员修改学生信息
	 */
	@Override
	public void updateStuInfo(Student student, String basicScore, String extraScore) {
		Connection conn=null;
		String sql="update student set basicScore="+basicScore+" ,extraScore="+extraScore+" where stuNo='"+student.getStuNo()+"';";
		System.out.println(sql);
		conn=DB.getConn();
		DB.executeUpdate(conn,sql);
	}

	/**
	 * 删除学生基本信息
	 */
	@Override
	public void deleteStudent(String stuNo) {
		Connection conn=null;
		String sql="delete from student where stuNo='"+stuNo+"';";
		System.out.println(sql);
		conn=DB.getConn();
		DB.executeUpdate(conn,sql);
	}

	/**
	 * 进行专业分流
	 */
	@Override
	public int professionDiversion(String stuGrade) {
		//先将该年级所有学生获取到
		List<Student> students=new ArrayList<Student>();
		Connection conn=null;
		ResultSet rs=null;
		
		//返回值
		int result=0;
		//总分
		String sqlquery="select * from student where stuGrade='"+stuGrade+"' order by basicScore+extraScore desc;";
		System.out.println(sqlquery);
		//排名
		//String sqlquery="select * from student where stuGrade='"+stuGrade+"' order by stuRank asc;";
		try {
			conn=DB.getConn();
			rs=DB.executeQuery(conn,sqlquery);
			while(rs.next())
			{
				Student student=new Student();
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
				students.add(student);
			}
			
			//获取所有专业
			List<Department> departments=new ArrayList<Department>();
			departments=DepartmentMgr.getInstance().getDepartment();
			
			//判断所有学生数和专业设置人数匹配不匹配
			int stuCount=students.size();
			int depStuCount=0;
			for(Department department:departments)
			{
				depStuCount+=department.getStuCount();
			}
			if(stuCount!=depStuCount)
			{
				System.out.println(stuCount);
				System.out.println(depStuCount);
				result=-1;
			}else
			{
				//对每一个学生进行专业分流设置
				
				//构造一个键值对
				Map<String,Integer> map=new HashMap<String,Integer>();
				for(Department department:departments)
				{
					map.put(department.getDeparment(),department.getStuCount());
				}
				
				//设置一个记录人数的数组,如果专业数进行修改此处需要进行对应修改
				//后期可以选择优化方案
				//int[] record= {0,0,0,0,0};//每个专业的记录人数
				Map<String,Integer> recordmap=new HashMap<String,Integer>();
				for(Department department:departments)
				{
					recordmap.put(department.getDeparment(),0);
				}
				
				//对每个学生进行遍历分流，缺少null检查，这是一个漏洞
				Student flstudent=null;//设置分流学生的中间变量
				for(int i=0;i<students.size();i++)
				{
					flstudent=students.get(i);
					//如果第一志愿未满，这里如果专业数量发生变化，也需要作出相应的调整
					if(recordmap.get(flstudent.getDeparment1())<map.get(flstudent.getDeparment1()))
					{
						//调用本类的方法进行更新
						fenliuDepartment(flstudent,flstudent.getDeparment1());
						//该专业对应的值加一
						recordmap.put(flstudent.getDeparment1(),recordmap.get(flstudent.getDeparment1())+1);
					}else if(recordmap.get(flstudent.getDeparment2())<map.get(flstudent.getDeparment2())){
						//调用本类的方法进行更新
						fenliuDepartment(flstudent,flstudent.getDeparment2());
						//该专业对应的值加一
						recordmap.put(flstudent.getDeparment2(),recordmap.get(flstudent.getDeparment2())+1);
					}
					else if(recordmap.get(flstudent.getDeparment3())<map.get(flstudent.getDeparment3())){
						//调用本类的方法进行更新
						fenliuDepartment(flstudent,flstudent.getDeparment3());
						//该专业对应的值加一
						recordmap.put(flstudent.getDeparment3(),recordmap.get(flstudent.getDeparment3())+1);
					}
					else if(recordmap.get(flstudent.getDeparment4())<map.get(flstudent.getDeparment4())){
						//调用本类的方法进行更新
						fenliuDepartment(flstudent,flstudent.getDeparment4());
						//该专业对应的值加一
						recordmap.put(flstudent.getDeparment4(),recordmap.get(flstudent.getDeparment4())+1);
					}else if(recordmap.get(flstudent.getDeparment5())<map.get(flstudent.getDeparment5())){
						//调用本类的方法进行更新
						fenliuDepartment(flstudent,flstudent.getDeparment5());
						//该专业对应的值加一
						recordmap.put(flstudent.getDeparment5(),recordmap.get(flstudent.getDeparment5())+1);
					}
				}
				result=1;
			}
			
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		
		return result;
	}

	/**
	 * 返回指定年级专业分流结果
	 */
	@Override
	public List<Student> getGradeStudents(String stugrade) {
		Connection conn=null;
		ResultSet rs=null;
		List<Student> students=new ArrayList<Student>();

		try {
			conn=DB.getConn();
			String sql="select * from student where stuGrade='"+stugrade+"';";
			
			rs=DB.executeQuery(conn,sql);
			while(rs.next())
			{
				Student student=new Student();
				student.setStuNo(rs.getString("stuNo"));
				student.setPassword(rs.getString("password"));
				student.setStuName(rs.getString("stuName"));
				student.setSex(rs.getString("sex"));
				student.setStuSchool(rs.getString("stuSchool"));
				student.setStuGrade(rs.getString("stuGrade"));
				student.setOldDeparment(rs.getString("oldDeparment"));
				student.setOldClass(rs.getString("oldClass"));
				student.setNewDeparment(rs.getString("newDeparment"));
				student.setBasicScore(rs.getDouble("basicScore"));
				student.setExtraScore(rs.getDouble("extraScore"));
				student.setStuRank(rs.getInt("stuRank"));
				student.setDeparment1(rs.getString("department1"));
				student.setDeparment2(rs.getString("department2"));
				student.setDeparment3(rs.getString("department3"));
				student.setDeparment4(rs.getString("department4"));
				student.setDeparment5(rs.getString("department5"));
				student.setDeparment6(rs.getString("department6"));
				student.setDeparment7(rs.getString("department7"));
				student.setDeparment8(rs.getString("department8"));
				student.setDeparment9(rs.getString("department9"));
				student.setDeparment10(rs.getString("department10"));
				student.setUpdateTime(rs.getTimestamp("updateTime"));
				students.add(student);
			}
		}catch(SQLException e)
		{
			e.printStackTrace();
		}finally {
			DB.closeRS(rs);
			DB.closeConn(conn);
		}
		return students;
	}

	/**
	 * 添加一个新的学生在数据库
	 */
	@Override
	public void addstudent(Student student) {
		Connection conn=DB.getConn();
		String sql="insert student(stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values('"+student.getStuNo()+"','123456','"+student.getStuName()+"'"+
		",'"+student.getSex()+"','"+student.getStuSchool()+"','"+student.getStuGrade()+"','"+student.getOldDeparment()+"','"+student.getOldClass()+"',"+student.getBasicScore()+","+student.getExtraScore()+","+student.getStuRank()+");";
		System.out.println(sql);
		DB.executeUpdate(conn,sql);
	}
	
	/**
	 * 对一个学生的新专业进行修改
	 */
	public void fenliuDepartment(Student student,String newDepartment)
	{
		Connection conn=DB.getConn();
		String sql="update student set newDeparment='"+newDepartment+"' where stuNo='"+student.getStuNo()+"';";
		System.out.println(sql);
		DB.executeUpdate(conn,sql);
	}
}

