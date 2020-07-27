<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="com.wangxinwei.model.*,com.wangxinwei.dao.*,com.wangxinwei.Mgr.*,java.util.*" %>
<%@ include file="_sessioncheck.jsp" %>

<%
request.setCharacterEncoding("gb2312");
%>

<%
//分页 有总页数的返回
String action=request.getParameter("action");
String strStuNo=request.getParameter("stuno");
System.out.println(request.getParameter("stuno"));
System.out.println(strStuNo);
Student student=null;
if(action!=null&&action.trim().equals("modify")){
	if(strStuNo!=null&&!strStuNo.equals(""))
	{
		student=StudentMgr.getInstance().getStudent(strStuNo);
	}
}else if(action.equals("formmodify"))
{
	
		String strBasicScore=request.getParameter("basicscore");
		String strExtraScore=request.getParameter("extrascore");
		student=StudentMgr.getInstance().getStudent(strStuNo);
		System.out.println(strStuNo);
		System.out.println(student.getStuNo());
		StudentMgr.getInstance().updateStuInfo(student,strBasicScore,strExtraScore);
		%>
		<script type="text/javascript">
		alert("修改成功！");
		window.location.href="studentmodify.jsp?stuno=<%=student.getStuNo()%>&action=modify";
		</script>
		<%	
}
else
{
	%>
	<script type="text/javascript">
		alert("密码不正确");
		window.history.back(-1);
	</script>
	<%
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>修改学生信息</title>
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
.btns
{
width:80px;
margin-left:200px;
}
</style>
</head>
<body>
	<form name="stumodify" action="studentmodify.jsp" method="post">
		<input type="hidden" name="action" value="formmodify" />
		<input type="hidden" name="stuno" value=<%=student.getStuNo() %> />
		<table border="1" class="table table-bordered">
			<tr>
				<td>学号</td>
				<td><%=student.getStuNo() %></td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><%=student.getStuName() %></td>
			</tr>
			</tr>
			<tr>
				<td>性别</td>
				<td><%=student.getSex() %></td>
			</tr>
			<tr>
				<td>学院</td>
				<td><%=student.getStuSchool() %></td>
			</tr>
			<tr>
				<td>年级</td>
				<td><%=student.getStuGrade() %></td>
			</tr>
			<tr>
				<td>原专业</td>
				<td><%=student.getOldDeparment() %></td>
			</tr>
			<tr>
				<td>原班级</td>
				<td><%=student.getOldClass() %></td>
			</tr>
			<tr>
				<td>基础分</td>
				<td><input type="text" name="basicscore" value=<%=student.getBasicScore() %> /></td>
			</tr>
			<tr>
				<td>附加分</td>
				<td><input type="text" name="extrascore" value=<%=student.getExtraScore() %> /></td>
			</tr>
			<tr>
				<td>总分</td>
				<td><%=student.getBasicScore()+student.getExtraScore() %></td>
			</tr>
			<tr>
				<td colspan="2"><input class="btn btns" type="submit" value="确认"></td>
			</tr>
		</table>
	</form>
</body>
</html>