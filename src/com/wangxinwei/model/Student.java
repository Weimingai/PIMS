package com.wangxinwei.model;

import java.sql.Timestamp;

public class Student {
	private String stuNo;
	private String password;
	private String stuName;
	private String sex;
	private String stuSchool;
	private String stuGrade;
	private String oldDeparment;
	private String oldClass;
	private String newDeparment;
	private double basicScore;
	private double extraScore;
	private int stuRank;
	private String deparment1;
	private String deparment2;
	private String deparment3;
	private String deparment4;
	private String deparment5;
	private String deparment6;
	private String deparment7;
	private String deparment8;
	private String deparment9;
	private String deparment10;
	private Timestamp updateTime;
	
	public Student() {
		
	}
	
	
	public Student(String stuNo, String stuName, String sex, String stuSchool, String stuGrade, String oldDeparment,
			String oldClass, double basicScore, double extraScore, int stuRank) {
		super();
		this.stuNo = stuNo;
		this.stuName = stuName;
		this.sex = sex;
		this.stuSchool = stuSchool;
		this.stuGrade = stuGrade;
		this.oldDeparment = oldDeparment;
		this.oldClass = oldClass;
		this.basicScore = basicScore;
		this.extraScore = extraScore;
		this.stuRank = stuRank;
	}


	public String getStuNo() {
		return stuNo;
	}
	public void setStuNo(String stuNo) {
		this.stuNo = stuNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStuSchool() {
		return stuSchool;
	}
	public void setStuSchool(String stuSchool) {
		this.stuSchool = stuSchool;
	}
	public String getStuGrade() {
		return stuGrade;
	}
	public void setStuGrade(String stuGrade) {
		this.stuGrade = stuGrade;
	}
	public String getOldDeparment() {
		return oldDeparment;
	}
	public void setOldDeparment(String oldDeparment) {
		this.oldDeparment = oldDeparment;
	}
	public String getOldClass() {
		return oldClass;
	}
	public void setOldClass(String oldClass) {
		this.oldClass = oldClass;
	}
	public String getNewDeparment() {
		return newDeparment;
	}
	public void setNewDeparment(String newDeparment) {
		this.newDeparment = newDeparment;
	}
	public double getBasicScore() {
		return basicScore;
	}
	public void setBasicScore(double basicScore) {
		this.basicScore = basicScore;
	}
	public double getExtraScore() {
		return extraScore;
	}
	public void setExtraScore(double extraScore) {
		this.extraScore = extraScore;
	}
	public int getStuRank() {
		return stuRank;
	}
	public void setStuRank(int stuRank) {
		this.stuRank = stuRank;
	}
	public String getDeparment1() {
		return deparment1;
	}
	public void setDeparment1(String deparment1) {
		this.deparment1 = deparment1;
	}
	public String getDeparment2() {
		return deparment2;
	}
	public void setDeparment2(String deparment2) {
		this.deparment2 = deparment2;
	}
	public String getDeparment3() {
		return deparment3;
	}
	public void setDeparment3(String deparment3) {
		this.deparment3 = deparment3;
	}
	public String getDeparment4() {
		return deparment4;
	}
	public void setDeparment4(String deparment4) {
		this.deparment4 = deparment4;
	}
	public String getDeparment5() {
		return deparment5;
	}
	public void setDeparment5(String deparment5) {
		this.deparment5 = deparment5;
	}
	public String getDeparment6() {
		return deparment6;
	}
	public void setDeparment6(String deparment6) {
		this.deparment6 = deparment6;
	}
	public String getDeparment7() {
		return deparment7;
	}
	public void setDeparment7(String deparment7) {
		this.deparment7 = deparment7;
	}
	public String getDeparment8() {
		return deparment8;
	}
	public void setDeparment8(String deparment8) {
		this.deparment8 = deparment8;
	}
	public String getDeparment9() {
		return deparment9;
	}
	public void setDeparment9(String deparment9) {
		this.deparment9 = deparment9;
	}
	public String getDeparment10() {
		return deparment10;
	}
	public void setDeparment10(String deparment10) {
		this.deparment10 = deparment10;
	}
	public Timestamp getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Timestamp updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
