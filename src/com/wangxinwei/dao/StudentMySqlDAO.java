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
	 * ��¼���
	 */
	public Student validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException
	{
		Connection conn=null;
		ResultSet rs=null;//�׳��쳣����ֵΪ����
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
	 * ��������ѧ������Ϣ
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
	 * ����ָ����Χ����
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
			
			if(strDepartment!=null&&!strDepartment.trim().equals("")&&!strDepartment.trim().equals("����רҵ"))
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
	 * �����꼶
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
	 * ��ʼ��ѧ������
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
	 * ѧ�����޸�����
	 */
	public void updatePassword(Student student, String newpwd) {
		Connection conn=null;
		String sql="update student set password='"+newpwd+"' where stuNo='"+student.getStuNo()+"';";
		conn=DB.getConn();
		DB.executeUpdate(conn,sql);
		DB.closeConn(conn);
	}

	/**
	 * ѧ���־Ը
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
	 * ����ѧ�ţ�����һ��ѧ���Ķ���
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
	 * ����Ա�޸�ѧ����Ϣ
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
	 * ɾ��ѧ��������Ϣ
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
	 * ����רҵ����
	 */
	@Override
	public int professionDiversion(String stuGrade) {
		//�Ƚ����꼶����ѧ����ȡ��
		List<Student> students=new ArrayList<Student>();
		Connection conn=null;
		ResultSet rs=null;
		
		//����ֵ
		int result=0;
		//�ܷ�
		String sqlquery="select * from student where stuGrade='"+stuGrade+"' order by basicScore+extraScore desc;";
		System.out.println(sqlquery);
		//����
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
			
			//��ȡ����רҵ
			List<Department> departments=new ArrayList<Department>();
			departments=DepartmentMgr.getInstance().getDepartment();
			
			//�ж�����ѧ������רҵ��������ƥ�䲻ƥ��
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
				//��ÿһ��ѧ������רҵ��������
				
				//����һ����ֵ��
				Map<String,Integer> map=new HashMap<String,Integer>();
				for(Department department:departments)
				{
					map.put(department.getDeparment(),department.getStuCount());
				}
				
				//����һ����¼����������,���רҵ�������޸Ĵ˴���Ҫ���ж�Ӧ�޸�
				//���ڿ���ѡ���Ż�����
				//int[] record= {0,0,0,0,0};//ÿ��רҵ�ļ�¼����
				Map<String,Integer> recordmap=new HashMap<String,Integer>();
				for(Department department:departments)
				{
					recordmap.put(department.getDeparment(),0);
				}
				
				//��ÿ��ѧ�����б���������ȱ��null��飬����һ��©��
				Student flstudent=null;//���÷���ѧ�����м����
				for(int i=0;i<students.size();i++)
				{
					flstudent=students.get(i);
					//�����һ־Ըδ�����������רҵ���������仯��Ҳ��Ҫ������Ӧ�ĵ���
					if(recordmap.get(flstudent.getDeparment1())<map.get(flstudent.getDeparment1()))
					{
						//���ñ���ķ������и���
						fenliuDepartment(flstudent,flstudent.getDeparment1());
						//��רҵ��Ӧ��ֵ��һ
						recordmap.put(flstudent.getDeparment1(),recordmap.get(flstudent.getDeparment1())+1);
					}else if(recordmap.get(flstudent.getDeparment2())<map.get(flstudent.getDeparment2())){
						//���ñ���ķ������и���
						fenliuDepartment(flstudent,flstudent.getDeparment2());
						//��רҵ��Ӧ��ֵ��һ
						recordmap.put(flstudent.getDeparment2(),recordmap.get(flstudent.getDeparment2())+1);
					}
					else if(recordmap.get(flstudent.getDeparment3())<map.get(flstudent.getDeparment3())){
						//���ñ���ķ������и���
						fenliuDepartment(flstudent,flstudent.getDeparment3());
						//��רҵ��Ӧ��ֵ��һ
						recordmap.put(flstudent.getDeparment3(),recordmap.get(flstudent.getDeparment3())+1);
					}
					else if(recordmap.get(flstudent.getDeparment4())<map.get(flstudent.getDeparment4())){
						//���ñ���ķ������и���
						fenliuDepartment(flstudent,flstudent.getDeparment4());
						//��רҵ��Ӧ��ֵ��һ
						recordmap.put(flstudent.getDeparment4(),recordmap.get(flstudent.getDeparment4())+1);
					}else if(recordmap.get(flstudent.getDeparment5())<map.get(flstudent.getDeparment5())){
						//���ñ���ķ������и���
						fenliuDepartment(flstudent,flstudent.getDeparment5());
						//��רҵ��Ӧ��ֵ��һ
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
	 * ����ָ���꼶רҵ�������
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
	 * ���һ���µ�ѧ�������ݿ�
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
	 * ��һ��ѧ������רҵ�����޸�
	 */
	public void fenliuDepartment(Student student,String newDepartment)
	{
		Connection conn=DB.getConn();
		String sql="update student set newDeparment='"+newDepartment+"' where stuNo='"+student.getStuNo()+"';";
		System.out.println(sql);
		DB.executeUpdate(conn,sql);
	}
}

