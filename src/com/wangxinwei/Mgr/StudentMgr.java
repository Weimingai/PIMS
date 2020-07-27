package com.wangxinwei.Mgr;

import java.util.List;
import com.wangxinwei.dao.*;
import com.wangxinwei.model.Student;

public class StudentMgr {
	//����ģʽ
	//����һ����̬�Ķ���
	private static StudentMgr sm=null;
	StudentDAO dao=null;
	//��̬�鹹��һ�� sm
	static {
		if(sm==null)
		{
			sm=new StudentMgr();
			//you should read the config file to set the specific dao object
			sm.setDAO(new StudentMySqlDAO());
		}
	}
	//����һ��˽�еĹ��췽��
	private StudentMgr() {}
	//�õ�StudentMgr
	public static StudentMgr getInstance() {
		return sm;
	}
	//����DAO
	public void setDAO(StudentDAO dao)
	{
		this.dao=dao;
	}
	
	/**
	 * ��¼�ж��˻��Ƿ���ڣ������Ƿ���ȷ
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
	 * ��������ѧ������Ϣ
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
	 * ���ݾ���������ѯ
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
	 * �������е��꼶
	 * @return
	 */
	public List<String> getGrade()
	{
		return dao.getGrade();
	}
	
	/**
	 * ��ʼ��ѧ������
	 * @param student
	 * @param stuNo
	 * @throws UserNotFoundException
	 */
	public void initPassword(Student student,String stuNo) throws UserNotFoundException
	{
		dao.initPassword(student,stuNo);
	}
	
	/**
	 * ѧ���޸�����
	 * @param student
	 * @param newpwd
	 */
	public void updatePassword(Student student,String newpwd)
	{
		dao.updatePassword(student,newpwd);
	}
	
	/**
	 * ѧ���־Ը
	 * @param student
	 * @param writewish
	 */
	public void updateDep(Student student,String[] writewish) {
		dao.updateDep(student,writewish);
	}
	
	/**
	 * ����ѧ���Ļ�����Ϣ
	 * @param student
	 * @param basicScore
	 * @param extraScore
	 */
	public void updateStuInfo(Student student,String basicScore,String extraScore)
	{
		dao.updateStuInfo(student,basicScore,extraScore);
	}
	
	/**
	 * ����Աɾ��ѧ��
	 * @param stuNo
	 */
	public void deleteStudent(String stuNo)
	{
		dao.deleteStudent(stuNo);
	}
	
	
	/**
	 * רҵ����
	 * @param stuGrade
	 */
	public int professionDiversion(String stuGrade)
	{
		return dao.professionDiversion(stuGrade);
	}
	
	/**
	 * ��ȡָ���꼶��רҵ�������
	 * @return
	 */
	public List<Student> getGradeStudents(String stugrade)
	{
		return dao.getGradeStudents(stugrade);
	} 
	
	/**
	 * ���һ��ѧ�������ݿ�
	 * @param student
	 */
	public void addstudent(Student student){
		dao.addstudent(student);
	}
}
