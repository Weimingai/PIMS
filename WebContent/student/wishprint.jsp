<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*,java.text.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//Bug日志：mysql查询出来的时间与mysql实际存储时间差8个小时
//解决方法：在数据库连接字符串后面加参数&serverTimezone=Hongkong
request.setCharacterEncoding("gb2312");
Student sessionstudent=(Student)session.getAttribute("user");

Student selfstudent=StudentMgr.getInstance().getStudent(sessionstudent.getStuNo());

if(selfstudent==null)
{
	out.println("You havn't logged in!");
	%>
	<a href="../login.jsp">点击这里登陆</a>
	<%
	return;
}

List<Department> departments=new ArrayList<Department>();
departments=DepartmentMgr.getInstance().getDepartment();

List<String> studep=new ArrayList<String>();
studep.add(selfstudent.getDeparment1());
studep.add(selfstudent.getDeparment2());
studep.add(selfstudent.getDeparment3());
studep.add(selfstudent.getDeparment4());
studep.add(selfstudent.getDeparment5());
studep.add(selfstudent.getDeparment6());
studep.add(selfstudent.getDeparment7());
studep.add(selfstudent.getDeparment8());
studep.add(selfstudent.getDeparment9());
studep.add(selfstudent.getDeparment10());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>武汉理工大学专业分流志愿申请表</title>
<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:微软雅黑;
}
.printtable{
	text-align:center;
}
.tablehead{
text-align:center;
font-size:30px;
font-family:黑体;
margin-top:60px;
margin-bottom:20px;
}
.printtable table{
border-collapse: collapse;} 
.printtable table td{

} 
.tabletd
{
border:1px solid;
text-align:center;
font-size:18px;
font-family:宋体;
width:145px;
height:35px;
}
.tabletd2{
border:1px solid;
text-align:center;
font-size:18px;
font-family:宋体;
width:145px;
height:200px;
}
.tabletd3{
border:1px solid;
text-align:center;
font-size:18px;
font-family:宋体;
width:145px;
height:45px;
}
</style>
</head>

<body>
	<center>
	<div class="printtable">
	<div class="tablehead">武汉理工大学专业分流志愿申请表</div>
	<center>
	<table>
	<tr>
	<td class="tabletd">学号</td><td class="tabletd"><%=selfstudent.getStuNo() %></td>
	<td class="tabletd">姓名</td class="tabletd"><td class="tabletd"><%=selfstudent.getStuName() %></td>
	</tr>
	<tr>
	<td class="tabletd">性别</td><td class="tabletd"><%=selfstudent.getSex() %></td>
	<td class="tabletd">学院</td><td class="tabletd"><%=selfstudent.getStuSchool() %></td>
	</tr>
	<tr>
	<td class="tabletd">年级</td><td class="tabletd"><%=selfstudent.getStuGrade() %></td>
	<td class="tabletd">专业</td><td class="tabletd"><%=selfstudent.getOldDeparment() %></td>
	</tr>
	<tr>
	<td class="tabletd">班级</td><td class="tabletd"><%=selfstudent.getOldClass() %></td>
	<td class="tabletd">总分</td><td class="tabletd"><%=selfstudent.getBasicScore()+selfstudent.getExtraScore() %></td>
	</tr>
	<tr>
	<td class="tabletd">基础分</td><td class="tabletd"><%=selfstudent.getBasicScore() %></td>
	<td class="tabletd">附加分</td><td class="tabletd"><%=selfstudent.getExtraScore() %></td>
	</tr>
	<tr><td colspan="4" class="tabletd">志愿信息</td></tr>
	<% 
	for(int i=0;i<departments.size();i++)
	{
		%>
		<tr><td class="tabletd">志愿<%=i+1 %></td><td class="tabletd" colspan="3"><%=studep.get(i) %></td></tr>
		<% 
	}
	
	Timestamp ts = selfstudent.getUpdateTime();  
    String tsStr = "";  
    DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
    try {  
        //方法一  
        tsStr = sdf.format(ts);  
        System.out.println(tsStr);  
        //方法二  
        tsStr = ts.toString();  
        System.out.println(tsStr);  
    } catch (Exception e) {  
        e.printStackTrace();  
    } 
    
	%>
	<tr><td class="tabletd2">申请理由</td><td  class="tabletd2" colspan="3"></td></tr>
	<tr><td class="tabletd3">申请人签名</td><td class="tabletd3"></td><td class="tabletd3">修改时间</td><td class="tabletd3"><%=tsStr %></td></tr>
	</table>
	</center>
	</div>
	</center>
</body>
</html>