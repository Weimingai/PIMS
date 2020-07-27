<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");
Admin useradmin=(Admin)session.getAttribute("user");
if(useradmin==null)
{
	out.println("You havn't logged in!");
	%>
	<a href="../login.jsp">点击这里登陆</a>
	<%
	return;
}

String actionset=request.getParameter("action");
if(actionset!=null&&actionset.equals("adpwdset"))
{
	String newPassword1=request.getParameter("newpassword1");
	String newPassword2=request.getParameter("newpassword2");
	boolean isupdate=true;
	if(!newPassword1.equals(newPassword2))
	{
		%>
		<script type="text/javascript">
			alert("两次输入的密码必须一致！");
		</script>
		<% 
	}else if(newPassword1.equals(newPassword2))
	{	
		try{
			AdminMgr.getInstance().updatePassword(admin,newPassword1);
		}catch(UserNotFoundException e){
			%>
			<script type="text/javascript">
				alert("该管理员账号不存在");
				window.history.back(-1);
			</script>
			<%
			isupdate=false;
		}
		
		if(isupdate==true)
		{
			%>
				<script type="text/javascript">
					alert("管理员：<%=admin.getUsername()%>，密码修改成功！");
				</script>
			<% 
			//重新设置一下session
			session.setAttribute("user",admin);
		}
	}
}
else if(actionset!=null&&actionset.equals("stupwdset"))
{
	String stuNo=request.getParameter("stuno");
	Student student=new Student();
	boolean isUpdate=true;
	try{
		StudentMgr.getInstance().initPassword(student,stuNo);
	}catch(UserNotFoundException e){
		%>
		<script type="text/javascript">
			alert("该学生不存在");
			window.history.back(-1);
		</script>
		<%
		isUpdate=false;
	}
	
	if(isUpdate==true)
	{
		%>
			<script type="text/javascript">
				alert("学生：<%=student.getStuName()%>，密码初始化成功！");
			</script>
		<% 
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>基本信息设置</title>
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
.mianbasic
{
margin-top:60px;
margin-left:200px;
text-align:left;

font-family:微软雅黑;
font-size:16px;
}
.wenhou{
font-family:微软雅黑;
font-size:16px;
text-align:left;
}
.form-control{
width:300px;
}
.btn{
margin-top:10px;
}
h2{
margin-top:10px;
font-family:黑体;
font-size:18px;
}
</style>
</head>
<body>
<center>
	<div class="mianbasic">
	<div class="wenhou">欢迎您！<%=useradmin.getUsername() %></div>
	<br />
	<h2>设置管理员密码</h2>
	<form name="adminpwdset" action="basicset.jsp" method="post">
	<input type="hidden" name="action" value="adpwdset" />
	新密码：<input class="form-control" type="password" name="newpassword1" />
	确认密码：<input class="form-control" type="password" name="newpassword2" />
	<input class="btn" type="submit" value="确定">
	</form>
	<br />
	<h2>设置学生密码</h2>
	<form name="studentpwdset" action="basicset.jsp" method="post">
	<input type="hidden" name="action" value="stupwdset" />
	学号：<input class="form-control" type="text" name="stuno" />
	<input class="btn" type="submit" value="初始化密码">
	</form>
	</div>
</center>
</body>
</html>