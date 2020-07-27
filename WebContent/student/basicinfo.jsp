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
	<a href="../login.jsp">点击这里登陆</a>
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
				alert("学生：<%=selfstudent.getStuName()%>，密码修改成功！");
			</script>
		<% 
		//重新设置一下session
		session.setAttribute("user",selfstudent);
	
	}
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>基本信息界面</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style type="text/css">
*{
	padding:0; 
	margin:0;
	font-family:微软雅黑;
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
	font-family:微软雅黑;
	font-size:20px;
}
.infomain table{
	border-collapse: collapse;
}
.infomain td{
	border:1px solid;
	text-align:center;
	font-size:18px;
	font-family:宋体;
	width:150px;
	height:30px;
}
.title2{
	margin-top:60px;
	margin-bottom:20px;
	text-align:center;
	font-family:微软雅黑;
	font-size:20px;
}
.pwdtable td{
	text-align:center;
	font-size:18px;
	font-family:微软雅黑;
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
	<div class="title">基本信息设置</div>
	<div class="infomain">
	<center>
	<table>
	<tr>
	<td>学号</td><td><%=selfstudent.getStuNo() %></td>
	<td>姓名</td><td><%=selfstudent.getStuName() %></td>
	</tr>
	<tr>
	<td>性别</td><td><%=selfstudent.getSex() %></td>
	<td>学院</td><td><%=selfstudent.getStuSchool() %></td>
	</tr>
	<tr>
	<td>年级</td><td><%=selfstudent.getStuGrade() %></td>
	<td>班级</td><td><%=selfstudent.getOldClass() %></td>
	</tr>
	<tr>
	<td>原专业</td><td><%=selfstudent.getOldDeparment() %></td>
	<%
	if(selfstudent.getNewDeparment()!=null&&!selfstudent.getNewDeparment().equals(""))
	{
		%>
		<td>分流后专业</td><td><%=selfstudent.getNewDeparment() %></td>
		<% 
	}else
	{
		%>
		<td>分流后专业</td><td><font color="red">未分流</font></td>
		<%
	}
	%>
	</tr>
	<tr>
	<td colspan="4">成绩信息</td>
	</tr>
	<tr>
	<td>基础分</td><td><%=selfstudent.getBasicScore() %></td>
	<td>附加分</td><td><%=selfstudent.getExtraScore() %></td>
	</tr>
	<tr>
	<td>总分</td><td><%=selfstudent.getBasicScore()+selfstudent.getExtraScore() %></td>
	<td>排名</td><td><%=selfstudent.getStuRank() %></td>
	</tr>
	<tr>
	<td>
	填报时间段：
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
	<div class="title2">修改密码</div>
	<form name="updatepwd" action="basicinfo.jsp" method="post">
	<input class="btn" type="hidden" name="action" value="uppwd">
	<table>
	<tr>
	<td>输入新密码</td><td><input class="form-control" type="password" name="newpwd" /></td>
	<td><input class="btn" type="submit" value="确定" /></td>
	</tr>
	</table>
	</form>
	</center>
	</div>
</body>
</html>