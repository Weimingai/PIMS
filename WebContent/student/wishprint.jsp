<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*,java.text.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//Bug��־��mysql��ѯ������ʱ����mysqlʵ�ʴ洢ʱ���8��Сʱ
//��������������ݿ������ַ�������Ӳ���&serverTimezone=Hongkong
request.setCharacterEncoding("gb2312");
Student sessionstudent=(Student)session.getAttribute("user");

Student selfstudent=StudentMgr.getInstance().getStudent(sessionstudent.getStuNo());

if(selfstudent==null)
{
	out.println("You havn't logged in!");
	%>
	<a href="../login.jsp">��������½</a>
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
<title>�人����ѧרҵ����־Ը�����</title>
<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:΢���ź�;
}
.printtable{
	text-align:center;
}
.tablehead{
text-align:center;
font-size:30px;
font-family:����;
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
font-family:����;
width:145px;
height:35px;
}
.tabletd2{
border:1px solid;
text-align:center;
font-size:18px;
font-family:����;
width:145px;
height:200px;
}
.tabletd3{
border:1px solid;
text-align:center;
font-size:18px;
font-family:����;
width:145px;
height:45px;
}
</style>
</head>

<body>
	<center>
	<div class="printtable">
	<div class="tablehead">�人����ѧרҵ����־Ը�����</div>
	<center>
	<table>
	<tr>
	<td class="tabletd">ѧ��</td><td class="tabletd"><%=selfstudent.getStuNo() %></td>
	<td class="tabletd">����</td class="tabletd"><td class="tabletd"><%=selfstudent.getStuName() %></td>
	</tr>
	<tr>
	<td class="tabletd">�Ա�</td><td class="tabletd"><%=selfstudent.getSex() %></td>
	<td class="tabletd">ѧԺ</td><td class="tabletd"><%=selfstudent.getStuSchool() %></td>
	</tr>
	<tr>
	<td class="tabletd">�꼶</td><td class="tabletd"><%=selfstudent.getStuGrade() %></td>
	<td class="tabletd">רҵ</td><td class="tabletd"><%=selfstudent.getOldDeparment() %></td>
	</tr>
	<tr>
	<td class="tabletd">�༶</td><td class="tabletd"><%=selfstudent.getOldClass() %></td>
	<td class="tabletd">�ܷ�</td><td class="tabletd"><%=selfstudent.getBasicScore()+selfstudent.getExtraScore() %></td>
	</tr>
	<tr>
	<td class="tabletd">������</td><td class="tabletd"><%=selfstudent.getBasicScore() %></td>
	<td class="tabletd">���ӷ�</td><td class="tabletd"><%=selfstudent.getExtraScore() %></td>
	</tr>
	<tr><td colspan="4" class="tabletd">־Ը��Ϣ</td></tr>
	<% 
	for(int i=0;i<departments.size();i++)
	{
		%>
		<tr><td class="tabletd">־Ը<%=i+1 %></td><td class="tabletd" colspan="3"><%=studep.get(i) %></td></tr>
		<% 
	}
	
	Timestamp ts = selfstudent.getUpdateTime();  
    String tsStr = "";  
    DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");  
    try {  
        //����һ  
        tsStr = sdf.format(ts);  
        System.out.println(tsStr);  
        //������  
        tsStr = ts.toString();  
        System.out.println(tsStr);  
    } catch (Exception e) {  
        e.printStackTrace();  
    } 
    
	%>
	<tr><td class="tabletd2">��������</td><td  class="tabletd2" colspan="3"></td></tr>
	<tr><td class="tabletd3">������ǩ��</td><td class="tabletd3"></td><td class="tabletd3">�޸�ʱ��</td><td class="tabletd3"><%=tsStr %></td></tr>
	</table>
	</center>
	</div>
	</center>
</body>
</html>