<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*,java.sql.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
//BUG���޸�רҵ���޷��Զ�ˢ�£�רҵ�������Ĵ��뻹û��ʵ��

request.setCharacterEncoding("gb2312");
/*
Time time=new Time();
TimeMgr.getInstance().getTime(time);
*/
List<Department> departments=new ArrayList<Department>();
departments=DepartmentMgr.getInstance().getDepartment();

Student sessionstudent=null;
sessionstudent=(Student)session.getAttribute("user");
Student selfstudent=StudentMgr.getInstance().getStudent(sessionstudent.getStuNo());

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
<title>־Ըѡ�����</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- ��ѡ�� Bootstrap �����ļ���һ�㲻�����룩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:΢���ź�;
}
a{ 
text-decoration:none;
}
a:link {
	color:#000000;
}
a:visited {
	color:#000000;
}
a:hover {
	color:#000000;
}
.title{
	margin-top:20px;
	margin-bottom:20px;
	text-align:center;
	font-family:΢���ź�;
	font-size:25px;
}
.wishtable table{
	border-collapse: collapse;
}
.wishdisply td{
	border:1px solid;
	text-align:center;
	font-size:18px;
	font-family:����;
	width:200px;
	height:35px;
}
.ah{
margin-top:20px;
margin-bottom:20px;
}
.btn{
}
.btn2{
font-family:΢���ź�;
margin-left:130px;
}
</style>
</head>
<body>
<div class="title">־Ըѡ�����</div>
<div class="wishtable">
<center>
<table class="wishdisply">
<% 
for(int i=0;i<departments.size();i++)
{
	%>
	<tr>
	<td>��<%=i+1 %>־Ը</td><td><%=studep.get(i) %></td>
	</tr>
	<% 
}
%>
</table>
</center>
</div>
<center>
<div class="ah">
<a href="wishselect.jsp"><button class="btn">�޸�</button></a>
<a href="wishprint.jsp" target="_top"><button class="btn btn2">��ӡԤ��</button></a>
</div>
</center>
</body>
</html>