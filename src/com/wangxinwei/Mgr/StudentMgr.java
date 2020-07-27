package com.wangxinwei.Mgr;

import java.util.List;
import com.wangxinwei.dao.*;
import com.wangxinwei.model.Student;

public class StudentMgr {
	//单例模式
	//设置一个静态的对象
	private static StudentMgr sm=null;
	StudentDAO dao=null;
	//静态块构造一个 sm
	static {
		if(sm==null)
		{
			sm=new StudentMgr();
			//you should read the config file to set the specific dao object
			sm.setDAO(new StudentMySqlDAO());
		}
	}
	//构造一个私有的构造方法
	private StudentMgr() {}
	//得到StudentMgr
	public static StudentMgr getInstance() {
		return sm;
	}
	//设置DAO
	public void setDAO(StudentDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * 登录判断账户是否存在，密码是否正确
	 * @param username
	 * @param password
	 * @return
	 * @throws UserNotFoundException
	 * @throws PasswordNotCorrectException
	 */
	public Student validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException
	{
		return dao.validate(username,password);
	}
	
	public Student getStudent(String stuNo)
	{
		return dao.getStudent(stuNo);
	}
	
	/**
	 * 返回所有学生的信息
	 * @param students
	 * @param pageNo
	 * @param pageSize
	 * @param grade
	 * @return
	 */
	public int getStudents(List<Student> students,int pageNo,int pageSize,String grade)
	{
		return dao.getStudents(students,pageNo,pageSize,grade);
	}
	
	/**
	 * 依据具体条件查询
	 * @param students
	 * @param pageNo
	 * @param pageSize
	 * @param strStuGrade
	 * @param strDepartment
	 * @param strStuName
	 * @return
	 */
	public int searchStudents(List<Student> students,int pageNo,int pageSize,String strStuGrade,String strDepartment,String strStuName) {
		return dao.searchStudents(students,pageNo,pageSize,strStuGrade,strDepartment,strStuName);
	}
	
	/**
	 * 返回所有的年级
	 * @return
	 */
	public List<String> getGrade()
	{
		return dao.getGrade();
	}
	
	/**
	 * 初始化学生密码
	 * @param student
	 * @param stuNo
	 * @throws UserNotFoundException
	 */
	public void initPassword(Student student,String stuNo) throws UserNotFoundException
	{
		dao.initPassword(student,stuNo);
	}
	
	/**
	 * 学生修改密码
	 * @param student
	 * @param newpwd
	 */
	public void updatePassword(Student student,String newpwd)
	{
		dao.updatePassword(student,newpwd);
	}
	
	/**
	 * 学生填报志愿
	 * @param student
	 * @param writewish
	 */
	public void updateDep(Student student,String[] writewish) {
		dao.updateDep(student,writewish);
	}
	
	/**
	 * 更新学生的基本信息
	 * @param student
	 * @param basicScore
	 * @param extraScore
	 */
	public void updateStuInfo(Student student,String basicScore,String extraScore)
	{
		dao.updateStuInfo(student,basicScore,extraScore);
	}
	
	/**
	 * 管理员删除学生
	 * @param stuNo
	 */
	public void deleteStudent(String stuNo)
	{
		dao.deleteStudent(stuNo);
	}
	
	
	/**
	 * 专业分流
	 * @param stuGrade
	 */
	public int professionDiversion(String stuGrade)
	{
		return dao.professionDiversion(stuGrade);
	}
	
	/**
	 * 获取指定年级的专业分流结果
	 * @return
	 */
	public List<Student> getGradeStudents(String stugrade)
	{
		return dao.getGradeStudents(stugrade);
	} 
	
	/**
	 * 添加一个学生在数据库
	 * @param student
	 */
	public void addstudent(Student student){
		dao.addstudent(student);
	}
}
