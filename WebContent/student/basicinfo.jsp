<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");
Student selfstudent=(Student)session.getAttribute("user");

if(selfstudent==null)
{
	out.println("You havn't logged in!");
	%>
	<a href="../login.jsp">��������½</a>
	<%
	return;
}

Time time=new Time();
TimeMgr.getInstance().getTime(time);

String actionset=request.getParameter("action");
if(actionset!=null&&actionset.equals("uppwd"))
{
	String newPassword=request.getParameter("newpwd");
	if(newPassword!=null&&!newPassword.equals(""))
	{
		StudentMgr.getInstance().updatePassword(selfstudent, newPassword);
		%>
			<script type="text/javascript">
				alert("ѧ����<%=selfstudent.getStuName()%>�������޸ĳɹ���");
			</script>
		<% 
		//��������һ��session
		session.setAttribute("user",selfstudent);
	
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>������Ϣ����</title>
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
	font-size:20px;
}
.infomain table{
	border-collapse: collapse;
}
.infomain td{
	border:1px solid;
	text-align:center;
	font-size:18px;
	font-family:����;
	width:150px;
	height:30px;
}
.title2{
	margin-top:60px;
	margin-bottom:20px;
	text-align:center;
	font-family:΢���ź�;
	font-size:20px;
}
.pwdtable td{
	text-align:center;
	font-size:18px;
	font-family:΢���ź�;
	width:150px;
	height:30px;
}
.form-control{
width:250px;
}
.btn{
width:80px;
}

</style>
</head>
<body>
	<div class="title">������Ϣ����</div>
	<div class="infomain">
	<center>
	<table>
	<tr>
	<td>ѧ��</td><td><%=selfstudent.getStuNo() %></td>
	<td>����</td><td><%=selfstudent.getStuName() %></td>
	</tr>
	<tr>
	<td>�Ա�</td><td><%=selfstudent.getSex() %></td>
	<td>ѧԺ</td><td><%=selfstudent.getStuSchool() %></td>
	</tr>
	<tr>
	<td>�꼶</td><td><%=selfstudent.getStuGrade() %></td>
	<td>�༶</td><td><%=selfstudent.getOldClass() %></td>
	</tr>
	<tr>
	<td>ԭרҵ</td><td><%=selfstudent.getOldDeparment() %></td>
	<%
	if(selfstudent.getNewDeparment()!=null&&!selfstudent.getNewDeparment().equals(""))
	{
		%>
		<td>������רҵ</td><td><%=selfstudent.getNewDeparment() %></td>
		<% 
	}else
	{
		%>
		<td>������רҵ</td><td><font color="red">δ����</font></td>
		<%
	}
	%>
	</tr>
	<tr>
	<td colspan="4">�ɼ���Ϣ</td>
	</tr>
	<tr>
	<td>������</td><td><%=selfstudent.getBasicScore() %></td>
	<td>���ӷ�</td><td><%=selfstudent.getExtraScore() %></td>
	</tr>
	<tr>
	<td>�ܷ�</td><td><%=selfstudent.getBasicScore()+selfstudent.getExtraScore() %></td>
	<td>����</td><td><%=selfstudent.getStuRank() %></td>
	</tr>
	<tr>
	<td>
	�ʱ��Σ�
	</td>
	<td colspan="3">
	<font color="red"><%=time.getStartTime() %>-<%=time.getEndTime() %></font>
	</td>
	</tr>
	</table>
	</center>
	</div>
	
	<div class="pwdtable">
	<center>
	<div class="title2">�޸�����</div>
	<form name="updatepwd" action="basicinfo.jsp" method="post">
	<input class="btn" type="hidden" name="action" value="uppwd">
	<table>
	<tr>
	<td>����������</td><td><input class="form-control" type="password" name="newpwd" /></td>
	<td><input class="btn" type="submit" value="ȷ��" /></td>
	</tr>
	</table>
	</form>
	</center>
	</div>
</body>
</html>