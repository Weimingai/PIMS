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
	<a href="../login.jsp">��������½</a>
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
			alert("����������������һ�£�");
		</script>
		<% 
	}else if(newPassword1.equals(newPassword2))
	{	
		try{
			AdminMgr.getInstance().updatePassword(admin,newPassword1);
		}catch(UserNotFoundException e){
			%>
			<script type="text/javascript">
				alert("�ù���Ա�˺Ų�����");
				window.history.back(-1);
			</script>
			<%
			isupdate=false;
		}
		
		if(isupdate==true)
		{
			%>
				<script type="text/javascript">
					alert("����Ա��<%=admin.getUsername()%>�������޸ĳɹ���");
				</script>
			<% 
			//��������һ��session
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
			alert("��ѧ��������");
			window.history.back(-1);
		</script>
		<%
		isUpdate=false;
	}
	
	if(isUpdate==true)
	{
		%>
			<script type="text/javascript">
				alert("ѧ����<%=student.getStuName()%>�������ʼ���ɹ���");
			</script>
		<% 
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
.mianbasic
{
margin-top:60px;
margin-left:200px;
text-align:left;

font-family:΢���ź�;
font-size:16px;
}
.wenhou{
font-family:΢���ź�;
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
font-family:����;
font-size:18px;
}
</style>
</head>
<body>
<center>
	<div class="mianbasic">
	<div class="wenhou">��ӭ����<%=useradmin.getUsername() %></div>
	<br />
	<h2>���ù���Ա����</h2>
	<form name="adminpwdset" action="basicset.jsp" method="post">
	<input type="hidden" name="action" value="adpwdset" />
	�����룺<input class="form-control" type="password" name="newpassword1" />
	ȷ�����룺<input class="form-control" type="password" name="newpassword2" />
	<input class="btn" type="submit" value="ȷ��">
	</form>
	<br />
	<h2>����ѧ������</h2>
	<form name="studentpwdset" action="basicset.jsp" method="post">
	<input type="hidden" name="action" value="stupwdset" />
	ѧ�ţ�<input class="form-control" type="text" name="stuno" />
	<input class="btn" type="submit" value="��ʼ������">
	</form>
	</div>
</center>
</body>
</html>