package com.wangxinwei.dao;

import java.util.List;

import com.wangxinwei.model.Student;

public interface StudentDAO {
	public  Student validate(String username,String password) throws UserNotFoundException, PasswordNotCorrectException;
	public int getStudents(List<Student> students,int pageNo,int pageSize,String grade);
	public int searchStudents(List<Student> students, int pageNo, int pageSize, String strStuGrade,
			String strDepartment, String strStuName);
	public List<String> getGrade();
	public void initPassword(Student student,String stuNo) throws UserNotFoundException;
	public void updatePassword(Student student, String newpwd);
	public void updateDep(Student student, String[] writewish);
	public Student getStudent(String stuNo);
	public void updateStuInfo(Student student, String basicScore, String extraScore);
	public void deleteStudent(String stuNo);
	public int professionDiversion(String stuGrade);
	public List<Student> getGradeStudents(String stugrade);
	public void addstudent(Student student);
}
