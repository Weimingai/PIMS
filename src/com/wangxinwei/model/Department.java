package com.wangxinwei.model;

public class Department {
	private int id;
	private String deparment;
	private int stuCount;
	
	public String getDeparment() {
		return deparment;
	}
	public void setDeparment(String deparment) {
		this.deparment = deparment;
	}
	public int getStuCount() {
		return stuCount;
	}
	public void setStuCount(int stuCount) {
		this.stuCount = stuCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Department() {
		
	}
	public Department(String deparment, int stuCount) {
		super();
		this.deparment = deparment;
		this.stuCount = stuCount;
	}
	public Department(int id,String deparment, int stuCount) {
		super();
		this.id=id;
		this.deparment = deparment;
		this.stuCount = stuCount;
	}
}
